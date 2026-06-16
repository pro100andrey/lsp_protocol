import * as vscode from "vscode";

export class TracingChannel implements vscode.LogOutputChannel {
  readonly name: string;
  private readonly inner: vscode.OutputChannel;
  private readonly logEmitter = new vscode.EventEmitter<vscode.LogLevel>();

  constructor(name: string) {
    this.inner = vscode.window.createOutputChannel(name);
    this.name = this.inner.name;
  }

  get logLevel(): vscode.LogLevel {
    return vscode.LogLevel.Trace;
  }
  
  readonly onDidChangeLogLevel: vscode.Event<vscode.LogLevel> = this.logEmitter.event;

  private formatMessage(message: string, ...args: any[]): string {
    if (args.length === 0) return message;
    return `${message} ${args.map(a => typeof a === "object" ? JSON.stringify(a) : String(a)).join(" ")}`;
  }

  trace(message: string, ...args: any[]): void {
    this.appendLine(this.formatMessage(message, ...args));
  }
  
  debug(message: string, ...args: any[]): void {
    this.appendLine(this.formatMessage(message, ...args));
  }
  
  info(message: string, ...args: any[]): void {
    this.appendLine(this.formatMessage(message, ...args));
  }
  
  warn(message: string, ...args: any[]): void {
    this.appendLine(this.formatMessage(message, ...args));
  }
  
  error(message: string | Error, ...args: any[]): void {
    const str = message instanceof Error ? message.stack || message.message : message;
    this.appendLine(this.formatMessage(str, ...args));
  }

  appendLine(line: string): void {
    // vscode-languageclient prepends "[Trace - H:MM:SS AM/PM] " — strip it to
    // avoid duplicate timestamps from LogOutputChannel.
    const stripped = line.replace(/^\[Trace - \d+:\d+:\d+ [AP]M\] /, "");
    this.inner.appendLine(stripped);
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
  
  show(preserveFocus?: boolean): void;
  /** @deprecated */
  show(column?: vscode.ViewColumn, preserveFocus?: boolean): void;
  show(columnOrPreserveFocus?: vscode.ViewColumn | boolean, preserveFocus?: boolean): void {
    if (typeof columnOrPreserveFocus === "boolean") {
      this.inner.show(columnOrPreserveFocus);
    } else {
      (this.inner as any).show(columnOrPreserveFocus, preserveFocus);
    }
  }
  
  hide(): void {
    this.inner.hide();
  }
  
  dispose(): void {
    this.logEmitter.dispose();
    this.inner.dispose();
  }
}
