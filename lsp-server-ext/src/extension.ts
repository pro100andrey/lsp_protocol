import * as net from "net";
import * as vscode from "vscode";
import { LanguageClient, StreamInfo } from "vscode-languageclient/node";

export function activate(context: vscode.ExtensionContext) {
  const serverOptions = (): Promise<StreamInfo> => {
    return new Promise((resolve, reject) => {
      const socket = net.connect(9999, "127.0.0.1", () => {
        resolve({ reader: socket, writer: socket });
      });

      socket.on("error", reject);
    });
  };

  const clientOptions = {
    documentSelector: [{ scheme: "file", language: "lake" }],
  };

  const client = new LanguageClient(
    "lakeLanguageServer",
    "Lake Language Server",
    serverOptions,
    clientOptions
  );

  client.start();

  context.subscriptions.push(client);
}
