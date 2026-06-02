// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enumerations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

const _$SemanticTokenTypesEnumMap = {
  SemanticTokenTypes.namespace: 'namespace',
  SemanticTokenTypes.type: 'type',
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
  SemanticTokenTypes.macro_: 'macro',
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
  DocumentDiagnosticReportKind.full: 'full',
  DocumentDiagnosticReportKind.unchanged: 'unchanged',
};

const _$ErrorCodesEnumMap = {
  ErrorCodes.parseError: -32700,
  ErrorCodes.invalidRequest: -32600,
  ErrorCodes.methodNotFound: -32601,
  ErrorCodes.invalidParams: -32602,
  ErrorCodes.internalError: -32603,
  ErrorCodes.serverNotInitialized: -32002,
  ErrorCodes.unknownErrorCode: -32001,
};

const _$LSPErrorCodesEnumMap = {
  LSPErrorCodes.requestFailed: -32803,
  LSPErrorCodes.serverCancelled: -32802,
  LSPErrorCodes.contentModified: -32801,
  LSPErrorCodes.requestCancelled: -32800,
};

const _$FoldingRangeKindEnumMap = {
  FoldingRangeKind.comment: 'comment',
  FoldingRangeKind.imports: 'imports',
  FoldingRangeKind.region: 'region',
};

const _$SymbolKindEnumMap = {
  SymbolKind.file: 1,
  SymbolKind.module: 2,
  SymbolKind.namespace: 3,
  SymbolKind.package: 4,
  SymbolKind.class_: 5,
  SymbolKind.method: 6,
  SymbolKind.property: 7,
  SymbolKind.field: 8,
  SymbolKind.constructor: 9,
  SymbolKind.enum_: 10,
  SymbolKind.interface_: 11,
  SymbolKind.function: 12,
  SymbolKind.variable: 13,
  SymbolKind.constant: 14,
  SymbolKind.string: 15,
  SymbolKind.number: 16,
  SymbolKind.boolean: 17,
  SymbolKind.array: 18,
  SymbolKind.object: 19,
  SymbolKind.key: 20,
  SymbolKind.null_: 21,
  SymbolKind.enumMember: 22,
  SymbolKind.struct: 23,
  SymbolKind.event: 24,
  SymbolKind.operator_: 25,
  SymbolKind.typeParameter: 26,
};

const _$SymbolTagEnumMap = {SymbolTag.deprecated: 1};

const _$UniquenessLevelEnumMap = {
  UniquenessLevel.document: 'document',
  UniquenessLevel.project: 'project',
  UniquenessLevel.group: 'group',
  UniquenessLevel.scheme: 'scheme',
  UniquenessLevel.global: 'global',
};

const _$MonikerKindEnumMap = {
  MonikerKind.import: 'import',
  MonikerKind.export: 'export',
  MonikerKind.local: 'local',
};

const _$InlayHintKindEnumMap = {
  InlayHintKind.type: 1,
  InlayHintKind.parameter: 2,
};

const _$MessageTypeEnumMap = {
  MessageType.error: 1,
  MessageType.warning: 2,
  MessageType.info: 3,
  MessageType.log: 4,
  MessageType.debug: 5,
};

const _$TextDocumentSyncKindEnumMap = {
  TextDocumentSyncKind.none: 0,
  TextDocumentSyncKind.full: 1,
  TextDocumentSyncKind.incremental: 2,
};

const _$TextDocumentSaveReasonEnumMap = {
  TextDocumentSaveReason.manual: 1,
  TextDocumentSaveReason.afterDelay: 2,
  TextDocumentSaveReason.focusOut: 3,
};

const _$CompletionItemKindEnumMap = {
  CompletionItemKind.text: 1,
  CompletionItemKind.method: 2,
  CompletionItemKind.function: 3,
  CompletionItemKind.constructor: 4,
  CompletionItemKind.field: 5,
  CompletionItemKind.variable: 6,
  CompletionItemKind.class_: 7,
  CompletionItemKind.interface_: 8,
  CompletionItemKind.module: 9,
  CompletionItemKind.property: 10,
  CompletionItemKind.unit: 11,
  CompletionItemKind.value_: 12,
  CompletionItemKind.enum_: 13,
  CompletionItemKind.keyword: 14,
  CompletionItemKind.snippet: 15,
  CompletionItemKind.color: 16,
  CompletionItemKind.file: 17,
  CompletionItemKind.reference: 18,
  CompletionItemKind.folder: 19,
  CompletionItemKind.enumMember: 20,
  CompletionItemKind.constant: 21,
  CompletionItemKind.struct: 22,
  CompletionItemKind.event: 23,
  CompletionItemKind.operator_: 24,
  CompletionItemKind.typeParameter: 25,
};

const _$CompletionItemTagEnumMap = {CompletionItemTag.deprecated: 1};

const _$InsertTextFormatEnumMap = {
  InsertTextFormat.plainText: 1,
  InsertTextFormat.snippet: 2,
};

const _$InsertTextModeEnumMap = {
  InsertTextMode.asIs: 1,
  InsertTextMode.adjustIndentation: 2,
};

const _$DocumentHighlightKindEnumMap = {
  DocumentHighlightKind.text: 1,
  DocumentHighlightKind.read: 2,
  DocumentHighlightKind.write: 3,
};

const _$CodeActionKindEnumMap = {
  CodeActionKind.empty: '',
  CodeActionKind.quickFix: 'quickfix',
  CodeActionKind.refactor: 'refactor',
  CodeActionKind.refactorExtract: 'refactor.extract',
  CodeActionKind.refactorInline: 'refactor.inline',
  CodeActionKind.refactorRewrite: 'refactor.rewrite',
  CodeActionKind.source: 'source',
  CodeActionKind.sourceOrganizeImports: 'source.organizeImports',
  CodeActionKind.sourceFixAll: 'source.fixAll',
};

const _$TraceValuesEnumMap = {
  TraceValues.off: 'off',
  TraceValues.messages: 'messages',
  TraceValues.verbose: 'verbose',
};

const _$MarkupKindEnumMap = {
  MarkupKind.plainText: 'plaintext',
  MarkupKind.markdown: 'markdown',
};

const _$InlineCompletionTriggerKindEnumMap = {
  InlineCompletionTriggerKind.invoked: 0,
  InlineCompletionTriggerKind.automatic: 1,
};

const _$PositionEncodingKindEnumMap = {
  PositionEncodingKind.uTF8: 'utf-8',
  PositionEncodingKind.uTF16: 'utf-16',
  PositionEncodingKind.uTF32: 'utf-32',
};

const _$FileChangeTypeEnumMap = {
  FileChangeType.created: 1,
  FileChangeType.changed: 2,
  FileChangeType.deleted: 3,
};

const _$WatchKindEnumMap = {
  WatchKind.create: 1,
  WatchKind.change: 2,
  WatchKind.delete: 4,
};

const _$DiagnosticSeverityEnumMap = {
  DiagnosticSeverity.error: 1,
  DiagnosticSeverity.warning: 2,
  DiagnosticSeverity.information: 3,
  DiagnosticSeverity.hint: 4,
};

const _$DiagnosticTagEnumMap = {
  DiagnosticTag.unnecessary: 1,
  DiagnosticTag.deprecated: 2,
};

const _$CompletionTriggerKindEnumMap = {
  CompletionTriggerKind.invoked: 1,
  CompletionTriggerKind.triggerCharacter: 2,
  CompletionTriggerKind.triggerForIncompleteCompletions: 3,
};

const _$SignatureHelpTriggerKindEnumMap = {
  SignatureHelpTriggerKind.invoked: 1,
  SignatureHelpTriggerKind.triggerCharacter: 2,
  SignatureHelpTriggerKind.contentChange: 3,
};

const _$CodeActionTriggerKindEnumMap = {
  CodeActionTriggerKind.invoked: 1,
  CodeActionTriggerKind.automatic: 2,
};

const _$FileOperationPatternKindEnumMap = {
  FileOperationPatternKind.file: 'file',
  FileOperationPatternKind.folder: 'folder',
};

const _$NotebookCellKindEnumMap = {
  NotebookCellKind.markup: 1,
  NotebookCellKind.code: 2,
};

const _$ResourceOperationKindEnumMap = {
  ResourceOperationKind.create: 'create',
  ResourceOperationKind.rename: 'rename',
  ResourceOperationKind.delete: 'delete',
};

const _$FailureHandlingKindEnumMap = {
  FailureHandlingKind.abort: 'abort',
  FailureHandlingKind.transactional: 'transactional',
  FailureHandlingKind.textOnlyTransactional: 'textOnlyTransactional',
  FailureHandlingKind.undo: 'undo',
};

const _$PrepareSupportDefaultBehaviorEnumMap = {
  PrepareSupportDefaultBehavior.identifier: 1,
};

const _$TokenFormatEnumMap = {TokenFormat.relative: 'relative'};
