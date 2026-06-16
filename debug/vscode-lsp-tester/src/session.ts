import * as net from "net";
import * as vscode from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  Middleware,
  ServerOptions,
  State,
  StreamInfo,
  Trace,
  HoverRequest,
  CompletionRequest,
  DefinitionRequest,
  ReferencesRequest,
  DocumentSymbolRequest,
  ErrorAction,
  CloseAction,
} from "vscode-languageclient/node";
import { TracingChannel } from "./tracing";
import { LspStatsCollector } from "./stats";

type HoverContents = vscode.Hover["contents"];

function hoverContentsToString(contents: HoverContents): string {
  const entries = Array.isArray(contents) ? contents : [contents];
  const text = entries
    .map((entry) => {
      if (entry instanceof vscode.MarkdownString) return entry.value;
      if (typeof entry === "string") return entry;
      // MarkedString object: { language, value }
      return "value" in entry ? entry.value : JSON.stringify(entry);
    })
    .join(" | ");
  const sliced = text.slice(0, 200);
  return text.length > 200 ? sliced + "..." : sliced;
}

function formatLoc(
  target: vscode.Uri | vscode.TextDocument | vscode.Location | vscode.LocationLink | { uri: vscode.Uri; range?: vscode.Range },
  pos?: vscode.Position
): string {
  let uri: vscode.Uri;
  let range: vscode.Range | undefined;

  if (target instanceof vscode.Uri) {
    uri = target;
  } else if ("uri" in target) {
    uri = target.uri;
    if ("range" in target) {
      range = target.range;
    }
  } else if ("targetUri" in target) {
    uri = target.targetUri;
    range = target.targetRange;
  } else {
    return "unknown";
  }

  const file = uri.fsPath.split("/").pop() ?? uri.fsPath;
  const position = pos ?? range?.start;
  return position ? `${file}:${position.line}:${position.character}` : file;
}

export class LspTesterSession implements vscode.Disposable {
  private client: LanguageClient | undefined;
  private stopping = false;
  private reconnectTimer: ReturnType<typeof setTimeout> | undefined;
  private connectRetryTimer: ReturnType<typeof setTimeout> | undefined;
  private readonly statusBarItem: vscode.StatusBarItem;
  private readonly traceOutputChannel: TracingChannel;
  private readonly logChannel: vscode.LogOutputChannel;

  constructor(
    private readonly context: vscode.ExtensionContext,
    private readonly statsCollector: LspStatsCollector,
  ) {
    this.traceOutputChannel = new TracingChannel("LSP Test Server — Trace");
    this.logChannel = vscode.window.createOutputChannel(
      "LSP Test Server — Log",
      { log: true },
    );
    this.statusBarItem = vscode.window.createStatusBarItem(
      vscode.StatusBarAlignment.Left,
    );
    this.statusBarItem.show();
    context.subscriptions.push(
      this.traceOutputChannel,
      this.logChannel,
      this.statusBarItem,
    );
  }

  start(): void {
    this.stopping = false;
    void this.prepareAndStartClient();
  }

  private async prepareAndStartClient(): Promise<void> {
    await this.disposeClient();

    if (this.stopping) {
      return;
    }

    this.client = this.createClient();
    this.client.onDidChangeState((e) => {
      if (e.newState === State.Running) {
        this.statusBarItem.text = "$(check) LSP: connected";
        this.statusBarItem.tooltip = "LSP Test Server — click to show output";
        this.statusBarItem.command = "lspTester.showOutput";
      } else if (e.newState === State.Stopped && !this.stopping) {
        this.statusBarItem.text = "$(error) LSP: disconnected";
        this.statusBarItem.tooltip = "Click to show output";
        this.statusBarItem.command = "lspTester.showOutput";
      }
    });

    this.updateTraceLevel();

    try {
      await this.client.start();
    } catch (err) {
      if (this.stopping) {
        this.logChannel.info("Language Client start aborted during shutdown.");
        return;
      }

      this.logChannel.error(
        `Failed to start Language Client: ${err instanceof Error ? err.message : err}`
      );

      const autoReconnect = vscode.workspace
        .getConfiguration("lspTester")
        .get<boolean>("autoReconnect", true);

      if (autoReconnect) {
        this.logChannel.info("Retrying connection to LSP Test Server in 5 seconds...");
        this.statusBarItem.text = "$(warning) LSP: retrying connection in 5s...";
        this.statusBarItem.tooltip = "Failed to connect. Retrying...";
        this.statusBarItem.command = "lspTester.showOutput";

        clearTimeout(this.reconnectTimer);
        this.reconnectTimer = setTimeout(() => {
          if (!this.stopping) {
            this.start();
          }
        }, 5000);
      }
    }
  }

  updateTraceLevel(): void {
    if (!this.client) return;
    const traceString = vscode.workspace
      .getConfiguration("lspTester")
      .get<string>("trace.server", "verbose");

    let traceValue = Trace.Off;
    if (traceString === "messages") {
      traceValue = Trace.Messages;
    } else if (traceString === "verbose") {
      traceValue = Trace.Verbose;
    }
    this.client.setTrace(traceValue);
  }

  async restart(): Promise<void> {
    this.stopping = true;
    await this.disposeClient();
    this.stopping = false;
    this.start();
    vscode.window.showInformationMessage("LSP Tester: Server restarted.");
  }

  async stop(): Promise<void> {
    this.stopping = true;
    await this.disposeClient();
    this.statusBarItem.text = "$(circle-slash) LSP: stopped";
    this.statusBarItem.tooltip = "LSP Test Server is stopped";
    this.statusBarItem.command = undefined;
  }

  private async disposeClient(): Promise<void> {
    clearTimeout(this.reconnectTimer);
    this.reconnectTimer = undefined;
    clearTimeout(this.connectRetryTimer);
    this.connectRetryTimer = undefined;

    if (this.client) {
      const clientToDispose = this.client;
      this.client = undefined;
      try {
        await clientToDispose.stop();
      } catch (err) {
        // Ignore stopping errors
      }
      try {
        await clientToDispose.dispose();
      } catch (err) {
        // Ignore disposal errors
      }
    }
  }

  showOutput(): void {
    this.traceOutputChannel.show();
  }

  showLog(): void {
    this.logChannel.show();
  }

  dispose(): void {
    void this.stop();
    this.statusBarItem.dispose();
    this.traceOutputChannel.dispose();
    this.logChannel.dispose();
  }

  private async runTracked<T>(
    method: string,
    action: () => Thenable<T>,
    logOnSuccess: (result: T) => string | undefined
  ): Promise<T> {
    const start = Date.now();
    let success = false;
    try {
      const result = await action();
      success = true;
      const logMessage = logOnSuccess(result);
      if (logMessage) {
        this.logChannel.info(logMessage);
      }
      return result;
    } catch (err) {
      this.logChannel.error(`[${method}] Error: ${err instanceof Error ? err.message : err}`);
      throw err;
    } finally {
      this.statsCollector.recordRequest(method, Date.now() - start, success);
    }
  }

  private createMiddleware(): Middleware {
    return {
      provideHover: (doc, pos, token, next) =>
        this.runTracked(HoverRequest.method, async () => await next(doc, pos, token), (res) => {
          const loc = formatLoc(doc, pos);
          return res
            ? `[hover] ${loc} → ${hoverContentsToString(res.contents)}`
            : `[hover] ${loc} → null`;
        }),

      provideCompletionItem: (doc, pos, ctx, token, next) =>
        this.runTracked(CompletionRequest.method, async () => await next(doc, pos, ctx, token), (res) => {
          const loc = formatLoc(doc, pos);
          const items = Array.isArray(res) ? res : res?.items ?? [];
          let labels = items.map(i => typeof i.label === "string" ? i.label : i.label.label).join(", ");
          if (labels.length > 200) {
            labels = labels.slice(0, 197) + "...";
          }
          return `[completion] ${loc} → ${items.length} items: ${labels}`;
        }),

      provideDefinition: (doc, pos, token, next) =>
        this.runTracked(DefinitionRequest.method, async () => await next(doc, pos, token), (res) => {
          const loc = formatLoc(doc, pos);
          if (res) {
            const locations = Array.isArray(res) ? res : [res];
            const targets = locations.map(l => formatLoc(l)).join(", ");
            return `[definition] ${loc} → ${locations.length} targets: ${targets}`;
          }
          return `[definition] ${loc} → null`;
        }),

      provideReferences: (doc, pos, ctx, token, next) =>
        this.runTracked(ReferencesRequest.method, async () => await next(doc, pos, ctx, token), (res) => {
          const loc = formatLoc(doc, pos);
          if (res) {
            const targets = res.map(l => formatLoc(l)).join(", ");
            return `[references] ${loc} → ${res.length} refs: ${targets}`;
          }
          return `[references] ${loc} → null`;
        }),

      provideDocumentSymbols: (doc, token, next) =>
        this.runTracked(DocumentSymbolRequest.method, async () => await next(doc, token), (res) => {
          const file = formatLoc(doc);
          if (res) {
            const names = res.map(s => s.name).join(", ");
            return `[documentSymbols] ${file} → ${res.length} symbols: ${names}`;
          }
          return `[documentSymbols] ${file} → null`;
        }),
    };
  }

  private createClient(): LanguageClient {
    const port = vscode.workspace
      .getConfiguration("lspTester")
      .get<number>("serverPort", 2087);

    const serverOptions: ServerOptions = (): Promise<StreamInfo> =>
      new Promise((resolve, reject) => {
        const tryConnect = (attemptsLeft: number) => {
          if (this.stopping) {
            reject(new Error("Connection attempt aborted (stopping)"));
            return;
          }
          this.statusBarItem.text = `$(loading~spin) LSP: connecting... (${attemptsLeft} left)`;
          const socket = net.createConnection({ port, host: "127.0.0.1" });
          socket.once("connect", () => {
            if (this.stopping) {
              socket.destroy();
              reject(new Error("Connection succeeded but was aborted"));
              return;
            }
            resolve({ reader: socket, writer: socket });
          });
          socket.once("error", (err: NodeJS.ErrnoException) => {
            socket.destroy();
            if (this.stopping) {
              reject(new Error("Connection attempt aborted on error"));
              return;
            }
            if (err.code === "ECONNREFUSED" && attemptsLeft > 0) {
              const delay = Math.min(
                500 * Math.pow(2, 10 - attemptsLeft),
                8000,
              );
              this.connectRetryTimer = setTimeout(() => tryConnect(attemptsLeft - 1), delay);
            } else {
              this.statusBarItem.text = "$(error) LSP: connection failed";
              this.statusBarItem.command = "lspTester.showOutput";
              reject(err);
            }
          });
        };
        tryConnect(10);
      });

    const clientOptions: LanguageClientOptions = {
      documentSelector: [{ scheme: "file", language: "lsptxt" }],
      outputChannelName: "LSP Test Server",
      traceOutputChannel: this.traceOutputChannel,
      middleware: this.createMiddleware(),
      synchronize: {
        configurationSection: "lspTester",
      },
      errorHandler: {
        error: () => {
          return { action: ErrorAction.Continue };
        },
        closed: () => {
          const autoReconnect = vscode.workspace
            .getConfiguration("lspTester")
            .get<boolean>("autoReconnect", true);
          if (autoReconnect && !this.stopping) {
            return new Promise((resolve) => {
              this.reconnectTimer = setTimeout(() => {
                resolve({ action: CloseAction.Restart });
              }, 2000);
            });
          }
          return { action: CloseAction.DoNotRestart };
        }
      }
    };

    return new LanguageClient(
      "lspTester",
      "LSP Tester",
      serverOptions,
      clientOptions,
    );
  }
}
