import * as vscode from "vscode";
import { LspStatsCollector, StatsTreeDataProvider } from "./stats";
import { LspTesterSession } from "./session";

let session: LspTesterSession | undefined;

export function activate(context: vscode.ExtensionContext): void {
  const statsCollector = new LspStatsCollector();
  const statsProvider = new StatsTreeDataProvider(statsCollector);
  const statsViewDisposable = vscode.window.registerTreeDataProvider(
    "lspTester.statsView",
    statsProvider,
  );

  session = new LspTesterSession(context, statsCollector);
  session.start();

  context.subscriptions.push(
    statsCollector,
    statsViewDisposable,
    session,

    vscode.commands.registerCommand("lspTester.restartServer", () =>
      session?.restart(),
    ),

    vscode.commands.registerCommand("lspTester.showOutput", () =>
      session?.showOutput(),
    ),

    vscode.commands.registerCommand("lspTester.showLog", () =>
      session?.showLog(),
    ),

    vscode.commands.registerCommand("lspTester.clearStats", () => {
      statsCollector.clear();
    }),
    
    vscode.workspace.onDidChangeConfiguration((e) => {
      if (e.affectsConfiguration("lspTester.serverPort")) {
        void session?.restart();
      } else if (e.affectsConfiguration("lspTester.trace.server")) {
        session?.updateTraceLevel();
      }
    }),
  );
}

export async function deactivate(): Promise<void> {
  if (session) {
    await session.stop();
  }
}
