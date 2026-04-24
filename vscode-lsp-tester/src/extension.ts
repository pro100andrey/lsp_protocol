import * as net from "net";
import * as vscode from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  Middleware,
  ServerOptions,
  State,
  StreamInfo,
} from "vscode-languageclient/node";

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
  return text.slice(0, 200);
}

/** Routes vscode-languageclient appendLine calls to LogOutputChannel log levels. */
class TracingChannel implements vscode.OutputChannel {
  readonly name: string;
  private readonly inner: vscode.LogOutputChannel;

  constructor(name: string) {
    this.inner = vscode.window.createOutputChannel(name, { log: true });
    this.name = this.inner.name;
  }

  appendLine(line: string): void {
    // vscode-languageclient prepends "[Trace - H:MM:SS AM/PM] " — strip it to
    // avoid duplicate timestamps from LogOutputChannel.
    const stripped = line.replace(/^\[Trace - \d+:\d+:\d+ [AP]M\] /, "");
    if (/\berror\b|\bfailed\b/i.test(stripped)) {
      this.inner.error(stripped);
    } else if (/Sending (request|notification)/i.test(stripped)) {
      this.inner.info(stripped);
    } else if (/Received (response|notification)/i.test(stripped)) {
      this.inner.info(stripped);
    } else {
      // JSON bodies (Params/Result/braces) and empty lines.
      this.inner.info(stripped);
    }
  }

  append(value: string): void {
    this.inner.append(value);
  }
  replace(value: string): void {
    this.inner.replace(value);
  }
  clear(): void {
    this.inner.clear();
  }
  show(column?: vscode.ViewColumn | boolean, preserveFocus?: boolean): void {
    if (typeof column === "boolean") {
      this.inner.show(column);
    } else {
      this.inner.show(preserveFocus);
    }
  }
  hide(): void {
    this.inner.hide();
  }
  dispose(): void {
    this.inner.dispose();
  }
}

class LspTesterSession {
  private client: LanguageClient | undefined;
  private stopping = false;
  private reconnectTimer: ReturnType<typeof setTimeout> | undefined;
  private readonly statusBarItem: vscode.StatusBarItem;
  private readonly traceOutputChannel: TracingChannel;
  private readonly logChannel: vscode.LogOutputChannel;

  constructor(private readonly context: vscode.ExtensionContext) {
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
        const autoReconnect = vscode.workspace
          .getConfiguration("lspTester")
          .get<boolean>("autoReconnect", true);
        if (autoReconnect) {
          clearTimeout(this.reconnectTimer);
          this.reconnectTimer = setTimeout(() => void this.restart(), 2000);
        }
      }
    });
    this.client.start();
  }

  async restart(): Promise<void> {
    clearTimeout(this.reconnectTimer);
    this.stopping = true;
    await this.client?.stop();
    this.start();
    vscode.window.showInformationMessage("LSP Tester: server restarted.");
  }

  async stop(): Promise<void> {
    clearTimeout(this.reconnectTimer);
    this.stopping = true;
    await this.client?.stop();
  }

  showOutput(): void {
    this.traceOutputChannel.show();
  }

  showLog(): void {
    this.logChannel.show();
  }

  private createMiddleware(): Middleware {
    const log = this.logChannel;
    return {
      provideHover: async (doc, pos, token, next) => {
        const result = await next(doc, pos, token);
        const file = doc.uri.fsPath.split("/").pop() ?? doc.uri.fsPath;
        const loc = `${file} ${pos.line}:${pos.character}`;
        if (result) {
          const text = hoverContentsToString(result.contents);
          log.info(`[hover] ${loc} → ${text}`);
        } else {
          log.warn(`[hover] ${loc} → null`);
        }
        return result;
      },
      provideCompletionItem: async (doc, pos, ctx, token, next) => {
        const result = await next(doc, pos, ctx, token);
        const file = doc.uri.fsPath.split("/").pop() ?? doc.uri.fsPath;
        const loc = `${file} ${pos.line}:${pos.character}`;
        const items = Array.isArray(result)
          ? result
          : result instanceof vscode.CompletionList
            ? result.items
            : [];
        const labels = items
          .map((i) => (typeof i.label === "string" ? i.label : i.label.label))
          .join(", ");
        log.info(`[completion] ${loc} → ${items.length} items: ${labels}`);
        return result;
      },
    };
  }

  private createClient(): LanguageClient {
    const port = vscode.workspace
      .getConfiguration("lspTester")
      .get<number>("serverPort", 2087);

    const serverOptions: ServerOptions = (): Promise<StreamInfo> =>
      new Promise((resolve, reject) => {
        const tryConnect = (attemptsLeft: number) => {
          this.statusBarItem.text = `$(loading~spin) LSP: connecting... (${attemptsLeft} left)`;
          const socket = net.createConnection({ port, host: "127.0.0.1" });
          socket.once("connect", () =>
            resolve({ reader: socket, writer: socket }),
          );
          socket.once("error", (err: NodeJS.ErrnoException) => {
            socket.destroy();
            if (err.code === "ECONNREFUSED" && attemptsLeft > 0) {
              const delay = Math.min(
                500 * Math.pow(2, 10 - attemptsLeft),
                8000,
              );
              setTimeout(() => tryConnect(attemptsLeft - 1), delay);
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
      // Activate only for plain-text files — sufficient for testing all LSP
      // features without conflicting with the official Dart extension.
      documentSelector: [{ scheme: "file", language: "plaintext" }],
      outputChannelName: "LSP Test Server",
      traceOutputChannel: this.traceOutputChannel,
      middleware: this.createMiddleware(),
    };

    return new LanguageClient(
      "lspTester",
      "LSP Tester",
      serverOptions,
      clientOptions,
    );
  }
}

let session: LspTesterSession | undefined;

export function activate(context: vscode.ExtensionContext): void {
  session = new LspTesterSession(context);
  session.start();

  context.subscriptions.push(
    vscode.commands.registerCommand("lspTester.restartServer", () =>
      session?.restart(),
    ),
    vscode.commands.registerCommand("lspTester.showOutput", () =>
      session?.showOutput(),
    ),
    vscode.commands.registerCommand("lspTester.showLog", () =>
      session?.showLog(),
    ),
    vscode.workspace.onDidChangeConfiguration((e) => {
      if (e.affectsConfiguration("lspTester.serverPort")) {
        void session?.restart();
      }
    }),
  );
}

export async function deactivate(): Promise<void> {
  await session?.stop();
}
