// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enumerations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

const _$SemanticTokenTypesEnumMap = {
  SemanticTokenTypes.namespace: 'namespace',
  SemanticTokenTypes.type_: 'type',
  SemanticTokenTypes.class_: 'class',
  SemanticTokenTypes.enum_: 'enum',
  SemanticTokenTypes.interface_: 'interface',
  SemanticTokenTypes.struct: 'struct',
  SemanticTokenTypes.typeParameter: 'typeParameter',
  SemanticTokenTypes.parameter: 'parameter',
  SemanticTokenTypes.variable: 'variable',
  SemanticTokenTypes.property: 'property',
  SemanticTokenTypes.enumMember: 'enumMember',
  SemanticTokenTypes.event: 'event',
  SemanticTokenTypes.function: 'function',
  SemanticTokenTypes.method: 'method',
  SemanticTokenTypes.macro: 'macro',
  SemanticTokenTypes.keyword: 'keyword',
  SemanticTokenTypes.modifier: 'modifier',
  SemanticTokenTypes.comment: 'comment',
  SemanticTokenTypes.string: 'string',
  SemanticTokenTypes.number: 'number',
  SemanticTokenTypes.regexp: 'regexp',
  SemanticTokenTypes.operator_: 'operator',
  SemanticTokenTypes.decorator: 'decorator',
};

const _$SemanticTokenModifiersEnumMap = {
  SemanticTokenModifiers.declaration: 'declaration',
  SemanticTokenModifiers.definition: 'definition',
  SemanticTokenModifiers.readonly: 'readonly',
  SemanticTokenModifiers.static_: 'static',
  SemanticTokenModifiers.deprecated: 'deprecated',
  SemanticTokenModifiers.abstract_: 'abstract',
  SemanticTokenModifiers.async_: 'async',
  SemanticTokenModifiers.modification: 'modification',
  SemanticTokenModifiers.documentation: 'documentation',
  SemanticTokenModifiers.defaultLibrary: 'defaultLibrary',
};

const _$DocumentDiagnosticReportKindEnumMap = {
  DocumentDiagnosticReportKind.Full: 'full',
  DocumentDiagnosticReportKind.Unchanged: 'unchanged',
};

const _$ErrorCodesEnumMap = {
  ErrorCodes.ParseError: -32700,
  ErrorCodes.InvalidRequest: -32600,
  ErrorCodes.MethodNotFound: -32601,
  ErrorCodes.InvalidParams: -32602,
  ErrorCodes.InternalError: -32603,
  ErrorCodes.ServerNotInitialized: -32002,
  ErrorCodes.UnknownErrorCode: -32001,
};

const _$LSPErrorCodesEnumMap = {
  LSPErrorCodes.RequestFailed: -32803,
  LSPErrorCodes.ServerCancelled: -32802,
  LSPErrorCodes.ContentModified: -32801,
  LSPErrorCodes.RequestCancelled: -32800,
};

const _$FoldingRangeKindEnumMap = {
  FoldingRangeKind.Comment: 'comment',
  FoldingRangeKind.Imports: 'imports',
  FoldingRangeKind.Region: 'region',
};

const _$SymbolKindEnumMap = {
  SymbolKind.File: 1,
  SymbolKind.Module: 2,
  SymbolKind.Namespace: 3,
  SymbolKind.Package: 4,
  SymbolKind.Class: 5,
  SymbolKind.Method: 6,
  SymbolKind.Property: 7,
  SymbolKind.Field: 8,
  SymbolKind.Constructor: 9,
  SymbolKind.Enum: 10,
  SymbolKind.Interface: 11,
  SymbolKind.Function_: 12,
  SymbolKind.Variable: 13,
  SymbolKind.Constant: 14,
  SymbolKind.String: 15,
  SymbolKind.Number: 16,
  SymbolKind.Boolean: 17,
  SymbolKind.Array: 18,
  SymbolKind.Object: 19,
  SymbolKind.Key: 20,
  SymbolKind.Null: 21,
  SymbolKind.EnumMember: 22,
  SymbolKind.Struct: 23,
  SymbolKind.Event: 24,
  SymbolKind.Operator: 25,
  SymbolKind.TypeParameter: 26,
};

const _$SymbolTagEnumMap = {SymbolTag.Deprecated: 1};

const _$UniquenessLevelEnumMap = {
  UniquenessLevel.document: 'document',
  UniquenessLevel.project: 'project',
  UniquenessLevel.group: 'group',
  UniquenessLevel.scheme: 'scheme',
  UniquenessLevel.global: 'global',
};

const _$MonikerKindEnumMap = {
  MonikerKind.import_: 'import',
  MonikerKind.export_: 'export',
  MonikerKind.local: 'local',
};

const _$InlayHintKindEnumMap = {
  InlayHintKind.Type: 1,
  InlayHintKind.Parameter: 2,
};

const _$MessageTypeEnumMap = {
  MessageType.Error: 1,
  MessageType.Warning: 2,
  MessageType.Info: 3,
  MessageType.Log: 4,
  MessageType.Debug: 5,
};

const _$TextDocumentSyncKindEnumMap = {
  TextDocumentSyncKind.None: 0,
  TextDocumentSyncKind.Full: 1,
  TextDocumentSyncKind.Incremental: 2,
};

const _$TextDocumentSaveReasonEnumMap = {
  TextDocumentSaveReason.Manual: 1,
  TextDocumentSaveReason.AfterDelay: 2,
  TextDocumentSaveReason.FocusOut: 3,
};

const _$CompletionItemKindEnumMap = {
  CompletionItemKind.Text: 1,
  CompletionItemKind.Method: 2,
  CompletionItemKind.Function_: 3,
  CompletionItemKind.Constructor: 4,
  CompletionItemKind.Field: 5,
  CompletionItemKind.Variable: 6,
  CompletionItemKind.Class: 7,
  CompletionItemKind.Interface: 8,
  CompletionItemKind.Module: 9,
  CompletionItemKind.Property: 10,
  CompletionItemKind.Unit: 11,
  CompletionItemKind.Value: 12,
  CompletionItemKind.Enum: 13,
  CompletionItemKind.Keyword: 14,
  CompletionItemKind.Snippet: 15,
  CompletionItemKind.Color: 16,
  CompletionItemKind.File: 17,
  CompletionItemKind.Reference: 18,
  CompletionItemKind.Folder: 19,
  CompletionItemKind.EnumMember: 20,
  CompletionItemKind.Constant: 21,
  CompletionItemKind.Struct: 22,
  CompletionItemKind.Event: 23,
  CompletionItemKind.Operator: 24,
  CompletionItemKind.TypeParameter: 25,
};

const _$CompletionItemTagEnumMap = {CompletionItemTag.Deprecated: 1};

const _$InsertTextFormatEnumMap = {
  InsertTextFormat.PlainText: 1,
  InsertTextFormat.Snippet: 2,
};

const _$InsertTextModeEnumMap = {
  InsertTextMode.asIs: 1,
  InsertTextMode.adjustIndentation: 2,
};

const _$DocumentHighlightKindEnumMap = {
  DocumentHighlightKind.Text: 1,
  DocumentHighlightKind.Read: 2,
  DocumentHighlightKind.Write: 3,
};

const _$CodeActionKindEnumMap = {
  CodeActionKind.Empty: '',
  CodeActionKind.QuickFix: 'quickfix',
  CodeActionKind.Refactor: 'refactor',
  CodeActionKind.RefactorExtract: 'refactor.extract',
  CodeActionKind.RefactorInline: 'refactor.inline',
  CodeActionKind.RefactorRewrite: 'refactor.rewrite',
  CodeActionKind.Source: 'source',
  CodeActionKind.SourceOrganizeImports: 'source.organizeImports',
  CodeActionKind.SourceFixAll: 'source.fixAll',
};

const _$TraceValuesEnumMap = {
  TraceValues.Off: 'off',
  TraceValues.Messages: 'messages',
  TraceValues.Verbose: 'verbose',
};

const _$MarkupKindEnumMap = {
  MarkupKind.PlainText: 'plaintext',
  MarkupKind.Markdown: 'markdown',
};

const _$InlineCompletionTriggerKindEnumMap = {
  InlineCompletionTriggerKind.Invoked: 0,
  InlineCompletionTriggerKind.Automatic: 1,
};

const _$PositionEncodingKindEnumMap = {
  PositionEncodingKind.UTF8: 'utf-8',
  PositionEncodingKind.UTF16: 'utf-16',
  PositionEncodingKind.UTF32: 'utf-32',
};

const _$FileChangeTypeEnumMap = {
  FileChangeType.Created: 1,
  FileChangeType.Changed: 2,
  FileChangeType.Deleted: 3,
};

const _$WatchKindEnumMap = {
  WatchKind.Create: 1,
  WatchKind.Change: 2,
  WatchKind.Delete: 4,
};

const _$DiagnosticSeverityEnumMap = {
  DiagnosticSeverity.Error: 1,
  DiagnosticSeverity.Warning: 2,
  DiagnosticSeverity.Information: 3,
  DiagnosticSeverity.Hint: 4,
};

const _$DiagnosticTagEnumMap = {
  DiagnosticTag.Unnecessary: 1,
  DiagnosticTag.Deprecated: 2,
};

const _$CompletionTriggerKindEnumMap = {
  CompletionTriggerKind.Invoked: 1,
  CompletionTriggerKind.TriggerCharacter: 2,
  CompletionTriggerKind.TriggerForIncompleteCompletions: 3,
};

const _$SignatureHelpTriggerKindEnumMap = {
  SignatureHelpTriggerKind.Invoked: 1,
  SignatureHelpTriggerKind.TriggerCharacter: 2,
  SignatureHelpTriggerKind.ContentChange: 3,
};

const _$CodeActionTriggerKindEnumMap = {
  CodeActionTriggerKind.Invoked: 1,
  CodeActionTriggerKind.Automatic: 2,
};

const _$FileOperationPatternKindEnumMap = {
  FileOperationPatternKind.file: 'file',
  FileOperationPatternKind.folder: 'folder',
};

const _$NotebookCellKindEnumMap = {
  NotebookCellKind.Markup: 1,
  NotebookCellKind.Code: 2,
};

const _$ResourceOperationKindEnumMap = {
  ResourceOperationKind.Create: 'create',
  ResourceOperationKind.Rename: 'rename',
  ResourceOperationKind.Delete: 'delete',
};

const _$FailureHandlingKindEnumMap = {
  FailureHandlingKind.Abort: 'abort',
  FailureHandlingKind.Transactional: 'transactional',
  FailureHandlingKind.TextOnlyTransactional: 'textOnlyTransactional',
  FailureHandlingKind.Undo: 'undo',
};

const _$PrepareSupportDefaultBehaviorEnumMap = {
  PrepareSupportDefaultBehavior.Identifier: 1,
};

const _$TokenFormatEnumMap = {TokenFormat.Relative: 'relative'};
