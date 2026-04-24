import * as net from "net";
import * as vscode from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  StreamInfo,
} from "vscode-languageclient/node";

let client: LanguageClient | undefined;

export function activate(context: vscode.ExtensionContext): void {
  client = createClient(context);
  client.start();

  context.subscriptions.push(
    vscode.commands.registerCommand("lspTester.restartServer", async () => {
      await client?.stop();
      client = createClient(context);
      client.start();
      vscode.window.showInformationMessage("LSP Tester: server restarted.");
    }),
  );
}

export async function deactivate(): Promise<void> {
  await client?.stop();
}

function createClient(context: vscode.ExtensionContext): LanguageClient {
  const port = vscode.workspace
    .getConfiguration("lspTester")
    .get<number>("serverPort", 2087);

  const serverOptions: ServerOptions = (): Promise<StreamInfo> =>
    new Promise((resolve, reject) => {
      const tryConnect = (attemptsLeft: number) => {
        const socket = net.createConnection({ port, host: "127.0.0.1" });
        socket.once("connect", () =>
          resolve({ reader: socket, writer: socket }),
        );
        socket.once("error", (err: NodeJS.ErrnoException) => {
          if (err.code === "ECONNREFUSED" && attemptsLeft > 0) {
            setTimeout(() => tryConnect(attemptsLeft - 1), 1000);
          } else {
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
    traceOutputChannel: vscode.window.createOutputChannel(
      "LSP Test Server — Trace",
    ),
  };

  return new LanguageClient(
    "lspTester",
    "LSP Tester",
    serverOptions,
    clientOptions,
  );
}
