import * as path from "path";
import * as vscode from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
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
  // Path to the Dart entrypoint — resolved relative to the workspace root.
  // The extension runs `dart run` so the server is always debuggable via
  // the "Run LSP Server" launch configuration in .vscode/launch.json.
  const workspaceRoot =
    vscode.workspace.workspaceFolders?.[0]?.uri.fsPath ?? context.extensionPath;

  const serverEntrypoint = path.join(
    workspaceRoot,
    "packages",
    "lsp_test_server",
    "bin",
    "lsp_test_server.dart",
  );

  const serverOptions: ServerOptions = {
    run: {
      command: "dart",
      args: ["run", serverEntrypoint],
    },
    debug: {
      // In debug mode we still use `dart run` — attach the Dart debugger
      // via the "Run LSP Server" launch config separately.
      command: "dart",
      args: ["run", serverEntrypoint],
    },
  };

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
