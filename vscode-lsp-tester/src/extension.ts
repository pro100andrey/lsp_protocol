import * as net from "net";
import * as vscode from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  State,
  StreamInfo,
} from "vscode-languageclient/node";

class LspTesterSession {
  private client: LanguageClient | undefined;
  private stopping = false;
  private reconnectTimer: ReturnType<typeof setTimeout> | undefined;
  private readonly statusBarItem: vscode.StatusBarItem;
  private readonly traceOutputChannel: vscode.OutputChannel;

  constructor(private readonly context: vscode.ExtensionContext) {
    this.traceOutputChannel = vscode.window.createOutputChannel(
      "LSP Test Server — Trace",
    );
    this.statusBarItem = vscode.window.createStatusBarItem(
      vscode.StatusBarAlignment.Left,
    );
    this.statusBarItem.show();
    context.subscriptions.push(this.traceOutputChannel, this.statusBarItem);
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
