import * as vscode from "vscode";

export class LspStatsCollector implements vscode.Disposable {
  private stats: Map<string, { count: number; successes: number; failures: number; totalDurationMs: number }> = new Map();
  private onDidChange = new vscode.EventEmitter<void>();
  readonly onDidChangeTreeData = this.onDidChange.event;

  recordRequest(method: string, durationMs: number, success: boolean) {
    let stat = this.stats.get(method);
    if (!stat) {
      stat = { count: 0, successes: 0, failures: 0, totalDurationMs: 0 };
      this.stats.set(method, stat);
    }
    stat.count++;
    if (success) {
      stat.successes++;
    } else {
      stat.failures++;
    }
    stat.totalDurationMs += durationMs;
    this.onDidChange.fire();
  }

  getMethods(): string[] {
    return Array.from(this.stats.keys()).sort();
  }

  getStat(method: string) {
    return this.stats.get(method);
  }

  clear() {
    this.stats.clear();
    this.onDidChange.fire();
  }

  dispose() {
    this.onDidChange.dispose();
  }
}

export class StatsTreeItem extends vscode.TreeItem {
  constructor(
    public readonly label: string,
    public readonly description: string,
    public readonly collapsibleState: vscode.TreeItemCollapsibleState,
    public readonly iconName?: string,
  ) {
    super(label, collapsibleState);
    this.description = description;
    if (iconName) {
      this.iconPath = new vscode.ThemeIcon(iconName);
    }
  }
}

export class StatsTreeDataProvider implements vscode.TreeDataProvider<StatsTreeItem> {
  constructor(private readonly statsCollector: LspStatsCollector) {}

  getTreeItem(element: StatsTreeItem): vscode.TreeItem {
    return element;
  }

  getChildren(element?: StatsTreeItem): Thenable<StatsTreeItem[]> {
    if (!element) {
      // Root items
      const methods = this.statsCollector.getMethods();
      const items: StatsTreeItem[] = [];

      if (methods.length > 0) {
        let totalCount = 0;
        let totalSuccess = 0;
        let totalFailures = 0;
        let totalDuration = 0;

        for (const m of methods) {
          const s = this.statsCollector.getStat(m)!;
          totalCount += s.count;
          totalSuccess += s.successes;
          totalFailures += s.failures;
          totalDuration += s.totalDurationMs;
        }

        const overallAvg = totalCount > 0 ? Math.round(totalDuration / totalCount) : 0;
        items.push(
          new StatsTreeItem(
            `Total Requests: ${totalCount}`,
            `Success: ${totalSuccess} | Failures: ${totalFailures} | Avg: ${overallAvg}ms`,
            vscode.TreeItemCollapsibleState.None,
            "dashboard",
          )
        );

        for (const m of methods) {
          const s = this.statsCollector.getStat(m)!;
          const avg = s.count > 0 ? Math.round(s.totalDurationMs / s.count) : 0;
          items.push(
            new StatsTreeItem(
              m,
              `Count: ${s.count} | Avg: ${avg}ms`,
              vscode.TreeItemCollapsibleState.Collapsed,
              "symbol-method",
            )
          );
        }
      } else {
        items.push(
          new StatsTreeItem(
            "No requests recorded yet",
            "Interact with your files to see stats",
            vscode.TreeItemCollapsibleState.None,
            "info",
          )
        );
      }

      return Promise.resolve(items);
    } else {
      // Children of a method node
      const method = element.label;
      const s = this.statsCollector.getStat(method);
      if (!s) return Promise.resolve([]);

      const avg = s.count > 0 ? Math.round(s.totalDurationMs / s.count) : 0;
      return Promise.resolve([
        new StatsTreeItem(`Total calls: ${s.count}`, "", vscode.TreeItemCollapsibleState.None, "history"),
        new StatsTreeItem(`Successful: ${s.successes}`, "", vscode.TreeItemCollapsibleState.None, "pass"),
        new StatsTreeItem(`Failed: ${s.failures}`, "", vscode.TreeItemCollapsibleState.None, "error"),
        new StatsTreeItem(`Average duration: ${avg}ms`, "", vscode.TreeItemCollapsibleState.None, "watch"),
      ]);
    }
  }

  readonly onDidChangeTreeData = this.statsCollector.onDidChangeTreeData;
}
