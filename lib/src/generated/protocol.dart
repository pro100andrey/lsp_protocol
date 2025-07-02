/// Do not edit it manually.

// ignore_for_file: one_member_abstracts
// ignore_for_file: doc_directive_unknown
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: unused_element
library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import '../utils/enum_helpers.dart' as _i1;

/// This class contains methods for handling requests.
enum Method {
  /// Method: textDocument/implementation
  textDocumentImplementation('textDocument/implementation'),

  /// Method: textDocument/typeDefinition
  textDocumentTypeDefinition('textDocument/typeDefinition'),

  /// Method: workspace/workspaceFolders
  workspaceWorkspaceFolders('workspace/workspaceFolders'),

  /// Method: workspace/configuration
  workspaceConfiguration('workspace/configuration'),

  /// Method: textDocument/documentColor
  textDocumentDocumentColor('textDocument/documentColor'),

  /// Method: textDocument/colorPresentation
  textDocumentColorPresentation('textDocument/colorPresentation'),

  /// Method: textDocument/foldingRange
  textDocumentFoldingRange('textDocument/foldingRange'),

  /// Method: workspace/foldingRange/refresh
  workspaceFoldingRangeRefresh('workspace/foldingRange/refresh'),

  /// Method: textDocument/declaration
  textDocumentDeclaration('textDocument/declaration'),

  /// Method: textDocument/selectionRange
  textDocumentSelectionRange('textDocument/selectionRange'),

  /// Method: window/workDoneProgress/create
  windowWorkDoneProgressCreate('window/workDoneProgress/create'),

  /// Method: textDocument/prepareCallHierarchy
  textDocumentPrepareCallHierarchy('textDocument/prepareCallHierarchy'),

  /// Method: callHierarchy/incomingCalls
  callHierarchyIncomingCalls('callHierarchy/incomingCalls'),

  /// Method: callHierarchy/outgoingCalls
  callHierarchyOutgoingCalls('callHierarchy/outgoingCalls'),

  /// Method: textDocument/semanticTokens/full
  textDocumentSemanticTokensFull('textDocument/semanticTokens/full'),

  /// Method: textDocument/semanticTokens/full/delta
  textDocumentSemanticTokensFullDelta('textDocument/semanticTokens/full/delta'),

  /// Method: textDocument/semanticTokens/range
  textDocumentSemanticTokensRange('textDocument/semanticTokens/range'),

  /// Method: workspace/semanticTokens/refresh
  workspaceSemanticTokensRefresh('workspace/semanticTokens/refresh'),

  /// Method: window/showDocument
  windowShowDocument('window/showDocument'),

  /// Method: textDocument/linkedEditingRange
  textDocumentLinkedEditingRange('textDocument/linkedEditingRange'),

  /// Method: workspace/willCreateFiles
  workspaceWillCreateFiles('workspace/willCreateFiles'),

  /// Method: workspace/willRenameFiles
  workspaceWillRenameFiles('workspace/willRenameFiles'),

  /// Method: workspace/willDeleteFiles
  workspaceWillDeleteFiles('workspace/willDeleteFiles'),

  /// Method: textDocument/moniker
  textDocumentMoniker('textDocument/moniker'),

  /// Method: textDocument/prepareTypeHierarchy
  textDocumentPrepareTypeHierarchy('textDocument/prepareTypeHierarchy'),

  /// Method: typeHierarchy/supertypes
  typeHierarchySupertypes('typeHierarchy/supertypes'),

  /// Method: typeHierarchy/subtypes
  typeHierarchySubtypes('typeHierarchy/subtypes'),

  /// Method: textDocument/inlineValue
  textDocumentInlineValue('textDocument/inlineValue'),

  /// Method: workspace/inlineValue/refresh
  workspaceInlineValueRefresh('workspace/inlineValue/refresh'),

  /// Method: textDocument/inlayHint
  textDocumentInlayHint('textDocument/inlayHint'),

  /// Method: inlayHint/resolve
  inlayHintResolve('inlayHint/resolve'),

  /// Method: workspace/inlayHint/refresh
  workspaceInlayHintRefresh('workspace/inlayHint/refresh'),

  /// Method: textDocument/diagnostic
  textDocumentDiagnostic('textDocument/diagnostic'),

  /// Method: workspace/diagnostic
  workspaceDiagnostic('workspace/diagnostic'),

  /// Method: workspace/diagnostic/refresh
  workspaceDiagnosticRefresh('workspace/diagnostic/refresh'),

  /// Method: textDocument/inlineCompletion
  textDocumentInlineCompletion('textDocument/inlineCompletion'),

  /// Method: client/registerCapability
  clientRegisterCapability('client/registerCapability'),

  /// Method: client/unregisterCapability
  clientUnregisterCapability('client/unregisterCapability'),

  /// Method: initialize
  initialize('initialize'),

  /// Method: shutdown
  shutdown('shutdown'),

  /// Method: window/showMessageRequest
  windowShowMessageRequest('window/showMessageRequest'),

  /// Method: textDocument/willSaveWaitUntil
  textDocumentWillSaveWaitUntil('textDocument/willSaveWaitUntil'),

  /// Method: textDocument/completion
  textDocumentCompletion('textDocument/completion'),

  /// Method: completionItem/resolve
  completionItemResolve('completionItem/resolve'),

  /// Method: textDocument/hover
  textDocumentHover('textDocument/hover'),

  /// Method: textDocument/signatureHelp
  textDocumentSignatureHelp('textDocument/signatureHelp'),

  /// Method: textDocument/definition
  textDocumentDefinition('textDocument/definition'),

  /// Method: textDocument/references
  textDocumentReferences('textDocument/references'),

  /// Method: textDocument/documentHighlight
  textDocumentDocumentHighlight('textDocument/documentHighlight'),

  /// Method: textDocument/documentSymbol
  textDocumentDocumentSymbol('textDocument/documentSymbol'),

  /// Method: textDocument/codeAction
  textDocumentCodeAction('textDocument/codeAction'),

  /// Method: codeAction/resolve
  codeActionResolve('codeAction/resolve'),

  /// Method: workspace/symbol
  workspaceSymbol('workspace/symbol'),

  /// Method: workspaceSymbol/resolve
  workspaceSymbolResolve('workspaceSymbol/resolve'),

  /// Method: textDocument/codeLens
  textDocumentCodeLens('textDocument/codeLens'),

  /// Method: codeLens/resolve
  codeLensResolve('codeLens/resolve'),

  /// Method: workspace/codeLens/refresh
  workspaceCodeLensRefresh('workspace/codeLens/refresh'),

  /// Method: textDocument/documentLink
  textDocumentDocumentLink('textDocument/documentLink'),

  /// Method: documentLink/resolve
  documentLinkResolve('documentLink/resolve'),

  /// Method: textDocument/formatting
  textDocumentFormatting('textDocument/formatting'),

  /// Method: textDocument/rangeFormatting
  textDocumentRangeFormatting('textDocument/rangeFormatting'),

  /// Method: textDocument/rangesFormatting
  textDocumentRangesFormatting('textDocument/rangesFormatting'),

  /// Method: textDocument/onTypeFormatting
  textDocumentOnTypeFormatting('textDocument/onTypeFormatting'),

  /// Method: textDocument/rename
  textDocumentRename('textDocument/rename'),

  /// Method: textDocument/prepareRename
  textDocumentPrepareRename('textDocument/prepareRename'),

  /// Method: workspace/executeCommand
  workspaceExecuteCommand('workspace/executeCommand'),

  /// Method: workspace/applyEdit
  workspaceApplyEdit('workspace/applyEdit');

  // The list of all methods in this enumeration.
  const Method(this.value);

  // The type of this enumeration.
  final String value;
}

abstract class ToJson {
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

sealed class OrRefType {}

/// The definition of a symbol represented as one or many {@link Location
/// locations}. For most programming languages there is only one location at
/// which a symbol is defined.
/// Servers should prefer returning `DefinitionLink` over `Definition` if
/// supported by the client.
typedef Definition = OrRefType;

/// Information about where a symbol is defined.
/// Provides additional metadata over normal {@link Location location}
/// definitions, including the range of the defining symbol
typedef DefinitionLink = LocationLink;

/// LSP arrays. @since 3.17.0
typedef LSPArray = List<LSPAny>;

/// The LSP any type. Please note that strictly speaking a property with the
/// value `undefined` can't be converted into JSON preserving the property
/// name. However for convenience it is allowed and assumed that all these
/// properties are optional as well. @since 3.17.0
typedef LSPAny = OrRefType;

/// The declaration of a symbol representation as one or many {@link Location
/// locations}.
typedef Declaration = OrRefType;

/// Information about where a symbol is declared.
/// Provides additional metadata over normal {@link Location location}
/// declarations, including the range of the declaring symbol.
/// Servers should prefer returning `DeclarationLink` over `Declaration` if
/// supported by the client.
typedef DeclarationLink = LocationLink;

/// Inline value information can be provided by different means: - directly as
/// a text value (class InlineValueText). - as a name to use for a variable
/// lookup (class InlineValueVariableLookup) - as an evaluatable expression
/// (class InlineValueEvaluatableExpression) The InlineValue types combines all
/// inline value types into one type.
/// @since 3.17.0
typedef InlineValue = OrRefType;

/// The result of a document diagnostic pull request. A report can either be a
/// full report containing all diagnostics for the requested document or an
/// unchanged report indicating that nothing has changed in terms of
/// diagnostics in comparison to the last pull request.
/// @since 3.17.0
typedef DocumentDiagnosticReport = OrRefType;
typedef PrepareRenameResult = OrRefType;

/// A document selector is the combination of one or many document filters.
/// @sample `let sel:DocumentSelector = [{ language: 'typescript' }, {
/// language: 'json', pattern: '**∕tsconfig.json' }]`;
/// The use of a string as a document filter is deprecated @since 3.16.0.
typedef DocumentSelector = List<DocumentFilter>;
typedef ProgressToken = OrRefType;

/// An identifier to refer to a change annotation stored with a workspace edit.
typedef ChangeAnnotationIdentifier = String;

/// A workspace diagnostic document report.
/// @since 3.17.0
typedef WorkspaceDocumentDiagnosticReport = OrRefType;

/// An event describing a change to a text document. If only a text is provided
/// it is considered to be the full content of the document.
typedef TextDocumentContentChangeEvent = OrRefType;

/// MarkedString can be used to render human readable text. It is either a
/// markdown string or a code-block that provides a language and a code
/// snippet. The language identifier is semantically equal to the optional
/// language identifier in fenced code blocks in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
/// The pair of a language and a value is an equivalent to markdown:
/// ```${language} ${value} ```
/// Note that markdown strings will be sanitized - that means html will be
/// escaped. @deprecated use MarkupContent instead.
typedef MarkedString = OrRefType;

/// A document filter describes a top level text document or a notebook cell
/// document.
/// @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
typedef DocumentFilter = OrRefType;

/// LSP object definition. @since 3.17.0
typedef LSPObject = Map<String, LSPAny>;

/// The glob pattern. Either a string pattern or a relative pattern.
/// @since 3.17.0
typedef GlobPattern = OrRefType;

/// A document filter denotes a document by different properties like the
/// {@link TextDocument.languageId language}, the {@link Uri.scheme scheme} of
/// its resource, or a glob-pattern that is applied to the {@link
/// TextDocument.fileName path}.
/// Glob patterns can have the following syntax: - `*` to match zero or more
/// characters in a path segment - `?` to match on one character in a path
/// segment - `**` to match any number of path segments, including none - `{}`
/// to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}` matches
/// all TypeScript and JavaScript files) - `[]` to declare a range of
/// characters to match in a path segment (e.g., `example.[0-9]` to match on
/// `example.0`, `example.1`, …) - `[!...]` to negate a range of characters to
/// match in a path segment (e.g., `example.[!0-9]` to match on `example.a`,
/// `example.b`, but not `example.0`)
/// @sample A language filter that applies to typescript files on disk: `{
/// language: 'typescript', scheme: 'file' }` @sample A language filter that
/// applies to all package.json paths: `{ language: 'json', pattern:
/// '**package.json' }`
/// @since 3.17.0
typedef TextDocumentFilter = OrRefType;

/// A notebook document filter denotes a notebook document by different
/// properties. The properties will be match against the notebook's URI (same
/// as with documents)
/// @since 3.17.0
typedef NotebookDocumentFilter = OrRefType;

/// The glob pattern to watch relative to the base path. Glob patterns can have
/// the following syntax: - `*` to match zero or more characters in a path
/// segment - `?` to match on one character in a path segment - `**` to match
/// any number of path segments, including none - `{}` to group conditions
/// (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript files) - `[]`
/// to declare a range of characters to match in a path segment (e.g.,
/// `example.[0-9]` to match on `example.0`, `example.1`, …) - `[!...]` to
/// negate a range of characters to match in a path segment (e.g.,
/// `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
/// @since 3.17.0
typedef Pattern = String;

/// Struct
class ImplementationParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  ImplementationParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory ImplementationParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return ImplementationParams(
      partialResultToken: partialResultToken,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Represents a location inside a resource, such as a line inside a text file.
class Location implements ToJson {
  Location({required this.range, required this.uri});

  factory Location.fromJson(Map<String, Object?> json) {
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return Location(range: range, uri: uri);
  }

  final Range range;

  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['range'] = range.toJson();
    json['uri'] = uri;
    return json;
  }
}

/// Struct
class ImplementationRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        ImplementationOptions,
        StaticRegistrationOptions {
  ImplementationRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory ImplementationRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return ImplementationRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
class TypeDefinitionParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  TypeDefinitionParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory TypeDefinitionParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return TypeDefinitionParams(
      partialResultToken: partialResultToken,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
class TypeDefinitionRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        TypeDefinitionOptions,
        StaticRegistrationOptions {
  TypeDefinitionRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory TypeDefinitionRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return TypeDefinitionRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// A workspace folder inside a client.
class WorkspaceFolder implements ToJson {
  WorkspaceFolder({required this.name, required this.uri});

  factory WorkspaceFolder.fromJson(Map<String, Object?> json) {
    final nameJson = json['name']!;
    final name = (nameJson as String);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return WorkspaceFolder(name: name, uri: uri);
  }

  /// The name of the workspace folder. Used to refer to this workspace
  /// folder in the user interface.
  final String name;

  /// The associated URI for this workspace folder.
  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['name'] = name;
    json['uri'] = uri;
    return json;
  }
}

/// Struct
/// The parameters of a `workspace/didChangeWorkspaceFolders` notification.
class DidChangeWorkspaceFoldersParams implements ToJson {
  DidChangeWorkspaceFoldersParams({required this.event});

  factory DidChangeWorkspaceFoldersParams.fromJson(Map<String, Object?> json) {
    final eventJson = json['event']!;
    final event = WorkspaceFoldersChangeEvent.fromJson(
      (eventJson as Map<String, Object?>),
    );

    return DidChangeWorkspaceFoldersParams(event: event);
  }

  /// The actual workspace folder change event.
  final WorkspaceFoldersChangeEvent event;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['event'] = event.toJson();
    return json;
  }
}

/// Struct
/// The parameters of a configuration request.
class ConfigurationParams implements ToJson {
  ConfigurationParams({required this.items});

  factory ConfigurationParams.fromJson(Map<String, Object?> json) {
    final itemsJson = json['items']!;
    final items = (itemsJson as List<ConfigurationItem>);

    return ConfigurationParams(items: items);
  }

  final List<ConfigurationItem> items;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['items'] = items;
    return json;
  }
}

/// Struct
/// Parameters for a {@link DocumentColorRequest}.
class DocumentColorParams
    implements WorkDoneProgressParams, PartialResultParams {
  DocumentColorParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DocumentColorParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DocumentColorParams(
      partialResultToken: partialResultToken,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Represents a color range from a document.
class ColorInformation implements ToJson {
  ColorInformation({required this.color, required this.range});

  factory ColorInformation.fromJson(Map<String, Object?> json) {
    final colorJson = json['color']!;
    final color = Color.fromJson((colorJson as Map<String, Object?>));
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));

    return ColorInformation(color: color, range: range);
  }

  /// The actual color value for this color range.
  final Color color;

  /// The range in the document where this color appears.
  final Range range;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['color'] = color.toJson();
    json['range'] = range.toJson();
    return json;
  }
}

/// Struct
class DocumentColorRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentColorOptions,
        StaticRegistrationOptions {
  DocumentColorRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory DocumentColorRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentColorRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Parameters for a {@link ColorPresentationRequest}.
class ColorPresentationParams
    implements WorkDoneProgressParams, PartialResultParams {
  ColorPresentationParams({
    required this.color,
    required this.partialResultToken,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory ColorPresentationParams.fromJson(Map<String, Object?> json) {
    final colorJson = json['color']!;
    final color = Color.fromJson((colorJson as Map<String, Object?>));
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return ColorPresentationParams(
      color: color,
      partialResultToken: partialResultToken,
      range: range,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The color to request presentations for.
  final Color color;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The range where the color would be inserted. Serves as a context.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['color'] = color.toJson();
    json['partialResultToken'] = partialResultToken;
    json['range'] = range.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
class ColorPresentation implements ToJson {
  ColorPresentation({
    required this.additionalTextEdits,
    required this.label,
    required this.textEdit,
  });

  factory ColorPresentation.fromJson(Map<String, Object?> json) {
    final additionalTextEditsJson = json['additionalTextEdits']!;
    final additionalTextEdits = (additionalTextEditsJson as List<TextEdit>);
    final labelJson = json['label']!;
    final label = (labelJson as String);
    final textEditJson = json['textEdit']!;
    final textEdit = TextEdit.fromJson((textEditJson as Map<String, Object?>));

    return ColorPresentation(
      additionalTextEdits: additionalTextEdits,
      label: label,
      textEdit: textEdit,
    );
  }

  /// An optional array of additional {@link TextEdit text edits} that are
  /// applied when selecting this color presentation. Edits must not overlap
  /// with the main {@link ColorPresentation.textEdit edit} nor with
  /// themselves.
  final List<TextEdit>? additionalTextEdits;

  /// The label of this color presentation. It will be shown on the color
  /// picker header. By default this is also the text that is inserted when
  /// selecting this color presentation.
  final String label;

  /// An {@link TextEdit edit} which is applied to a document when selecting
  /// this presentation for the color. When `falsy` the {@link
  /// ColorPresentation.label label} is used.
  final TextEdit? textEdit;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['additionalTextEdits'] = additionalTextEdits;
    json['label'] = label;
    json['textEdit'] = textEdit?.toJson();
    return json;
  }
}

/// Struct
class WorkDoneProgressOptions implements ToJson {
  WorkDoneProgressOptions({required this.workDoneProgress});

  factory WorkDoneProgressOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return WorkDoneProgressOptions(workDoneProgress: workDoneProgress);
  }

  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// General text document registration options.
class TextDocumentRegistrationOptions implements ToJson {
  TextDocumentRegistrationOptions({required this.documentSelector});

  factory TextDocumentRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);

    return TextDocumentRegistrationOptions(documentSelector: documentSelector);
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  final OrRefType documentSelector;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    return json;
  }
}

/// Struct
/// Parameters for a {@link FoldingRangeRequest}.
class FoldingRangeParams
    implements WorkDoneProgressParams, PartialResultParams {
  FoldingRangeParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory FoldingRangeParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return FoldingRangeParams(
      partialResultToken: partialResultToken,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Represents a folding range. To be valid, start and end line must be bigger
/// than zero and smaller than the number of lines in the document. Clients are
/// free to ignore invalid ranges.
class FoldingRange implements ToJson {
  FoldingRange({
    required this.collapsedText,
    required this.endCharacter,
    required this.endLine,
    required this.kind,
    required this.startCharacter,
    required this.startLine,
  });

  factory FoldingRange.fromJson(Map<String, Object?> json) {
    final collapsedTextJson = json['collapsedText']!;
    final collapsedText = (collapsedTextJson as String);
    final endCharacterJson = json['endCharacter']!;
    final endCharacter = (endCharacterJson as int);
    final endLineJson = json['endLine']!;
    final endLine = (endLineJson as int);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$FoldingRangeKindEnumMap, kindJson);
    final startCharacterJson = json['startCharacter']!;
    final startCharacter = (startCharacterJson as int);
    final startLineJson = json['startLine']!;
    final startLine = (startLineJson as int);

    return FoldingRange(
      collapsedText: collapsedText,
      endCharacter: endCharacter,
      endLine: endLine,
      kind: kind,
      startCharacter: startCharacter,
      startLine: startLine,
    );
  }

  /// The text that the client should show when the specified range is
  /// collapsed. If not defined or not supported by the client, a default
  /// will be chosen by the client.
  /// @since 3.17.0
  final String? collapsedText;

  /// The zero-based character offset before the folded range ends. If not
  /// defined, defaults to the length of the end line.
  final int? endCharacter;

  /// The zero-based end line of the range to fold. The folded area ends with
  /// the line's last character. To be valid, the end must be zero or larger
  /// and smaller than the number of lines in the document.
  final int endLine;

  /// Describes the kind of the folding range such as `comment' or 'region'.
  /// The kind is used to categorize folding ranges and used by commands like
  /// 'Fold all comments'. See {@link FoldingRangeKind} for an enumeration of
  /// standardized kinds.
  final FoldingRangeKind? kind;

  /// The zero-based character offset from where the folded range starts. If
  /// not defined, defaults to the length of the start line.
  final int? startCharacter;

  /// The zero-based start line of the range to fold. The folded area starts
  /// after the line's last character. To be valid, the end must be zero or
  /// larger and smaller than the number of lines in the document.
  final int startLine;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['collapsedText'] = collapsedText;
    json['endCharacter'] = endCharacter;
    json['endLine'] = endLine;
    json['kind'] = kind?.value;
    json['startCharacter'] = startCharacter;
    json['startLine'] = startLine;
    return json;
  }
}

/// Struct
class FoldingRangeRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        FoldingRangeOptions,
        StaticRegistrationOptions {
  FoldingRangeRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory FoldingRangeRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return FoldingRangeRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
class DeclarationParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  DeclarationParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DeclarationParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DeclarationParams(
      partialResultToken: partialResultToken,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
class DeclarationRegistrationOptions
    implements
        DeclarationOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  DeclarationRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory DeclarationRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DeclarationRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// A parameter literal used in selection range requests.
class SelectionRangeParams
    implements WorkDoneProgressParams, PartialResultParams {
  SelectionRangeParams({
    required this.partialResultToken,
    required this.positions,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory SelectionRangeParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final positionsJson = json['positions']!;
    final positions = (positionsJson as List<Position>);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return SelectionRangeParams(
      partialResultToken: partialResultToken,
      positions: positions,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The positions inside the text document.
  final List<Position> positions;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['positions'] = positions;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// A selection range represents a part of a selection hierarchy. A selection
/// range may have a parent selection range that contains it.
class SelectionRange implements ToJson {
  SelectionRange({required this.parent, required this.range});

  factory SelectionRange.fromJson(Map<String, Object?> json) {
    final parentJson = json['parent']!;
    final parent = SelectionRange.fromJson(
      (parentJson as Map<String, Object?>),
    );
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));

    return SelectionRange(parent: parent, range: range);
  }

  /// The parent selection range containing this range. Therefore
  /// `parent.range` must contain `this.range`.
  final SelectionRange? parent;

  /// The {@link Range range} of this selection range.
  final Range range;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['parent'] = parent?.toJson();
    json['range'] = range.toJson();
    return json;
  }
}

/// Struct
class SelectionRangeRegistrationOptions
    implements
        SelectionRangeOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  SelectionRangeRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory SelectionRangeRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return SelectionRangeRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
class WorkDoneProgressCreateParams implements ToJson {
  WorkDoneProgressCreateParams({required this.token});

  factory WorkDoneProgressCreateParams.fromJson(Map<String, Object?> json) {
    final tokenJson = json['token']!;
    final token = (tokenJson as ProgressToken);

    return WorkDoneProgressCreateParams(token: token);
  }

  /// The token to be used to report progress.
  final ProgressToken token;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['token'] = token;
    return json;
  }
}

/// Struct
class WorkDoneProgressCancelParams implements ToJson {
  WorkDoneProgressCancelParams({required this.token});

  factory WorkDoneProgressCancelParams.fromJson(Map<String, Object?> json) {
    final tokenJson = json['token']!;
    final token = (tokenJson as ProgressToken);

    return WorkDoneProgressCancelParams(token: token);
  }

  /// The token to be used to report progress.
  final ProgressToken token;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['token'] = token;
    return json;
  }
}

/// Struct
/// The parameter of a `textDocument/prepareCallHierarchy` request.
/// @since 3.16.0
class CallHierarchyPrepareParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  CallHierarchyPrepareParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory CallHierarchyPrepareParams.fromJson(Map<String, Object?> json) {
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return CallHierarchyPrepareParams(
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Represents programming constructs like functions or constructors in the
/// context of call hierarchy.
/// @since 3.16.0
class CallHierarchyItem implements ToJson {
  CallHierarchyItem({
    required this.data,
    required this.detail,
    required this.kind,
    required this.name,
    required this.range,
    required this.selectionRange,
    required this.tags,
    required this.uri,
  });

  factory CallHierarchyItem.fromJson(Map<String, Object?> json) {
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);
    final detailJson = json['detail']!;
    final detail = (detailJson as String);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$SymbolKindEnumMap, kindJson);
    final nameJson = json['name']!;
    final name = (nameJson as String);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final selectionRangeJson = json['selectionRange']!;
    final selectionRange = Range.fromJson(
      (selectionRangeJson as Map<String, Object?>),
    );
    final tagsJson = json['tags']!;
    final tags = (tagsJson as List<SymbolTag>);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return CallHierarchyItem(
      data: data,
      detail: detail,
      kind: kind,
      name: name,
      range: range,
      selectionRange: selectionRange,
      tags: tags,
      uri: uri,
    );
  }

  /// A data entry field that is preserved between a call hierarchy prepare
  /// and incoming calls or outgoing calls requests.
  final LSPAny? data;

  /// More detail for this item, e.g. the signature of a function.
  final String? detail;

  /// The kind of this item.
  final SymbolKind kind;

  /// The name of this item.
  final String name;

  /// The range enclosing this symbol not including leading/trailing
  /// whitespace but everything else, e.g. comments and code.
  final Range range;

  /// The range that should be selected and revealed when this symbol is
  /// being picked, e.g. the name of a function. Must be contained by the
  /// {@link CallHierarchyItem.range `range`}.
  final Range selectionRange;

  /// Tags for this item.
  final List<SymbolTag>? tags;

  /// The resource identifier of this item.
  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['data'] = data;
    json['detail'] = detail;
    json['kind'] = kind.value;
    json['name'] = name;
    json['range'] = range.toJson();
    json['selectionRange'] = selectionRange.toJson();
    json['tags'] = tags;
    json['uri'] = uri;
    return json;
  }
}

/// Struct
/// Call hierarchy options used during static or dynamic registration.
/// @since 3.16.0
class CallHierarchyRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        CallHierarchyOptions,
        StaticRegistrationOptions {
  CallHierarchyRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory CallHierarchyRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return CallHierarchyRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameter of a `callHierarchy/incomingCalls` request.
/// @since 3.16.0
class CallHierarchyIncomingCallsParams
    implements WorkDoneProgressParams, PartialResultParams {
  CallHierarchyIncomingCallsParams({
    required this.item,
    required this.partialResultToken,
    required this.workDoneToken,
  });

  factory CallHierarchyIncomingCallsParams.fromJson(Map<String, Object?> json) {
    final itemJson = json['item']!;
    final item = CallHierarchyItem.fromJson((itemJson as Map<String, Object?>));
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return CallHierarchyIncomingCallsParams(
      item: item,
      partialResultToken: partialResultToken,
      workDoneToken: workDoneToken,
    );
  }

  final CallHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['item'] = item.toJson();
    json['partialResultToken'] = partialResultToken;
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Represents an incoming call, e.g. a caller of a method or constructor.
/// @since 3.16.0
class CallHierarchyIncomingCall implements ToJson {
  CallHierarchyIncomingCall({required this.from, required this.fromRanges});

  factory CallHierarchyIncomingCall.fromJson(Map<String, Object?> json) {
    final fromJson = json['from']!;
    final from = CallHierarchyItem.fromJson((fromJson as Map<String, Object?>));
    final fromRangesJson = json['fromRanges']!;
    final fromRanges = (fromRangesJson as List<Range>);

    return CallHierarchyIncomingCall(from: from, fromRanges: fromRanges);
  }

  /// The item that makes the call.
  final CallHierarchyItem from;

  /// The ranges at which the calls appear. This is relative to the caller
  /// denoted by {@link CallHierarchyIncomingCall.from `this.from`}.
  final List<Range> fromRanges;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['from'] = from.toJson();
    json['fromRanges'] = fromRanges;
    return json;
  }
}

/// Struct
/// The parameter of a `callHierarchy/outgoingCalls` request.
/// @since 3.16.0
class CallHierarchyOutgoingCallsParams
    implements WorkDoneProgressParams, PartialResultParams {
  CallHierarchyOutgoingCallsParams({
    required this.item,
    required this.partialResultToken,
    required this.workDoneToken,
  });

  factory CallHierarchyOutgoingCallsParams.fromJson(Map<String, Object?> json) {
    final itemJson = json['item']!;
    final item = CallHierarchyItem.fromJson((itemJson as Map<String, Object?>));
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return CallHierarchyOutgoingCallsParams(
      item: item,
      partialResultToken: partialResultToken,
      workDoneToken: workDoneToken,
    );
  }

  final CallHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['item'] = item.toJson();
    json['partialResultToken'] = partialResultToken;
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Represents an outgoing call, e.g. calling a getter from a method or a
/// method from a constructor etc.
/// @since 3.16.0
class CallHierarchyOutgoingCall implements ToJson {
  CallHierarchyOutgoingCall({required this.fromRanges, required this.to});

  factory CallHierarchyOutgoingCall.fromJson(Map<String, Object?> json) {
    final fromRangesJson = json['fromRanges']!;
    final fromRanges = (fromRangesJson as List<Range>);
    final toJson = json['to']!;
    final to = CallHierarchyItem.fromJson((toJson as Map<String, Object?>));

    return CallHierarchyOutgoingCall(fromRanges: fromRanges, to: to);
  }

  /// The range at which this item is called. This is the range relative to
  /// the caller, e.g the item passed to {@link
  /// CallHierarchyItemProvider.provideCallHierarchyOutgoingCalls
  /// `provideCallHierarchyOutgoingCalls`} and not {@link
  /// CallHierarchyOutgoingCall.to `this.to`}.
  final List<Range> fromRanges;

  /// The item that is called.
  final CallHierarchyItem to;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['fromRanges'] = fromRanges;
    json['to'] = to.toJson();
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensParams
    implements WorkDoneProgressParams, PartialResultParams {
  SemanticTokensParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory SemanticTokensParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return SemanticTokensParams(
      partialResultToken: partialResultToken,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokens implements ToJson {
  SemanticTokens({required this.data, required this.resultId});

  factory SemanticTokens.fromJson(Map<String, Object?> json) {
    final dataJson = json['data']!;
    final data = (dataJson as List<int>);
    final resultIdJson = json['resultId']!;
    final resultId = (resultIdJson as String);

    return SemanticTokens(data: data, resultId: resultId);
  }

  /// The actual tokens.
  final List<int> data;

  /// An optional result id. If provided and clients support delta updating
  /// the client will include the result id in the next semantic token
  /// request. A server can then instead of computing all semantic tokens
  /// again simply send a delta.
  final String? resultId;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['data'] = data;
    json['resultId'] = resultId;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensPartialResult implements ToJson {
  SemanticTokensPartialResult({required this.data});

  factory SemanticTokensPartialResult.fromJson(Map<String, Object?> json) {
    final dataJson = json['data']!;
    final data = (dataJson as List<int>);

    return SemanticTokensPartialResult(data: data);
  }

  final List<int> data;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['data'] = data;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        SemanticTokensOptions,
        StaticRegistrationOptions {
  SemanticTokensRegistrationOptions({
    required this.documentSelector,
    required this.full,
    required this.id,
    required this.legend,
    required this.range,
    required this.workDoneProgress,
  });

  factory SemanticTokensRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final fullJson = json['full']!;
    final full = (fullJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final legendJson = json['legend']!;
    final legend = SemanticTokensLegend.fromJson(
      (legendJson as Map<String, Object?>),
    );
    final rangeJson = json['range']!;
    final range = (rangeJson as OrRefType);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return SemanticTokensRegistrationOptions(
      documentSelector: documentSelector,
      full: full,
      id: id,
      legend: legend,
      range: range,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// Server supports providing semantic tokens for a full document.
  @override
  final OrRefType? full;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  /// The legend used by the server
  @override
  final SemanticTokensLegend legend;

  /// Server supports providing semantic tokens for a specific range of a
  /// document.
  @override
  final OrRefType? range;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['full'] = full;
    json['id'] = id;
    json['legend'] = legend.toJson();
    json['range'] = range;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensDeltaParams
    implements WorkDoneProgressParams, PartialResultParams {
  SemanticTokensDeltaParams({
    required this.partialResultToken,
    required this.previousResultId,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory SemanticTokensDeltaParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final previousResultIdJson = json['previousResultId']!;
    final previousResultId = (previousResultIdJson as String);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return SemanticTokensDeltaParams(
      partialResultToken: partialResultToken,
      previousResultId: previousResultId,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The result id of a previous response. The result Id can either point to
  /// a full response or a delta response depending on what was received
  /// last.
  final String previousResultId;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['previousResultId'] = previousResultId;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensDelta implements ToJson {
  SemanticTokensDelta({required this.edits, required this.resultId});

  factory SemanticTokensDelta.fromJson(Map<String, Object?> json) {
    final editsJson = json['edits']!;
    final edits = (editsJson as List<SemanticTokensEdit>);
    final resultIdJson = json['resultId']!;
    final resultId = (resultIdJson as String);

    return SemanticTokensDelta(edits: edits, resultId: resultId);
  }

  /// The semantic token edits to transform a previous result into a new
  /// result.
  final List<SemanticTokensEdit> edits;

  final String? resultId;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['edits'] = edits;
    json['resultId'] = resultId;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensDeltaPartialResult implements ToJson {
  SemanticTokensDeltaPartialResult({required this.edits});

  factory SemanticTokensDeltaPartialResult.fromJson(Map<String, Object?> json) {
    final editsJson = json['edits']!;
    final edits = (editsJson as List<SemanticTokensEdit>);

    return SemanticTokensDeltaPartialResult(edits: edits);
  }

  final List<SemanticTokensEdit> edits;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['edits'] = edits;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensRangeParams
    implements WorkDoneProgressParams, PartialResultParams {
  SemanticTokensRangeParams({
    required this.partialResultToken,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory SemanticTokensRangeParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return SemanticTokensRangeParams(
      partialResultToken: partialResultToken,
      range: range,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The range the semantic tokens are requested for.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['range'] = range.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Params to show a resource in the UI.
/// @since 3.16.0
class ShowDocumentParams implements ToJson {
  ShowDocumentParams({
    required this.external,
    required this.selection,
    required this.takeFocus,
    required this.uri,
  });

  factory ShowDocumentParams.fromJson(Map<String, Object?> json) {
    final externalJson = json['external']!;
    final external = (externalJson as bool);
    final selectionJson = json['selection']!;
    final selection = Range.fromJson((selectionJson as Map<String, Object?>));
    final takeFocusJson = json['takeFocus']!;
    final takeFocus = (takeFocusJson as bool);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return ShowDocumentParams(
      external: external,
      selection: selection,
      takeFocus: takeFocus,
      uri: uri,
    );
  }

  /// Indicates to show the resource in an external program. To show, for
  /// example, `https://code.visualstudio.com/` in the default WEB browser
  /// set `external` to `true`.
  final bool? external;

  /// An optional selection range if the document is a text document. Clients
  /// might ignore the property if an external program is started or the file
  /// is not a text file.
  final Range? selection;

  /// An optional property to indicate whether the editor showing the
  /// document should take focus or not. Clients might ignore this property
  /// if an external program is started.
  final bool? takeFocus;

  /// The uri to show.
  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['external'] = external;
    json['selection'] = selection?.toJson();
    json['takeFocus'] = takeFocus;
    json['uri'] = uri;
    return json;
  }
}

/// Struct
/// The result of a showDocument request.
/// @since 3.16.0
class ShowDocumentResult implements ToJson {
  ShowDocumentResult({required this.success});

  factory ShowDocumentResult.fromJson(Map<String, Object?> json) {
    final successJson = json['success']!;
    final success = (successJson as bool);

    return ShowDocumentResult(success: success);
  }

  /// A boolean indicating if the show was successful.
  final bool success;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['success'] = success;
    return json;
  }
}

/// Struct
class LinkedEditingRangeParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  LinkedEditingRangeParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory LinkedEditingRangeParams.fromJson(Map<String, Object?> json) {
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return LinkedEditingRangeParams(
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// The result of a linked editing range request.
/// @since 3.16.0
class LinkedEditingRanges implements ToJson {
  LinkedEditingRanges({required this.ranges, required this.wordPattern});

  factory LinkedEditingRanges.fromJson(Map<String, Object?> json) {
    final rangesJson = json['ranges']!;
    final ranges = (rangesJson as List<Range>);
    final wordPatternJson = json['wordPattern']!;
    final wordPattern = (wordPatternJson as String);

    return LinkedEditingRanges(ranges: ranges, wordPattern: wordPattern);
  }

  /// A list of ranges that can be edited together. The ranges must have
  /// identical length and contain identical text content. The ranges cannot
  /// overlap.
  final List<Range> ranges;

  /// An optional word pattern (regular expression) that describes valid
  /// contents for the given ranges. If no pattern is provided, the client
  /// configuration's word pattern will be used.
  final String? wordPattern;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['ranges'] = ranges;
    json['wordPattern'] = wordPattern;
    return json;
  }
}

/// Struct
class LinkedEditingRangeRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        LinkedEditingRangeOptions,
        StaticRegistrationOptions {
  LinkedEditingRangeRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory LinkedEditingRangeRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return LinkedEditingRangeRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameters sent in notifications/requests for user-initiated creation
/// of files.
/// @since 3.16.0
class CreateFilesParams implements ToJson {
  CreateFilesParams({required this.files});

  factory CreateFilesParams.fromJson(Map<String, Object?> json) {
    final filesJson = json['files']!;
    final files = (filesJson as List<FileCreate>);

    return CreateFilesParams(files: files);
  }

  /// An array of all files/folders created in this operation.
  final List<FileCreate> files;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['files'] = files;
    return json;
  }
}

/// Struct
/// A workspace edit represents changes to many resources managed in the
/// workspace. The edit should either provide `changes` or `documentChanges`.
/// If documentChanges are present they are preferred over `changes` if the
/// client can handle versioned document edits.
/// Since version 3.13.0 a workspace edit can contain resource operations as
/// well. If resource operations are present clients need to execute the
/// operations in the order in which they are provided. So a workspace edit for
/// example can consist of the following two changes: (1) a create file a.txt
/// and (2) a text document edit which insert text into file a.txt.
/// An invalid sequence (e.g. (1) delete file a.txt and (2) insert text into
/// file a.txt) will cause failure of the operation. How the client recovers
/// from the failure is described by the client capability:
/// `workspace.workspaceEdit.failureHandling`
class WorkspaceEdit implements ToJson {
  WorkspaceEdit({
    required this.changeAnnotations,
    required this.changes,
    required this.documentChanges,
  });

  factory WorkspaceEdit.fromJson(Map<String, Object?> json) {
    final changeAnnotationsJson = json['changeAnnotations']!;
    final changeAnnotations =
        (changeAnnotationsJson
            as Map<ChangeAnnotationIdentifier, ChangeAnnotation>);
    final changesJson = json['changes']!;
    final changes = (changesJson as Map<Uri, List<TextEdit>>);
    final documentChangesJson = json['documentChanges']!;
    final documentChanges = (documentChangesJson as List<OrRefType>);

    return WorkspaceEdit(
      changeAnnotations: changeAnnotations,
      changes: changes,
      documentChanges: documentChanges,
    );
  }

  /// A map of change annotations that can be referenced in
  /// `AnnotatedTextEdit`s or create, rename and delete file / folder
  /// operations.
  /// Whether clients honor this property depends on the client capability
  /// `workspace.changeAnnotationSupport`.
  /// @since 3.16.0
  final Map<ChangeAnnotationIdentifier, ChangeAnnotation>? changeAnnotations;

  /// Holds changes to existing resources.
  final Map<Uri, List<TextEdit>>? changes;

  /// Depending on the client capability
  /// `workspace.workspaceEdit.resourceOperations` document changes are
  /// either an array of `TextDocumentEdit`s to express changes to n
  /// different text documents where each text document edit addresses a
  /// specific version of a text document. Or it can contain above
  /// `TextDocumentEdit`s mixed with create, rename and delete file / folder
  /// operations.
  /// Whether a client supports versioned document edits is expressed via
  /// `workspace.workspaceEdit.documentChanges` client capability.
  /// If a client neither supports `documentChanges` nor
  /// `workspace.workspaceEdit.resourceOperations` then only plain
  /// `TextEdit`s using the `changes` property are supported.
  final List<OrRefType>? documentChanges;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['changeAnnotations'] = changeAnnotations;
    json['changes'] = changes;
    json['documentChanges'] = documentChanges;
    return json;
  }
}

/// Struct
/// The options to register for file operations.
/// @since 3.16.0
class FileOperationRegistrationOptions implements ToJson {
  FileOperationRegistrationOptions({required this.filters});

  factory FileOperationRegistrationOptions.fromJson(Map<String, Object?> json) {
    final filtersJson = json['filters']!;
    final filters = (filtersJson as List<FileOperationFilter>);

    return FileOperationRegistrationOptions(filters: filters);
  }

  /// The actual filters.
  final List<FileOperationFilter> filters;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['filters'] = filters;
    return json;
  }
}

/// Struct
/// The parameters sent in notifications/requests for user-initiated renames of
/// files.
/// @since 3.16.0
class RenameFilesParams implements ToJson {
  RenameFilesParams({required this.files});

  factory RenameFilesParams.fromJson(Map<String, Object?> json) {
    final filesJson = json['files']!;
    final files = (filesJson as List<FileRename>);

    return RenameFilesParams(files: files);
  }

  /// An array of all files/folders renamed in this operation. When a folder
  /// is renamed, only the folder will be included, and not its children.
  final List<FileRename> files;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['files'] = files;
    return json;
  }
}

/// Struct
/// The parameters sent in notifications/requests for user-initiated deletes of
/// files.
/// @since 3.16.0
class DeleteFilesParams implements ToJson {
  DeleteFilesParams({required this.files});

  factory DeleteFilesParams.fromJson(Map<String, Object?> json) {
    final filesJson = json['files']!;
    final files = (filesJson as List<FileDelete>);

    return DeleteFilesParams(files: files);
  }

  /// An array of all files/folders deleted in this operation.
  final List<FileDelete> files;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['files'] = files;
    return json;
  }
}

/// Struct
class MonikerParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  MonikerParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory MonikerParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return MonikerParams(
      partialResultToken: partialResultToken,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Moniker definition to match LSIF 0.5 moniker definition.
/// @since 3.16.0
class Moniker implements ToJson {
  Moniker({
    required this.identifier,
    required this.kind,
    required this.scheme,
    required this.unique,
  });

  factory Moniker.fromJson(Map<String, Object?> json) {
    final identifierJson = json['identifier']!;
    final identifier = (identifierJson as String);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$MonikerKindEnumMap, kindJson);
    final schemeJson = json['scheme']!;
    final scheme = (schemeJson as String);
    final uniqueJson = json['unique']!;
    // Handle enum type
    final unique = _i1.$enumDecode(_$UniquenessLevelEnumMap, uniqueJson);

    return Moniker(
      identifier: identifier,
      kind: kind,
      scheme: scheme,
      unique: unique,
    );
  }

  /// The identifier of the moniker. The value is opaque in LSIF however
  /// schema owners are allowed to define the structure if they want.
  final String identifier;

  /// The moniker kind if known.
  final MonikerKind? kind;

  /// The scheme of the moniker. For example tsc or .Net
  final String scheme;

  /// The scope in which the moniker is unique
  final UniquenessLevel unique;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['identifier'] = identifier;
    json['kind'] = kind?.value;
    json['scheme'] = scheme;
    json['unique'] = unique.value;
    return json;
  }
}

/// Struct
class MonikerRegistrationOptions
    implements TextDocumentRegistrationOptions, MonikerOptions {
  MonikerRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  factory MonikerRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return MonikerRegistrationOptions(
      documentSelector: documentSelector,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameter of a `textDocument/prepareTypeHierarchy` request.
/// @since 3.17.0
class TypeHierarchyPrepareParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  TypeHierarchyPrepareParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory TypeHierarchyPrepareParams.fromJson(Map<String, Object?> json) {
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return TypeHierarchyPrepareParams(
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// @since 3.17.0
class TypeHierarchyItem implements ToJson {
  TypeHierarchyItem({
    required this.data,
    required this.detail,
    required this.kind,
    required this.name,
    required this.range,
    required this.selectionRange,
    required this.tags,
    required this.uri,
  });

  factory TypeHierarchyItem.fromJson(Map<String, Object?> json) {
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);
    final detailJson = json['detail']!;
    final detail = (detailJson as String);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$SymbolKindEnumMap, kindJson);
    final nameJson = json['name']!;
    final name = (nameJson as String);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final selectionRangeJson = json['selectionRange']!;
    final selectionRange = Range.fromJson(
      (selectionRangeJson as Map<String, Object?>),
    );
    final tagsJson = json['tags']!;
    final tags = (tagsJson as List<SymbolTag>);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return TypeHierarchyItem(
      data: data,
      detail: detail,
      kind: kind,
      name: name,
      range: range,
      selectionRange: selectionRange,
      tags: tags,
      uri: uri,
    );
  }

  /// A data entry field that is preserved between a type hierarchy prepare
  /// and supertypes or subtypes requests. It could also be used to identify
  /// the type hierarchy in the server, helping improve the performance on
  /// resolving supertypes and subtypes.
  final LSPAny? data;

  /// More detail for this item, e.g. the signature of a function.
  final String? detail;

  /// The kind of this item.
  final SymbolKind kind;

  /// The name of this item.
  final String name;

  /// The range enclosing this symbol not including leading/trailing
  /// whitespace but everything else, e.g. comments and code.
  final Range range;

  /// The range that should be selected and revealed when this symbol is
  /// being picked, e.g. the name of a function. Must be contained by the
  /// {@link TypeHierarchyItem.range `range`}.
  final Range selectionRange;

  /// Tags for this item.
  final List<SymbolTag>? tags;

  /// The resource identifier of this item.
  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['data'] = data;
    json['detail'] = detail;
    json['kind'] = kind.value;
    json['name'] = name;
    json['range'] = range.toJson();
    json['selectionRange'] = selectionRange.toJson();
    json['tags'] = tags;
    json['uri'] = uri;
    return json;
  }
}

/// Struct
/// Type hierarchy options used during static or dynamic registration.
/// @since 3.17.0
class TypeHierarchyRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        TypeHierarchyOptions,
        StaticRegistrationOptions {
  TypeHierarchyRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory TypeHierarchyRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return TypeHierarchyRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameter of a `typeHierarchy/supertypes` request.
/// @since 3.17.0
class TypeHierarchySupertypesParams
    implements WorkDoneProgressParams, PartialResultParams {
  TypeHierarchySupertypesParams({
    required this.item,
    required this.partialResultToken,
    required this.workDoneToken,
  });

  factory TypeHierarchySupertypesParams.fromJson(Map<String, Object?> json) {
    final itemJson = json['item']!;
    final item = TypeHierarchyItem.fromJson((itemJson as Map<String, Object?>));
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return TypeHierarchySupertypesParams(
      item: item,
      partialResultToken: partialResultToken,
      workDoneToken: workDoneToken,
    );
  }

  final TypeHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['item'] = item.toJson();
    json['partialResultToken'] = partialResultToken;
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// The parameter of a `typeHierarchy/subtypes` request.
/// @since 3.17.0
class TypeHierarchySubtypesParams
    implements WorkDoneProgressParams, PartialResultParams {
  TypeHierarchySubtypesParams({
    required this.item,
    required this.partialResultToken,
    required this.workDoneToken,
  });

  factory TypeHierarchySubtypesParams.fromJson(Map<String, Object?> json) {
    final itemJson = json['item']!;
    final item = TypeHierarchyItem.fromJson((itemJson as Map<String, Object?>));
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return TypeHierarchySubtypesParams(
      item: item,
      partialResultToken: partialResultToken,
      workDoneToken: workDoneToken,
    );
  }

  final TypeHierarchyItem item;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['item'] = item.toJson();
    json['partialResultToken'] = partialResultToken;
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// A parameter literal used in inline value requests.
/// @since 3.17.0
class InlineValueParams implements WorkDoneProgressParams {
  InlineValueParams({
    required this.context,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory InlineValueParams.fromJson(Map<String, Object?> json) {
    final contextJson = json['context']!;
    final context = InlineValueContext.fromJson(
      (contextJson as Map<String, Object?>),
    );
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return InlineValueParams(
      context: context,
      range: range,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// Additional information about the context in which inline values were
  /// requested.
  final InlineValueContext context;

  /// The document range for which inline values should be computed.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['context'] = context.toJson();
    json['range'] = range.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Inline value options used during static or dynamic registration.
/// @since 3.17.0
class InlineValueRegistrationOptions
    implements
        InlineValueOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  InlineValueRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory InlineValueRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return InlineValueRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// A parameter literal used in inlay hint requests.
/// @since 3.17.0
class InlayHintParams implements WorkDoneProgressParams {
  InlayHintParams({
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory InlayHintParams.fromJson(Map<String, Object?> json) {
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return InlayHintParams(
      range: range,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The document range for which inlay hints should be computed.
  final Range range;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['range'] = range.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Inlay hint information.
/// @since 3.17.0
class InlayHint implements ToJson {
  InlayHint({
    required this.data,
    required this.kind,
    required this.label,
    required this.paddingLeft,
    required this.paddingRight,
    required this.position,
    required this.textEdits,
    required this.tooltip,
  });

  factory InlayHint.fromJson(Map<String, Object?> json) {
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$InlayHintKindEnumMap, kindJson);
    final labelJson = json['label']!;
    final label = (labelJson as OrRefType);
    final paddingLeftJson = json['paddingLeft']!;
    final paddingLeft = (paddingLeftJson as bool);
    final paddingRightJson = json['paddingRight']!;
    final paddingRight = (paddingRightJson as bool);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textEditsJson = json['textEdits']!;
    final textEdits = (textEditsJson as List<TextEdit>);
    final tooltipJson = json['tooltip']!;
    final tooltip = (tooltipJson as OrRefType);

    return InlayHint(
      data: data,
      kind: kind,
      label: label,
      paddingLeft: paddingLeft,
      paddingRight: paddingRight,
      position: position,
      textEdits: textEdits,
      tooltip: tooltip,
    );
  }

  /// A data entry field that is preserved on an inlay hint between a
  /// `textDocument/inlayHint` and a `inlayHint/resolve` request.
  final LSPAny? data;

  /// The kind of this hint. Can be omitted in which case the client should
  /// fall back to a reasonable default.
  final InlayHintKind? kind;

  /// The label of this hint. A human readable string or an array of
  /// InlayHintLabelPart label parts.
  /// *Note* that neither the string nor the label part can be empty.
  final OrRefType label;

  /// Render padding before the hint.
  /// Note: Padding should use the editor's background color, not the
  /// background color of the hint itself. That means padding can be used to
  /// visually align/separate an inlay hint.
  final bool? paddingLeft;

  /// Render padding after the hint.
  /// Note: Padding should use the editor's background color, not the
  /// background color of the hint itself. That means padding can be used to
  /// visually align/separate an inlay hint.
  final bool? paddingRight;

  /// The position of this hint.
  /// If multiple hints have the same position, they will be shown in the
  /// order they appear in the response.
  final Position position;

  /// Optional text edits that are performed when accepting this inlay hint.
  /// *Note* that edits are expected to change the document so that the inlay
  /// hint (or its nearest variant) is now part of the document and the inlay
  /// hint itself is now obsolete.
  final List<TextEdit>? textEdits;

  /// The tooltip text when you hover over this item.
  final OrRefType? tooltip;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['data'] = data;
    json['kind'] = kind?.value;
    json['label'] = label;
    json['paddingLeft'] = paddingLeft;
    json['paddingRight'] = paddingRight;
    json['position'] = position.toJson();
    json['textEdits'] = textEdits;
    json['tooltip'] = tooltip;
    return json;
  }
}

/// Struct
/// Inlay hint options used during static or dynamic registration.
/// @since 3.17.0
class InlayHintRegistrationOptions
    implements
        InlayHintOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  InlayHintRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory InlayHintRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return InlayHintRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  /// The server provides support to resolve additional information for an
  /// inlay hint item.
  @override
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Parameters of the document diagnostic request.
/// @since 3.17.0
class DocumentDiagnosticParams
    implements WorkDoneProgressParams, PartialResultParams {
  DocumentDiagnosticParams({
    required this.identifier,
    required this.partialResultToken,
    required this.previousResultId,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DocumentDiagnosticParams.fromJson(Map<String, Object?> json) {
    final identifierJson = json['identifier']!;
    final identifier = (identifierJson as String);
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final previousResultIdJson = json['previousResultId']!;
    final previousResultId = (previousResultIdJson as String);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DocumentDiagnosticParams(
      identifier: identifier,
      partialResultToken: partialResultToken,
      previousResultId: previousResultId,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The additional identifier  provided during registration.
  final String? identifier;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The result id of a previous response if provided.
  final String? previousResultId;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['identifier'] = identifier;
    json['partialResultToken'] = partialResultToken;
    json['previousResultId'] = previousResultId;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// A partial result for a document diagnostic report.
/// @since 3.17.0
class DocumentDiagnosticReportPartialResult implements ToJson {
  DocumentDiagnosticReportPartialResult({required this.relatedDocuments});

  factory DocumentDiagnosticReportPartialResult.fromJson(
    Map<String, Object?> json,
  ) {
    final relatedDocumentsJson = json['relatedDocuments']!;
    final relatedDocuments = (relatedDocumentsJson as Map<Uri, OrRefType>);

    return DocumentDiagnosticReportPartialResult(
      relatedDocuments: relatedDocuments,
    );
  }

  final Map<Uri, OrRefType> relatedDocuments;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['relatedDocuments'] = relatedDocuments;
    return json;
  }
}

/// Struct
/// Cancellation data returned from a diagnostic request.
/// @since 3.17.0
class DiagnosticServerCancellationData implements ToJson {
  DiagnosticServerCancellationData({required this.retriggerRequest});

  factory DiagnosticServerCancellationData.fromJson(Map<String, Object?> json) {
    final retriggerRequestJson = json['retriggerRequest']!;
    final retriggerRequest = (retriggerRequestJson as bool);

    return DiagnosticServerCancellationData(retriggerRequest: retriggerRequest);
  }

  final bool retriggerRequest;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['retriggerRequest'] = retriggerRequest;
    return json;
  }
}

/// Struct
/// Diagnostic registration options.
/// @since 3.17.0
class DiagnosticRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DiagnosticOptions,
        StaticRegistrationOptions {
  DiagnosticRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.identifier,
    required this.interFileDependencies,
    required this.workDoneProgress,
    required this.workspaceDiagnostics,
  });

  factory DiagnosticRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final identifierJson = json['identifier']!;
    final identifier = (identifierJson as String);
    final interFileDependenciesJson = json['interFileDependencies']!;
    final interFileDependencies = (interFileDependenciesJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);
    final workspaceDiagnosticsJson = json['workspaceDiagnostics']!;
    final workspaceDiagnostics = (workspaceDiagnosticsJson as bool);

    return DiagnosticRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      identifier: identifier,
      interFileDependencies: interFileDependencies,
      workDoneProgress: workDoneProgress,
      workspaceDiagnostics: workspaceDiagnostics,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  /// An optional identifier under which the diagnostics are managed by the
  /// client.
  @override
  final String? identifier;

  /// Whether the language has inter file dependencies meaning that editing
  /// code in one file can result in a different diagnostic set in another
  /// file. Inter file dependencies are common for most programming languages
  /// and typically uncommon for linters.
  @override
  final bool interFileDependencies;

  @override
  final bool? workDoneProgress;

  /// The server provides support for workspace diagnostics as well.
  @override
  final bool workspaceDiagnostics;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['identifier'] = identifier;
    json['interFileDependencies'] = interFileDependencies;
    json['workDoneProgress'] = workDoneProgress;
    json['workspaceDiagnostics'] = workspaceDiagnostics;
    return json;
  }
}

/// Struct
/// Parameters of the workspace diagnostic request.
/// @since 3.17.0
class WorkspaceDiagnosticParams
    implements WorkDoneProgressParams, PartialResultParams {
  WorkspaceDiagnosticParams({
    required this.identifier,
    required this.partialResultToken,
    required this.previousResultIds,
    required this.workDoneToken,
  });

  factory WorkspaceDiagnosticParams.fromJson(Map<String, Object?> json) {
    final identifierJson = json['identifier']!;
    final identifier = (identifierJson as String);
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final previousResultIdsJson = json['previousResultIds']!;
    final previousResultIds = (previousResultIdsJson as List<PreviousResultId>);
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return WorkspaceDiagnosticParams(
      identifier: identifier,
      partialResultToken: partialResultToken,
      previousResultIds: previousResultIds,
      workDoneToken: workDoneToken,
    );
  }

  /// The additional identifier provided during registration.
  final String? identifier;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The currently known diagnostic reports with their previous result ids.
  final List<PreviousResultId> previousResultIds;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['identifier'] = identifier;
    json['partialResultToken'] = partialResultToken;
    json['previousResultIds'] = previousResultIds;
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// A workspace diagnostic report.
/// @since 3.17.0
class WorkspaceDiagnosticReport implements ToJson {
  WorkspaceDiagnosticReport({required this.items});

  factory WorkspaceDiagnosticReport.fromJson(Map<String, Object?> json) {
    final itemsJson = json['items']!;
    final items = (itemsJson as List<WorkspaceDocumentDiagnosticReport>);

    return WorkspaceDiagnosticReport(items: items);
  }

  final List<WorkspaceDocumentDiagnosticReport> items;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['items'] = items;
    return json;
  }
}

/// Struct
/// A partial result for a workspace diagnostic report.
/// @since 3.17.0
class WorkspaceDiagnosticReportPartialResult implements ToJson {
  WorkspaceDiagnosticReportPartialResult({required this.items});

  factory WorkspaceDiagnosticReportPartialResult.fromJson(
    Map<String, Object?> json,
  ) {
    final itemsJson = json['items']!;
    final items = (itemsJson as List<WorkspaceDocumentDiagnosticReport>);

    return WorkspaceDiagnosticReportPartialResult(items: items);
  }

  final List<WorkspaceDocumentDiagnosticReport> items;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['items'] = items;
    return json;
  }
}

/// Struct
/// The params sent in an open notebook document notification.
/// @since 3.17.0
class DidOpenNotebookDocumentParams implements ToJson {
  DidOpenNotebookDocumentParams({
    required this.cellTextDocuments,
    required this.notebookDocument,
  });

  factory DidOpenNotebookDocumentParams.fromJson(Map<String, Object?> json) {
    final cellTextDocumentsJson = json['cellTextDocuments']!;
    final cellTextDocuments = (cellTextDocumentsJson as List<TextDocumentItem>);
    final notebookDocumentJson = json['notebookDocument']!;
    final notebookDocument = NotebookDocument.fromJson(
      (notebookDocumentJson as Map<String, Object?>),
    );

    return DidOpenNotebookDocumentParams(
      cellTextDocuments: cellTextDocuments,
      notebookDocument: notebookDocument,
    );
  }

  /// The text documents that represent the content of a notebook cell.
  final List<TextDocumentItem> cellTextDocuments;

  /// The notebook document that got opened.
  final NotebookDocument notebookDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['cellTextDocuments'] = cellTextDocuments;
    json['notebookDocument'] = notebookDocument.toJson();
    return json;
  }
}

/// Struct
/// The params sent in a change notebook document notification.
/// @since 3.17.0
class DidChangeNotebookDocumentParams implements ToJson {
  DidChangeNotebookDocumentParams({
    required this.change,
    required this.notebookDocument,
  });

  factory DidChangeNotebookDocumentParams.fromJson(Map<String, Object?> json) {
    final changeJson = json['change']!;
    final change = NotebookDocumentChangeEvent.fromJson(
      (changeJson as Map<String, Object?>),
    );
    final notebookDocumentJson = json['notebookDocument']!;
    final notebookDocument = VersionedNotebookDocumentIdentifier.fromJson(
      (notebookDocumentJson as Map<String, Object?>),
    );

    return DidChangeNotebookDocumentParams(
      change: change,
      notebookDocument: notebookDocument,
    );
  }

  /// The actual changes to the notebook document.
  /// The changes describe single state changes to the notebook document. So
  /// if there are two changes c1 (at array index 0) and c2 (at array index
  /// 1) for a notebook in state S then c1 moves the notebook from S to S'
  /// and c2 from S' to S''. So c1 is computed on the state S and c2 is
  /// computed on the state S'.
  /// To mirror the content of a notebook using change events use the
  /// following approach: - start with the same initial content - apply the
  /// 'notebookDocument/didChange' notifications in the order you receive
  /// them. - apply the `NotebookChangeEvent`s in a single notification in
  /// the order you receive them.
  final NotebookDocumentChangeEvent change;

  /// The notebook document that did change. The version number points to the
  /// version after all provided changes have been applied. If only the text
  /// document content of a cell changes the notebook version doesn't
  /// necessarily have to change.
  final VersionedNotebookDocumentIdentifier notebookDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['change'] = change.toJson();
    json['notebookDocument'] = notebookDocument.toJson();
    return json;
  }
}

/// Struct
/// The params sent in a save notebook document notification.
/// @since 3.17.0
class DidSaveNotebookDocumentParams implements ToJson {
  DidSaveNotebookDocumentParams({required this.notebookDocument});

  factory DidSaveNotebookDocumentParams.fromJson(Map<String, Object?> json) {
    final notebookDocumentJson = json['notebookDocument']!;
    final notebookDocument = NotebookDocumentIdentifier.fromJson(
      (notebookDocumentJson as Map<String, Object?>),
    );

    return DidSaveNotebookDocumentParams(notebookDocument: notebookDocument);
  }

  /// The notebook document that got saved.
  final NotebookDocumentIdentifier notebookDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['notebookDocument'] = notebookDocument.toJson();
    return json;
  }
}

/// Struct
/// The params sent in a close notebook document notification.
/// @since 3.17.0
class DidCloseNotebookDocumentParams implements ToJson {
  DidCloseNotebookDocumentParams({
    required this.cellTextDocuments,
    required this.notebookDocument,
  });

  factory DidCloseNotebookDocumentParams.fromJson(Map<String, Object?> json) {
    final cellTextDocumentsJson = json['cellTextDocuments']!;
    final cellTextDocuments =
        (cellTextDocumentsJson as List<TextDocumentIdentifier>);
    final notebookDocumentJson = json['notebookDocument']!;
    final notebookDocument = NotebookDocumentIdentifier.fromJson(
      (notebookDocumentJson as Map<String, Object?>),
    );

    return DidCloseNotebookDocumentParams(
      cellTextDocuments: cellTextDocuments,
      notebookDocument: notebookDocument,
    );
  }

  /// The text documents that represent the content of a notebook cell that
  /// got closed.
  final List<TextDocumentIdentifier> cellTextDocuments;

  /// The notebook document that got closed.
  final NotebookDocumentIdentifier notebookDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['cellTextDocuments'] = cellTextDocuments;
    json['notebookDocument'] = notebookDocument.toJson();
    return json;
  }
}

/// Struct
/// A parameter literal used in inline completion requests.
/// @since 3.18.0 @proposed
class InlineCompletionParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  InlineCompletionParams({
    required this.context,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory InlineCompletionParams.fromJson(Map<String, Object?> json) {
    final contextJson = json['context']!;
    final context = InlineCompletionContext.fromJson(
      (contextJson as Map<String, Object?>),
    );
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return InlineCompletionParams(
      context: context,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// Additional information about the context in which inline completions
  /// were requested.
  final InlineCompletionContext context;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['context'] = context.toJson();
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Represents a collection of {@link InlineCompletionItem inline completion
/// items} to be presented in the editor.
/// @since 3.18.0 @proposed
class InlineCompletionList implements ToJson {
  InlineCompletionList({required this.items});

  factory InlineCompletionList.fromJson(Map<String, Object?> json) {
    final itemsJson = json['items']!;
    final items = (itemsJson as List<InlineCompletionItem>);

    return InlineCompletionList(items: items);
  }

  /// The inline completion items
  final List<InlineCompletionItem> items;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['items'] = items;
    return json;
  }
}

/// Struct
/// An inline completion item represents a text snippet that is proposed inline
/// to complete text that is being typed.
/// @since 3.18.0 @proposed
class InlineCompletionItem implements ToJson {
  InlineCompletionItem({
    required this.command,
    required this.filterText,
    required this.insertText,
    required this.range,
  });

  factory InlineCompletionItem.fromJson(Map<String, Object?> json) {
    final commandJson = json['command']!;
    final command = Command.fromJson((commandJson as Map<String, Object?>));
    final filterTextJson = json['filterText']!;
    final filterText = (filterTextJson as String);
    final insertTextJson = json['insertText']!;
    final insertText = (insertTextJson as OrRefType);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));

    return InlineCompletionItem(
      command: command,
      filterText: filterText,
      insertText: insertText,
      range: range,
    );
  }

  /// An optional {@link Command} that is executed *after* inserting this
  /// completion.
  final Command? command;

  /// A text that is used to decide if this inline completion should be
  /// shown. When `falsy` the {@link InlineCompletionItem.insertText} is
  /// used.
  final String? filterText;

  /// The text to replace the range with. Must be set.
  final OrRefType insertText;

  /// The range to replace. Must begin and end on the same line.
  final Range? range;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['command'] = command?.toJson();
    json['filterText'] = filterText;
    json['insertText'] = insertText;
    json['range'] = range?.toJson();
    return json;
  }
}

/// Struct
/// Inline completion options used during static or dynamic registration.
/// @since 3.18.0 @proposed
class InlineCompletionRegistrationOptions
    implements
        InlineCompletionOptions,
        TextDocumentRegistrationOptions,
        StaticRegistrationOptions {
  InlineCompletionRegistrationOptions({
    required this.documentSelector,
    required this.id,
    required this.workDoneProgress,
  });

  factory InlineCompletionRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final idJson = json['id']!;
    final id = (idJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return InlineCompletionRegistrationOptions(
      documentSelector: documentSelector,
      id: id,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['id'] = id;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
class RegistrationParams implements ToJson {
  RegistrationParams({required this.registrations});

  factory RegistrationParams.fromJson(Map<String, Object?> json) {
    final registrationsJson = json['registrations']!;
    final registrations = (registrationsJson as List<Registration>);

    return RegistrationParams(registrations: registrations);
  }

  final List<Registration> registrations;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['registrations'] = registrations;
    return json;
  }
}

/// Struct
class UnregistrationParams implements ToJson {
  UnregistrationParams({required this.unregisterations});

  factory UnregistrationParams.fromJson(Map<String, Object?> json) {
    final unregisterationsJson = json['unregisterations']!;
    final unregisterations = (unregisterationsJson as List<Unregistration>);

    return UnregistrationParams(unregisterations: unregisterations);
  }

  final List<Unregistration> unregisterations;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['unregisterations'] = unregisterations;
    return json;
  }
}

/// Struct
class InitializeParams
    implements _InitializeParams, WorkspaceFoldersInitializeParams {
  InitializeParams({
    required this.capabilities,
    required this.clientInfo,
    required this.initializationOptions,
    required this.locale,
    required this.processId,
    required this.rootPath,
    required this.rootUri,
    required this.trace,
    required this.workDoneToken,
    required this.workspaceFolders,
  });

  factory InitializeParams.fromJson(Map<String, Object?> json) {
    final capabilitiesJson = json['capabilities']!;
    final capabilities = ClientCapabilities.fromJson(
      (capabilitiesJson as Map<String, Object?>),
    );
    final clientInfoJson = json['clientInfo']!;
    final clientInfo = (clientInfoJson as InitializeParamsClientInfo);
    final initializationOptionsJson = json['initializationOptions']!;
    final initializationOptions = (initializationOptionsJson as LSPAny);
    final localeJson = json['locale']!;
    final locale = (localeJson as String);
    final processIdJson = json['processId']!;
    final processId = (processIdJson as OrRefType);
    final rootPathJson = json['rootPath']!;
    final rootPath = (rootPathJson as OrRefType);
    final rootUriJson = json['rootUri']!;
    final rootUri = (rootUriJson as OrRefType);
    final traceJson = json['trace']!;
    // Handle enum type
    final trace = _i1.$enumDecode(_$TraceValuesEnumMap, traceJson);
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);
    final workspaceFoldersJson = json['workspaceFolders']!;
    final workspaceFolders = (workspaceFoldersJson as OrRefType);

    return InitializeParams(
      capabilities: capabilities,
      clientInfo: clientInfo,
      initializationOptions: initializationOptions,
      locale: locale,
      processId: processId,
      rootPath: rootPath,
      rootUri: rootUri,
      trace: trace,
      workDoneToken: workDoneToken,
      workspaceFolders: workspaceFolders,
    );
  }

  /// The capabilities provided by the client (editor or tool)
  @override
  final ClientCapabilities capabilities;

  /// Information about the client
  /// @since 3.15.0
  @override
  final InitializeParamsClientInfo? clientInfo;

  /// User provided initialization options.
  @override
  final LSPAny? initializationOptions;

  /// The locale the client is currently showing the user interface in. This
  /// must not necessarily be the locale of the operating system.
  /// Uses IETF language tags as the value's syntax (See
  /// https://en.wikipedia.org/wiki/IETF_language_tag)
  /// @since 3.16.0
  @override
  final String? locale;

  /// The process Id of the parent process that started the server.
  /// Is `null` if the process has not been started by another process. If
  /// the parent process is not alive then the server should exit.
  @override
  final OrRefType processId;

  /// The rootPath of the workspace. Is null if no folder is open.
  /// @deprecated in favour of rootUri.
  @override
  final OrRefType? rootPath;

  /// The rootUri of the workspace. Is null if no folder is open. If both
  /// `rootPath` and `rootUri` are set `rootUri` wins.
  /// @deprecated in favour of workspaceFolders.
  @override
  final OrRefType rootUri;

  /// The initial trace setting. If omitted trace is disabled ('off').
  @override
  final TraceValues? trace;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  /// The workspace folders configured in the client when the server starts.
  /// This property is only available if the client supports workspace
  /// folders. It can be `null` if the client supports workspace folders but
  /// none are configured.
  /// @since 3.6.0
  @override
  final OrRefType? workspaceFolders;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['capabilities'] = capabilities.toJson();
    json['clientInfo'] = clientInfo;
    json['initializationOptions'] = initializationOptions;
    json['locale'] = locale;
    json['processId'] = processId;
    json['rootPath'] = rootPath;
    json['rootUri'] = rootUri;
    json['trace'] = trace?.value;
    json['workDoneToken'] = workDoneToken;
    json['workspaceFolders'] = workspaceFolders;
    return json;
  }
}

/// Struct
/// The result returned from an initialize request.
class InitializeResult implements ToJson {
  InitializeResult({required this.capabilities, required this.serverInfo});

  factory InitializeResult.fromJson(Map<String, Object?> json) {
    final capabilitiesJson = json['capabilities']!;
    final capabilities = ServerCapabilities.fromJson(
      (capabilitiesJson as Map<String, Object?>),
    );
    final serverInfoJson = json['serverInfo']!;
    final serverInfo = (serverInfoJson as InitializeResultServerInfo);

    return InitializeResult(capabilities: capabilities, serverInfo: serverInfo);
  }

  /// The capabilities the language server provides.
  final ServerCapabilities capabilities;

  /// Information about the server.
  /// @since 3.15.0
  final InitializeResultServerInfo? serverInfo;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['capabilities'] = capabilities.toJson();
    json['serverInfo'] = serverInfo;
    return json;
  }
}

/// Struct
/// The data type of the ResponseError if the initialize request fails.
class InitializeError implements ToJson {
  InitializeError({required this.retry});

  factory InitializeError.fromJson(Map<String, Object?> json) {
    final retryJson = json['retry']!;
    final retry = (retryJson as bool);

    return InitializeError(retry: retry);
  }

  /// Indicates whether the client execute the following retry logic: (1)
  /// show the message provided by the ResponseError to the user (2) user
  /// selects retry or cancel (3) if user selected retry the initialize
  /// method is sent again.
  final bool retry;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['retry'] = retry;
    return json;
  }
}

/// Struct
class InitializedParams implements ToJson {
  InitializedParams();

  factory InitializedParams.fromJson(Map<String, Object?> json) {
    // No fields to parse
    final _ = json;

    return InitializedParams();
  }

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    return json;
  }
}

/// Struct
/// The parameters of a change configuration notification.
class DidChangeConfigurationParams implements ToJson {
  DidChangeConfigurationParams({required this.settings});

  factory DidChangeConfigurationParams.fromJson(Map<String, Object?> json) {
    final settingsJson = json['settings']!;
    final settings = (settingsJson as LSPAny);

    return DidChangeConfigurationParams(settings: settings);
  }

  /// The actual changed settings
  final LSPAny settings;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['settings'] = settings;
    return json;
  }
}

/// Struct
class DidChangeConfigurationRegistrationOptions implements ToJson {
  DidChangeConfigurationRegistrationOptions({required this.section});

  factory DidChangeConfigurationRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final sectionJson = json['section']!;
    final section = (sectionJson as OrRefType);

    return DidChangeConfigurationRegistrationOptions(section: section);
  }

  final OrRefType? section;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['section'] = section;
    return json;
  }
}

/// Struct
/// The parameters of a notification message.
class ShowMessageParams implements ToJson {
  ShowMessageParams({required this.message, required this.type});

  factory ShowMessageParams.fromJson(Map<String, Object?> json) {
    final messageJson = json['message']!;
    final message = (messageJson as String);
    final typeJson = json['type']!;
    // Handle enum type
    final type = _i1.$enumDecode(_$MessageTypeEnumMap, typeJson);

    return ShowMessageParams(message: message, type: type);
  }

  /// The actual message.
  final String message;

  /// The message type. See {@link MessageType}
  final MessageType type;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['message'] = message;
    json['type'] = type.value;
    return json;
  }
}

/// Struct
class ShowMessageRequestParams implements ToJson {
  ShowMessageRequestParams({
    required this.actions,
    required this.message,
    required this.type,
  });

  factory ShowMessageRequestParams.fromJson(Map<String, Object?> json) {
    final actionsJson = json['actions']!;
    final actions = (actionsJson as List<MessageActionItem>);
    final messageJson = json['message']!;
    final message = (messageJson as String);
    final typeJson = json['type']!;
    // Handle enum type
    final type = _i1.$enumDecode(_$MessageTypeEnumMap, typeJson);

    return ShowMessageRequestParams(
      actions: actions,
      message: message,
      type: type,
    );
  }

  /// The message action items to present.
  final List<MessageActionItem>? actions;

  /// The actual message.
  final String message;

  /// The message type. See {@link MessageType}
  final MessageType type;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['actions'] = actions;
    json['message'] = message;
    json['type'] = type.value;
    return json;
  }
}

/// Struct
class MessageActionItem implements ToJson {
  MessageActionItem({required this.title});

  factory MessageActionItem.fromJson(Map<String, Object?> json) {
    final titleJson = json['title']!;
    final title = (titleJson as String);

    return MessageActionItem(title: title);
  }

  /// A short title like 'Retry', 'Open Log' etc.
  final String title;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['title'] = title;
    return json;
  }
}

/// Struct
/// The log message parameters.
class LogMessageParams implements ToJson {
  LogMessageParams({required this.message, required this.type});

  factory LogMessageParams.fromJson(Map<String, Object?> json) {
    final messageJson = json['message']!;
    final message = (messageJson as String);
    final typeJson = json['type']!;
    // Handle enum type
    final type = _i1.$enumDecode(_$MessageTypeEnumMap, typeJson);

    return LogMessageParams(message: message, type: type);
  }

  /// The actual message.
  final String message;

  /// The message type. See {@link MessageType}
  final MessageType type;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['message'] = message;
    json['type'] = type.value;
    return json;
  }
}

/// Struct
/// The parameters sent in an open text document notification
class DidOpenTextDocumentParams implements ToJson {
  DidOpenTextDocumentParams({required this.textDocument});

  factory DidOpenTextDocumentParams.fromJson(Map<String, Object?> json) {
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentItem.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );

    return DidOpenTextDocumentParams(textDocument: textDocument);
  }

  /// The document that was opened.
  final TextDocumentItem textDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['textDocument'] = textDocument.toJson();
    return json;
  }
}

/// Struct
/// The change text document notification's parameters.
class DidChangeTextDocumentParams implements ToJson {
  DidChangeTextDocumentParams({
    required this.contentChanges,
    required this.textDocument,
  });

  factory DidChangeTextDocumentParams.fromJson(Map<String, Object?> json) {
    final contentChangesJson = json['contentChanges']!;
    final contentChanges =
        (contentChangesJson as List<TextDocumentContentChangeEvent>);
    final textDocumentJson = json['textDocument']!;
    final textDocument = VersionedTextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );

    return DidChangeTextDocumentParams(
      contentChanges: contentChanges,
      textDocument: textDocument,
    );
  }

  /// The actual content changes. The content changes describe single state
  /// changes to the document. So if there are two content changes c1 (at
  /// array index 0) and c2 (at array index 1) for a document in state S then
  /// c1 moves the document from S to S' and c2 from S' to S''. So c1 is
  /// computed on the state S and c2 is computed on the state S'.
  /// To mirror the content of a document using change events use the
  /// following approach: - start with the same initial content - apply the
  /// 'textDocument/didChange' notifications in the order you receive them. -
  /// apply the `TextDocumentContentChangeEvent`s in a single notification in
  /// the order you receive them.
  final List<TextDocumentContentChangeEvent> contentChanges;

  /// The document that did change. The version number points to the version
  /// after all provided content changes have been applied.
  final VersionedTextDocumentIdentifier textDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['contentChanges'] = contentChanges;
    json['textDocument'] = textDocument.toJson();
    return json;
  }
}

/// Struct
/// Describe options to be used when registered for text document change events.
class TextDocumentChangeRegistrationOptions
    implements TextDocumentRegistrationOptions {
  TextDocumentChangeRegistrationOptions({
    required this.documentSelector,
    required this.syncKind,
  });

  factory TextDocumentChangeRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final syncKindJson = json['syncKind']!;
    // Handle enum type
    final syncKind = _i1.$enumDecode(
      _$TextDocumentSyncKindEnumMap,
      syncKindJson,
    );

    return TextDocumentChangeRegistrationOptions(
      documentSelector: documentSelector,
      syncKind: syncKind,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// How documents are synced to the server.
  final TextDocumentSyncKind syncKind;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['syncKind'] = syncKind.value;
    return json;
  }
}

/// Struct
/// The parameters sent in a close text document notification
class DidCloseTextDocumentParams implements ToJson {
  DidCloseTextDocumentParams({required this.textDocument});

  factory DidCloseTextDocumentParams.fromJson(Map<String, Object?> json) {
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );

    return DidCloseTextDocumentParams(textDocument: textDocument);
  }

  /// The document that was closed.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['textDocument'] = textDocument.toJson();
    return json;
  }
}

/// Struct
/// The parameters sent in a save text document notification
class DidSaveTextDocumentParams implements ToJson {
  DidSaveTextDocumentParams({required this.text, required this.textDocument});

  factory DidSaveTextDocumentParams.fromJson(Map<String, Object?> json) {
    final textJson = json['text']!;
    final text = (textJson as String);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );

    return DidSaveTextDocumentParams(text: text, textDocument: textDocument);
  }

  /// Optional the content when saved. Depends on the includeText value when
  /// the save notification was requested.
  final String? text;

  /// The document that was saved.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['text'] = text;
    json['textDocument'] = textDocument.toJson();
    return json;
  }
}

/// Struct
/// Save registration options.
class TextDocumentSaveRegistrationOptions
    implements TextDocumentRegistrationOptions, SaveOptions {
  TextDocumentSaveRegistrationOptions({
    required this.documentSelector,
    required this.includeText,
  });

  factory TextDocumentSaveRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final includeTextJson = json['includeText']!;
    final includeText = (includeTextJson as bool);

    return TextDocumentSaveRegistrationOptions(
      documentSelector: documentSelector,
      includeText: includeText,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The client is supposed to include the content on save.
  @override
  final bool? includeText;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['includeText'] = includeText;
    return json;
  }
}

/// Struct
/// The parameters sent in a will save text document notification.
class WillSaveTextDocumentParams implements ToJson {
  WillSaveTextDocumentParams({
    required this.reason,
    required this.textDocument,
  });

  factory WillSaveTextDocumentParams.fromJson(Map<String, Object?> json) {
    final reasonJson = json['reason']!;
    // Handle enum type
    final reason = _i1.$enumDecode(_$TextDocumentSaveReasonEnumMap, reasonJson);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );

    return WillSaveTextDocumentParams(
      reason: reason,
      textDocument: textDocument,
    );
  }

  /// The 'TextDocumentSaveReason'.
  final TextDocumentSaveReason reason;

  /// The document that will be saved.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['reason'] = reason.value;
    json['textDocument'] = textDocument.toJson();
    return json;
  }
}

/// Struct
/// A text edit applicable to a text document.
class TextEdit implements ToJson {
  TextEdit({required this.newText, required this.range});

  factory TextEdit.fromJson(Map<String, Object?> json) {
    final newTextJson = json['newText']!;
    final newText = (newTextJson as String);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));

    return TextEdit(newText: newText, range: range);
  }

  /// The string to be inserted. For delete operations use an empty string.
  final String newText;

  /// The range of the text document to be manipulated. To insert text into a
  /// document create a range where start === end.
  final Range range;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['newText'] = newText;
    json['range'] = range.toJson();
    return json;
  }
}

/// Struct
/// The watched files change notification's parameters.
class DidChangeWatchedFilesParams implements ToJson {
  DidChangeWatchedFilesParams({required this.changes});

  factory DidChangeWatchedFilesParams.fromJson(Map<String, Object?> json) {
    final changesJson = json['changes']!;
    final changes = (changesJson as List<FileEvent>);

    return DidChangeWatchedFilesParams(changes: changes);
  }

  /// The actual file events.
  final List<FileEvent> changes;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['changes'] = changes;
    return json;
  }
}

/// Struct
/// Describe options to be used when registered for text document change events.
class DidChangeWatchedFilesRegistrationOptions implements ToJson {
  DidChangeWatchedFilesRegistrationOptions({required this.watchers});

  factory DidChangeWatchedFilesRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final watchersJson = json['watchers']!;
    final watchers = (watchersJson as List<FileSystemWatcher>);

    return DidChangeWatchedFilesRegistrationOptions(watchers: watchers);
  }

  /// The watchers to register.
  final List<FileSystemWatcher> watchers;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['watchers'] = watchers;
    return json;
  }
}

/// Struct
/// The publish diagnostic notification's parameters.
class PublishDiagnosticsParams implements ToJson {
  PublishDiagnosticsParams({
    required this.diagnostics,
    required this.uri,
    required this.version,
  });

  factory PublishDiagnosticsParams.fromJson(Map<String, Object?> json) {
    final diagnosticsJson = json['diagnostics']!;
    final diagnostics = (diagnosticsJson as List<Diagnostic>);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);
    final versionJson = json['version']!;
    final version = (versionJson as int);

    return PublishDiagnosticsParams(
      diagnostics: diagnostics,
      uri: uri,
      version: version,
    );
  }

  /// An array of diagnostic information items.
  final List<Diagnostic> diagnostics;

  /// The URI for which diagnostic information is reported.
  final Uri uri;

  /// Optional the version number of the document the diagnostics are
  /// published for.
  /// @since 3.15.0
  final int? version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['diagnostics'] = diagnostics;
    json['uri'] = uri;
    json['version'] = version;
    return json;
  }
}

/// Struct
/// Completion parameters
class CompletionParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  CompletionParams({
    required this.context,
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory CompletionParams.fromJson(Map<String, Object?> json) {
    final contextJson = json['context']!;
    final context = CompletionContext.fromJson(
      (contextJson as Map<String, Object?>),
    );
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return CompletionParams(
      context: context,
      partialResultToken: partialResultToken,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The completion context. This is only available if the client specifies
  /// to send this using the client capability
  /// `textDocument.completion.contextSupport === true`
  final CompletionContext? context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['context'] = context?.toJson();
    json['partialResultToken'] = partialResultToken;
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// A completion item represents a text snippet that is proposed to complete
/// text that is being typed.
class CompletionItem implements ToJson {
  CompletionItem({
    required this.additionalTextEdits,
    required this.command,
    required this.commitCharacters,
    required this.data,
    required this.deprecated,
    required this.detail,
    required this.documentation,
    required this.filterText,
    required this.insertText,
    required this.insertTextFormat,
    required this.insertTextMode,
    required this.kind,
    required this.label,
    required this.labelDetails,
    required this.preselect,
    required this.sortText,
    required this.tags,
    required this.textEdit,
    required this.textEditText,
  });

  factory CompletionItem.fromJson(Map<String, Object?> json) {
    final additionalTextEditsJson = json['additionalTextEdits']!;
    final additionalTextEdits = (additionalTextEditsJson as List<TextEdit>);
    final commandJson = json['command']!;
    final command = Command.fromJson((commandJson as Map<String, Object?>));
    final commitCharactersJson = json['commitCharacters']!;
    final commitCharacters = (commitCharactersJson as List<String>);
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);
    final deprecatedJson = json['deprecated']!;
    final deprecated = (deprecatedJson as bool);
    final detailJson = json['detail']!;
    final detail = (detailJson as String);
    final documentationJson = json['documentation']!;
    final documentation = (documentationJson as OrRefType);
    final filterTextJson = json['filterText']!;
    final filterText = (filterTextJson as String);
    final insertTextJson = json['insertText']!;
    final insertText = (insertTextJson as String);
    final insertTextFormatJson = json['insertTextFormat']!;
    // Handle enum type
    final insertTextFormat = _i1.$enumDecode(
      _$InsertTextFormatEnumMap,
      insertTextFormatJson,
    );
    final insertTextModeJson = json['insertTextMode']!;
    // Handle enum type
    final insertTextMode = _i1.$enumDecode(
      _$InsertTextModeEnumMap,
      insertTextModeJson,
    );
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$CompletionItemKindEnumMap, kindJson);
    final labelJson = json['label']!;
    final label = (labelJson as String);
    final labelDetailsJson = json['labelDetails']!;
    final labelDetails = CompletionItemLabelDetails.fromJson(
      (labelDetailsJson as Map<String, Object?>),
    );
    final preselectJson = json['preselect']!;
    final preselect = (preselectJson as bool);
    final sortTextJson = json['sortText']!;
    final sortText = (sortTextJson as String);
    final tagsJson = json['tags']!;
    final tags = (tagsJson as List<CompletionItemTag>);
    final textEditJson = json['textEdit']!;
    final textEdit = (textEditJson as OrRefType);
    final textEditTextJson = json['textEditText']!;
    final textEditText = (textEditTextJson as String);

    return CompletionItem(
      additionalTextEdits: additionalTextEdits,
      command: command,
      commitCharacters: commitCharacters,
      data: data,
      deprecated: deprecated,
      detail: detail,
      documentation: documentation,
      filterText: filterText,
      insertText: insertText,
      insertTextFormat: insertTextFormat,
      insertTextMode: insertTextMode,
      kind: kind,
      label: label,
      labelDetails: labelDetails,
      preselect: preselect,
      sortText: sortText,
      tags: tags,
      textEdit: textEdit,
      textEditText: textEditText,
    );
  }

  /// An optional array of additional {@link TextEdit text edits} that are
  /// applied when selecting this completion. Edits must not overlap
  /// (including the same insert position) with the main {@link
  /// CompletionItem.textEdit edit} nor with themselves.
  /// Additional text edits should be used to change text unrelated to the
  /// current cursor position (for example adding an import statement at the
  /// top of the file if the completion item will insert an unqualified
  /// type).
  final List<TextEdit>? additionalTextEdits;

  /// An optional {@link Command command} that is executed *after* inserting
  /// this completion. *Note* that additional modifications to the current
  /// document should be described with the {@link
  /// CompletionItem.additionalTextEdits additionalTextEdits}-property.
  final Command? command;

  /// An optional set of characters that when pressed while this completion
  /// is active will accept it first and then type that character. *Note*
  /// that all commit characters should have `length=1` and that superfluous
  /// characters will be ignored.
  final List<String>? commitCharacters;

  /// A data entry field that is preserved on a completion item between a
  /// {@link CompletionRequest} and a {@link CompletionResolveRequest}.
  final LSPAny? data;

  /// Indicates if this item is deprecated. @deprecated Use `tags` instead.
  final bool? deprecated;

  /// A human-readable string with additional information about this item,
  /// like type or symbol information.
  final String? detail;

  /// A human-readable string that represents a doc-comment.
  final OrRefType? documentation;

  /// A string that should be used when filtering a set of completion items.
  /// When `falsy` the {@link CompletionItem.label label} is used.
  final String? filterText;

  /// A string that should be inserted into a document when selecting this
  /// completion. When `falsy` the {@link CompletionItem.label label} is
  /// used.
  /// The `insertText` is subject to interpretation by the client side. Some
  /// tools might not take the string literally. For example VS Code when
  /// code complete is requested in this example `con<cursor position>` and a
  /// completion item with an `insertText` of `console` is provided it will
  /// only insert `sole`. Therefore it is recommended to use `textEdit`
  /// instead since it avoids additional client side interpretation.
  final String? insertText;

  /// The format of the insert text. The format applies to both the
  /// `insertText` property and the `newText` property of a provided
  /// `textEdit`. If omitted defaults to `InsertTextFormat.PlainText`.
  /// Please note that the insertTextFormat doesn't apply to
  /// `additionalTextEdits`.
  final InsertTextFormat? insertTextFormat;

  /// How whitespace and indentation is handled during completion item
  /// insertion. If not provided the clients default value depends on the
  /// `textDocument.completion.insertTextMode` client capability.
  /// @since 3.16.0
  final InsertTextMode? insertTextMode;

  /// The kind of this completion item. Based of the kind an icon is chosen
  /// by the editor.
  final CompletionItemKind? kind;

  /// The label of this completion item.
  /// The label property is also by default the text that is inserted when
  /// selecting this completion.
  /// If label details are provided the label itself should be an unqualified
  /// name of the completion item.
  final String label;

  /// Additional details for the label
  /// @since 3.17.0
  final CompletionItemLabelDetails? labelDetails;

  /// Select this item when showing.
  /// *Note* that only one completion item can be selected and that the tool
  /// / client decides which item that is. The rule is that the *first* item
  /// of those that match best is selected.
  final bool? preselect;

  /// A string that should be used when comparing this item with other items.
  /// When `falsy` the {@link CompletionItem.label label} is used.
  final String? sortText;

  /// Tags for this completion item.
  /// @since 3.15.0
  final List<CompletionItemTag>? tags;

  /// An {@link TextEdit edit} which is applied to a document when selecting
  /// this completion. When an edit is provided the value of {@link
  /// CompletionItem.insertText insertText} is ignored.
  /// Most editors support two different operations when accepting a
  /// completion item. One is to insert a completion text and the other is to
  /// replace an existing text with a completion text. Since this can usually
  /// not be predetermined by a server it can report both ranges. Clients
  /// need to signal support for `InsertReplaceEdits` via the
  /// `textDocument.completion.insertReplaceSupport` client capability
  /// property.
  /// *Note 1:* The text edit's range as well as both ranges from an insert
  /// replace edit must be a [single line] and they must contain the position
  /// at which completion has been requested. *Note 2:* If an
  /// `InsertReplaceEdit` is returned the edit's insert range must be a
  /// prefix of the edit's replace range, that means it must be contained and
  /// starting at the same position.
  /// @since 3.16.0 additional type `InsertReplaceEdit`
  final OrRefType? textEdit;

  /// The edit text used if the completion item is part of a CompletionList
  /// and CompletionList defines an item default for the text edit range.
  /// Clients will only honor this property if they opt into completion list
  /// item defaults using the capability `completionList.itemDefaults`.
  /// If not provided and a list's default range is provided the label
  /// property is used as a text.
  /// @since 3.17.0
  final String? textEditText;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['additionalTextEdits'] = additionalTextEdits;
    json['command'] = command?.toJson();
    json['commitCharacters'] = commitCharacters;
    json['data'] = data;
    json['deprecated'] = deprecated;
    json['detail'] = detail;
    json['documentation'] = documentation;
    json['filterText'] = filterText;
    json['insertText'] = insertText;
    json['insertTextFormat'] = insertTextFormat?.value;
    json['insertTextMode'] = insertTextMode?.value;
    json['kind'] = kind?.value;
    json['label'] = label;
    json['labelDetails'] = labelDetails?.toJson();
    json['preselect'] = preselect;
    json['sortText'] = sortText;
    json['tags'] = tags;
    json['textEdit'] = textEdit;
    json['textEditText'] = textEditText;
    return json;
  }
}

/// Struct
/// Represents a collection of {@link CompletionItem completion items} to be
/// presented in the editor.
class CompletionList implements ToJson {
  CompletionList({
    required this.isIncomplete,
    required this.itemDefaults,
    required this.items,
  });

  factory CompletionList.fromJson(Map<String, Object?> json) {
    final isIncompleteJson = json['isIncomplete']!;
    final isIncomplete = (isIncompleteJson as bool);
    final itemDefaultsJson = json['itemDefaults']!;
    final itemDefaults = (itemDefaultsJson as CompletionListItemDefaults);
    final itemsJson = json['items']!;
    final items = (itemsJson as List<CompletionItem>);

    return CompletionList(
      isIncomplete: isIncomplete,
      itemDefaults: itemDefaults,
      items: items,
    );
  }

  /// This list it not complete. Further typing results in recomputing this
  /// list.
  /// Recomputed lists have all their items replaced (not appended) in the
  /// incomplete completion sessions.
  final bool isIncomplete;

  /// In many cases the items of an actual completion result share the same
  /// value for properties like `commitCharacters` or the range of a text
  /// edit. A completion list can therefore define item defaults which will
  /// be used if a completion item itself doesn't specify the value.
  /// If a completion list specifies a default value and a completion item
  /// also specifies a corresponding value the one from the item is used.
  /// Servers are only allowed to return default values if the client signals
  /// support for this via the `completionList.itemDefaults` capability.
  /// @since 3.17.0
  final CompletionListItemDefaults? itemDefaults;

  /// The completion items.
  final List<CompletionItem> items;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['isIncomplete'] = isIncomplete;
    json['itemDefaults'] = itemDefaults;
    json['items'] = items;
    return json;
  }
}

/// Struct
/// Registration options for a {@link CompletionRequest}.
class CompletionRegistrationOptions
    implements TextDocumentRegistrationOptions, CompletionOptions {
  CompletionRegistrationOptions({
    required this.allCommitCharacters,
    required this.completionItem,
    required this.documentSelector,
    required this.resolveProvider,
    required this.triggerCharacters,
    required this.workDoneProgress,
  });

  factory CompletionRegistrationOptions.fromJson(Map<String, Object?> json) {
    final allCommitCharactersJson = json['allCommitCharacters']!;
    final allCommitCharacters = (allCommitCharactersJson as List<String>);
    final completionItemJson = json['completionItem']!;
    final completionItem =
        (completionItemJson as CompletionOptionsCompletionItem);
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final triggerCharactersJson = json['triggerCharacters']!;
    final triggerCharacters = (triggerCharactersJson as List<String>);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return CompletionRegistrationOptions(
      allCommitCharacters: allCommitCharacters,
      completionItem: completionItem,
      documentSelector: documentSelector,
      resolveProvider: resolveProvider,
      triggerCharacters: triggerCharacters,
      workDoneProgress: workDoneProgress,
    );
  }

  /// The list of all possible characters that commit a completion. This
  /// field can be used if clients don't support individual commit characters
  /// per completion item. See
  /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
  /// If a server provides both `allCommitCharacters` and commit characters
  /// on an individual completion item the ones on the completion item win.
  /// @since 3.2.0
  @override
  final List<String>? allCommitCharacters;

  /// The server supports the following `CompletionItem` specific
  /// capabilities.
  /// @since 3.17.0
  @override
  final CompletionOptionsCompletionItem? completionItem;

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The server provides support to resolve additional information for a
  /// completion item.
  @override
  final bool? resolveProvider;

  /// Most tools trigger completion request automatically without explicitly
  /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically
  /// they do so when the user starts to type an identifier. For example if
  /// the user types `c` in a JavaScript file code complete will
  /// automatically pop up present `console` besides others as a completion
  /// item. Characters that make up identifiers don't need to be listed here.
  /// If code complete should automatically be trigger on characters not
  /// being valid inside an identifier (for example `.` in JavaScript) list
  /// them in `triggerCharacters`.
  @override
  final List<String>? triggerCharacters;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['allCommitCharacters'] = allCommitCharacters;
    json['completionItem'] = completionItem;
    json['documentSelector'] = documentSelector;
    json['resolveProvider'] = resolveProvider;
    json['triggerCharacters'] = triggerCharacters;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Parameters for a {@link HoverRequest}.
class HoverParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  HoverParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory HoverParams.fromJson(Map<String, Object?> json) {
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return HoverParams(
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// The result of a hover request.
class Hover implements ToJson {
  Hover({required this.contents, required this.range});

  factory Hover.fromJson(Map<String, Object?> json) {
    final contentsJson = json['contents']!;
    final contents = (contentsJson as OrRefType);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));

    return Hover(contents: contents, range: range);
  }

  /// The hover's content
  final OrRefType contents;

  /// An optional range inside the text document that is used to visualize
  /// the hover, e.g. by changing the background color.
  final Range? range;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['contents'] = contents;
    json['range'] = range?.toJson();
    return json;
  }
}

/// Struct
/// Registration options for a {@link HoverRequest}.
class HoverRegistrationOptions
    implements TextDocumentRegistrationOptions, HoverOptions {
  HoverRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  factory HoverRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return HoverRegistrationOptions(
      documentSelector: documentSelector,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Parameters for a {@link SignatureHelpRequest}.
class SignatureHelpParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  SignatureHelpParams({
    required this.context,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory SignatureHelpParams.fromJson(Map<String, Object?> json) {
    final contextJson = json['context']!;
    final context = SignatureHelpContext.fromJson(
      (contextJson as Map<String, Object?>),
    );
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return SignatureHelpParams(
      context: context,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The signature help context. This is only available if the client
  /// specifies to send this using the client capability
  /// `textDocument.signatureHelp.contextSupport === true`
  /// @since 3.15.0
  final SignatureHelpContext? context;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['context'] = context?.toJson();
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Signature help represents the signature of something callable. There can be
/// multiple signature but only one active and only one active parameter.
class SignatureHelp implements ToJson {
  SignatureHelp({
    required this.activeParameter,
    required this.activeSignature,
    required this.signatures,
  });

  factory SignatureHelp.fromJson(Map<String, Object?> json) {
    final activeParameterJson = json['activeParameter']!;
    final activeParameter = (activeParameterJson as int);
    final activeSignatureJson = json['activeSignature']!;
    final activeSignature = (activeSignatureJson as int);
    final signaturesJson = json['signatures']!;
    final signatures = (signaturesJson as List<SignatureInformation>);

    return SignatureHelp(
      activeParameter: activeParameter,
      activeSignature: activeSignature,
      signatures: signatures,
    );
  }

  /// The active parameter of the active signature. If omitted or the value
  /// lies outside the range of `signatures[activeSignature].parameters`
  /// defaults to 0 if the active signature has parameters. If the active
  /// signature has no parameters it is ignored. In future version of the
  /// protocol this property might become mandatory to better express the
  /// active parameter if the active signature does have any.
  final int? activeParameter;

  /// The active signature. If omitted or the value lies outside the range of
  /// `signatures` the value defaults to zero or is ignored if the
  /// `SignatureHelp` has no signatures.
  /// Whenever possible implementors should make an active decision about the
  /// active signature and shouldn't rely on a default value.
  /// In future version of the protocol this property might become mandatory
  /// to better express this.
  final int? activeSignature;

  /// One or more signatures.
  final List<SignatureInformation> signatures;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['activeParameter'] = activeParameter;
    json['activeSignature'] = activeSignature;
    json['signatures'] = signatures;
    return json;
  }
}

/// Struct
/// Registration options for a {@link SignatureHelpRequest}.
class SignatureHelpRegistrationOptions
    implements TextDocumentRegistrationOptions, SignatureHelpOptions {
  SignatureHelpRegistrationOptions({
    required this.documentSelector,
    required this.retriggerCharacters,
    required this.triggerCharacters,
    required this.workDoneProgress,
  });

  factory SignatureHelpRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final retriggerCharactersJson = json['retriggerCharacters']!;
    final retriggerCharacters = (retriggerCharactersJson as List<String>);
    final triggerCharactersJson = json['triggerCharacters']!;
    final triggerCharacters = (triggerCharactersJson as List<String>);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return SignatureHelpRegistrationOptions(
      documentSelector: documentSelector,
      retriggerCharacters: retriggerCharacters,
      triggerCharacters: triggerCharacters,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// List of characters that re-trigger signature help.
  /// These trigger characters are only active when signature help is already
  /// showing. All trigger characters are also counted as re-trigger
  /// characters.
  /// @since 3.15.0
  @override
  final List<String>? retriggerCharacters;

  /// List of characters that trigger signature help automatically.
  @override
  final List<String>? triggerCharacters;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['retriggerCharacters'] = retriggerCharacters;
    json['triggerCharacters'] = triggerCharacters;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Parameters for a {@link DefinitionRequest}.
class DefinitionParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  DefinitionParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DefinitionParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DefinitionParams(
      partialResultToken: partialResultToken,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Registration options for a {@link DefinitionRequest}.
class DefinitionRegistrationOptions
    implements TextDocumentRegistrationOptions, DefinitionOptions {
  DefinitionRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  factory DefinitionRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DefinitionRegistrationOptions(
      documentSelector: documentSelector,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Parameters for a {@link ReferencesRequest}.
class ReferenceParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  ReferenceParams({
    required this.context,
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory ReferenceParams.fromJson(Map<String, Object?> json) {
    final contextJson = json['context']!;
    final context = ReferenceContext.fromJson(
      (contextJson as Map<String, Object?>),
    );
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return ReferenceParams(
      context: context,
      partialResultToken: partialResultToken,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  final ReferenceContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['context'] = context.toJson();
    json['partialResultToken'] = partialResultToken;
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Registration options for a {@link ReferencesRequest}.
class ReferenceRegistrationOptions
    implements TextDocumentRegistrationOptions, ReferenceOptions {
  ReferenceRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  factory ReferenceRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return ReferenceRegistrationOptions(
      documentSelector: documentSelector,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Parameters for a {@link DocumentHighlightRequest}.
class DocumentHighlightParams
    implements
        TextDocumentPositionParams,
        WorkDoneProgressParams,
        PartialResultParams {
  DocumentHighlightParams({
    required this.partialResultToken,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DocumentHighlightParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DocumentHighlightParams(
      partialResultToken: partialResultToken,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// A document highlight is a range inside a text document which deserves
/// special attention. Usually a document highlight is visualized by changing
/// the background color of its range.
class DocumentHighlight implements ToJson {
  DocumentHighlight({required this.kind, required this.range});

  factory DocumentHighlight.fromJson(Map<String, Object?> json) {
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$DocumentHighlightKindEnumMap, kindJson);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));

    return DocumentHighlight(kind: kind, range: range);
  }

  /// The highlight kind, default is {@link DocumentHighlightKind.Text text}.
  final DocumentHighlightKind? kind;

  /// The range this highlight applies to.
  final Range range;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['kind'] = kind?.value;
    json['range'] = range.toJson();
    return json;
  }
}

/// Struct
/// Registration options for a {@link DocumentHighlightRequest}.
class DocumentHighlightRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentHighlightOptions {
  DocumentHighlightRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  factory DocumentHighlightRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentHighlightRegistrationOptions(
      documentSelector: documentSelector,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Parameters for a {@link DocumentSymbolRequest}.
class DocumentSymbolParams
    implements WorkDoneProgressParams, PartialResultParams {
  DocumentSymbolParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DocumentSymbolParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DocumentSymbolParams(
      partialResultToken: partialResultToken,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Represents information about programming constructs like variables,
/// classes, interfaces etc.
class SymbolInformation implements BaseSymbolInformation {
  SymbolInformation({
    required this.containerName,
    required this.deprecated,
    required this.kind,
    required this.location,
    required this.name,
    required this.tags,
  });

  factory SymbolInformation.fromJson(Map<String, Object?> json) {
    final containerNameJson = json['containerName']!;
    final containerName = (containerNameJson as String);
    final deprecatedJson = json['deprecated']!;
    final deprecated = (deprecatedJson as bool);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$SymbolKindEnumMap, kindJson);
    final locationJson = json['location']!;
    final location = Location.fromJson((locationJson as Map<String, Object?>));
    final nameJson = json['name']!;
    final name = (nameJson as String);
    final tagsJson = json['tags']!;
    final tags = (tagsJson as List<SymbolTag>);

    return SymbolInformation(
      containerName: containerName,
      deprecated: deprecated,
      kind: kind,
      location: location,
      name: name,
      tags: tags,
    );
  }

  /// The name of the symbol containing this symbol. This information is for
  /// user interface purposes (e.g. to render a qualifier in the user
  /// interface if necessary). It can't be used to re-infer a hierarchy for
  /// the document symbols.
  @override
  final String? containerName;

  /// Indicates if this symbol is deprecated.
  /// @deprecated Use tags instead
  final bool? deprecated;

  /// The kind of this symbol.
  @override
  final SymbolKind kind;

  /// The location of this symbol. The location's range is used by a tool to
  /// reveal the location in the editor. If the symbol is selected in the
  /// tool the range's start information is used to position the cursor. So
  /// the range usually spans more than the actual symbol's name and does
  /// normally include things like visibility modifiers.
  /// The range doesn't have to denote a node range in the sense of an
  /// abstract syntax tree. It can therefore not be used to re-construct a
  /// hierarchy of the symbols.
  final Location location;

  /// The name of this symbol.
  @override
  final String name;

  /// Tags for this symbol.
  /// @since 3.16.0
  @override
  final List<SymbolTag>? tags;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['containerName'] = containerName;
    json['deprecated'] = deprecated;
    json['kind'] = kind.value;
    json['location'] = location.toJson();
    json['name'] = name;
    json['tags'] = tags;
    return json;
  }
}

/// Struct
/// Represents programming constructs like variables, classes, interfaces etc.
/// that appear in a document. Document symbols can be hierarchical and they
/// have two ranges: one that encloses its definition and one that points to
/// its most interesting range, e.g. the range of an identifier.
class DocumentSymbol implements ToJson {
  DocumentSymbol({
    required this.children,
    required this.deprecated,
    required this.detail,
    required this.kind,
    required this.name,
    required this.range,
    required this.selectionRange,
    required this.tags,
  });

  factory DocumentSymbol.fromJson(Map<String, Object?> json) {
    final childrenJson = json['children']!;
    final children = (childrenJson as List<DocumentSymbol>);
    final deprecatedJson = json['deprecated']!;
    final deprecated = (deprecatedJson as bool);
    final detailJson = json['detail']!;
    final detail = (detailJson as String);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$SymbolKindEnumMap, kindJson);
    final nameJson = json['name']!;
    final name = (nameJson as String);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final selectionRangeJson = json['selectionRange']!;
    final selectionRange = Range.fromJson(
      (selectionRangeJson as Map<String, Object?>),
    );
    final tagsJson = json['tags']!;
    final tags = (tagsJson as List<SymbolTag>);

    return DocumentSymbol(
      children: children,
      deprecated: deprecated,
      detail: detail,
      kind: kind,
      name: name,
      range: range,
      selectionRange: selectionRange,
      tags: tags,
    );
  }

  /// Children of this symbol, e.g. properties of a class.
  final List<DocumentSymbol>? children;

  /// Indicates if this symbol is deprecated.
  /// @deprecated Use tags instead
  final bool? deprecated;

  /// More detail for this symbol, e.g the signature of a function.
  final String? detail;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The name of this symbol. Will be displayed in the user interface and
  /// therefore must not be an empty string or a string only consisting of
  /// white spaces.
  final String name;

  /// The range enclosing this symbol not including leading/trailing
  /// whitespace but everything else like comments. This information is
  /// typically used to determine if the clients cursor is inside the symbol
  /// to reveal in the symbol in the UI.
  final Range range;

  /// The range that should be selected and revealed when this symbol is
  /// being picked, e.g the name of a function. Must be contained by the
  /// `range`.
  final Range selectionRange;

  /// Tags for this document symbol.
  /// @since 3.16.0
  final List<SymbolTag>? tags;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['children'] = children;
    json['deprecated'] = deprecated;
    json['detail'] = detail;
    json['kind'] = kind.value;
    json['name'] = name;
    json['range'] = range.toJson();
    json['selectionRange'] = selectionRange.toJson();
    json['tags'] = tags;
    return json;
  }
}

/// Struct
/// Registration options for a {@link DocumentSymbolRequest}.
class DocumentSymbolRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentSymbolOptions {
  DocumentSymbolRegistrationOptions({
    required this.documentSelector,
    required this.label,
    required this.workDoneProgress,
  });

  factory DocumentSymbolRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final labelJson = json['label']!;
    final label = (labelJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentSymbolRegistrationOptions(
      documentSelector: documentSelector,
      label: label,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// A human-readable string that is shown when multiple outlines trees are
  /// shown for the same document.
  /// @since 3.16.0
  @override
  final String? label;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['label'] = label;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameters of a {@link CodeActionRequest}.
class CodeActionParams implements WorkDoneProgressParams, PartialResultParams {
  CodeActionParams({
    required this.context,
    required this.partialResultToken,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory CodeActionParams.fromJson(Map<String, Object?> json) {
    final contextJson = json['context']!;
    final context = CodeActionContext.fromJson(
      (contextJson as Map<String, Object?>),
    );
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return CodeActionParams(
      context: context,
      partialResultToken: partialResultToken,
      range: range,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// Context carrying additional information.
  final CodeActionContext context;

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The range for which the command was invoked.
  final Range range;

  /// The document in which the command was invoked.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['context'] = context.toJson();
    json['partialResultToken'] = partialResultToken;
    json['range'] = range.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Represents a reference to a command. Provides a title which will be used to
/// represent a command in the UI and, optionally, an array of arguments which
/// will be passed to the command handler function when invoked.
class Command implements ToJson {
  Command({
    required this.arguments,
    required this.command,
    required this.title,
  });

  factory Command.fromJson(Map<String, Object?> json) {
    final argumentsJson = json['arguments']!;
    final arguments = (argumentsJson as List<LSPAny>);
    final commandJson = json['command']!;
    final command = (commandJson as String);
    final titleJson = json['title']!;
    final title = (titleJson as String);

    return Command(arguments: arguments, command: command, title: title);
  }

  /// Arguments that the command handler should be invoked with.
  final List<LSPAny>? arguments;

  /// The identifier of the actual command handler.
  final String command;

  /// Title of the command, like `save`.
  final String title;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['arguments'] = arguments;
    json['command'] = command;
    json['title'] = title;
    return json;
  }
}

/// Struct
/// A code action represents a change that can be performed in code, e.g. to
/// fix a problem or to refactor code.
/// A CodeAction must set either `edit` and/or a `command`. If both are
/// supplied, the `edit` is applied first, then the `command` is executed.
class CodeAction implements ToJson {
  CodeAction({
    required this.command,
    required this.data,
    required this.diagnostics,
    required this.disabled,
    required this.edit,
    required this.isPreferred,
    required this.kind,
    required this.title,
  });

  factory CodeAction.fromJson(Map<String, Object?> json) {
    final commandJson = json['command']!;
    final command = Command.fromJson((commandJson as Map<String, Object?>));
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);
    final diagnosticsJson = json['diagnostics']!;
    final diagnostics = (diagnosticsJson as List<Diagnostic>);
    final disabledJson = json['disabled']!;
    final disabled = (disabledJson as CodeActionDisabled);
    final editJson = json['edit']!;
    final edit = WorkspaceEdit.fromJson((editJson as Map<String, Object?>));
    final isPreferredJson = json['isPreferred']!;
    final isPreferred = (isPreferredJson as bool);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$CodeActionKindEnumMap, kindJson);
    final titleJson = json['title']!;
    final title = (titleJson as String);

    return CodeAction(
      command: command,
      data: data,
      diagnostics: diagnostics,
      disabled: disabled,
      edit: edit,
      isPreferred: isPreferred,
      kind: kind,
      title: title,
    );
  }

  /// A command this code action executes. If a code action provides an edit
  /// and a command, first the edit is executed and then the command.
  final Command? command;

  /// A data entry field that is preserved on a code action between a
  /// `textDocument/codeAction` and a `codeAction/resolve` request.
  /// @since 3.16.0
  final LSPAny? data;

  /// The diagnostics that this code action resolves.
  final List<Diagnostic>? diagnostics;

  /// Marks that the code action cannot currently be applied.
  /// Clients should follow the following guidelines regarding disabled code
  /// actions:
  /// - Disabled code actions are not shown in automatic
  /// [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
  /// code action menus.
  /// - Disabled actions are shown as faded out in the code action menu when
  /// the user requests a more specific type of code action, such as
  /// refactorings.
  /// - If the user has a
  /// [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
  /// that auto applies a code action and only disabled code actions are
  /// returned, the client should show the user an error message with
  /// `reason` in the editor.
  /// @since 3.16.0
  final CodeActionDisabled? disabled;

  /// The workspace edit this code action performs.
  final WorkspaceEdit? edit;

  /// Marks this as a preferred action. Preferred actions are used by the
  /// `auto fix` command and can be targeted by keybindings.
  /// A quick fix should be marked preferred if it properly addresses the
  /// underlying error. A refactoring should be marked preferred if it is the
  /// most reasonable choice of actions to take.
  /// @since 3.15.0
  final bool? isPreferred;

  /// The kind of the code action.
  /// Used to filter code actions.
  final CodeActionKind? kind;

  /// A short, human-readable, title for this code action.
  final String title;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['command'] = command?.toJson();
    json['data'] = data;
    json['diagnostics'] = diagnostics;
    json['disabled'] = disabled;
    json['edit'] = edit?.toJson();
    json['isPreferred'] = isPreferred;
    json['kind'] = kind?.value;
    json['title'] = title;
    return json;
  }
}

/// Struct
/// Registration options for a {@link CodeActionRequest}.
class CodeActionRegistrationOptions
    implements TextDocumentRegistrationOptions, CodeActionOptions {
  CodeActionRegistrationOptions({
    required this.codeActionKinds,
    required this.documentSelector,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory CodeActionRegistrationOptions.fromJson(Map<String, Object?> json) {
    final codeActionKindsJson = json['codeActionKinds']!;
    final codeActionKinds = (codeActionKindsJson as List<CodeActionKind>);
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return CodeActionRegistrationOptions(
      codeActionKinds: codeActionKinds,
      documentSelector: documentSelector,
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// CodeActionKinds that this server may return.
  /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
  /// the server may list out every specific kind they provide.
  @override
  final List<CodeActionKind>? codeActionKinds;

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// The server provides support to resolve additional information for a
  /// code action.
  /// @since 3.16.0
  @override
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['codeActionKinds'] = codeActionKinds;
    json['documentSelector'] = documentSelector;
    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameters of a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolParams
    implements WorkDoneProgressParams, PartialResultParams {
  WorkspaceSymbolParams({
    required this.partialResultToken,
    required this.query,
    required this.workDoneToken,
  });

  factory WorkspaceSymbolParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final queryJson = json['query']!;
    final query = (queryJson as String);
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return WorkspaceSymbolParams(
      partialResultToken: partialResultToken,
      query: query,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// A query string to filter symbols by. Clients may send an empty string
  /// here to request all symbols.
  final String query;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['query'] = query;
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// A special workspace symbol that supports locations without a range.
/// See also SymbolInformation.
/// @since 3.17.0
class WorkspaceSymbol implements BaseSymbolInformation {
  WorkspaceSymbol({
    required this.containerName,
    required this.data,
    required this.kind,
    required this.location,
    required this.name,
    required this.tags,
  });

  factory WorkspaceSymbol.fromJson(Map<String, Object?> json) {
    final containerNameJson = json['containerName']!;
    final containerName = (containerNameJson as String);
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$SymbolKindEnumMap, kindJson);
    final locationJson = json['location']!;
    final location = (locationJson as OrRefType);
    final nameJson = json['name']!;
    final name = (nameJson as String);
    final tagsJson = json['tags']!;
    final tags = (tagsJson as List<SymbolTag>);

    return WorkspaceSymbol(
      containerName: containerName,
      data: data,
      kind: kind,
      location: location,
      name: name,
      tags: tags,
    );
  }

  /// The name of the symbol containing this symbol. This information is for
  /// user interface purposes (e.g. to render a qualifier in the user
  /// interface if necessary). It can't be used to re-infer a hierarchy for
  /// the document symbols.
  @override
  final String? containerName;

  /// A data entry field that is preserved on a workspace symbol between a
  /// workspace symbol request and a workspace symbol resolve request.
  final LSPAny? data;

  /// The kind of this symbol.
  @override
  final SymbolKind kind;

  /// The location of the symbol. Whether a server is allowed to return a
  /// location without a range depends on the client capability
  /// `workspace.symbol.resolveSupport`.
  /// See SymbolInformation#location for more details.
  final OrRefType location;

  /// The name of this symbol.
  @override
  final String name;

  /// Tags for this symbol.
  /// @since 3.16.0
  @override
  final List<SymbolTag>? tags;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['containerName'] = containerName;
    json['data'] = data;
    json['kind'] = kind.value;
    json['location'] = location;
    json['name'] = name;
    json['tags'] = tags;
    return json;
  }
}

/// Struct
/// Registration options for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolRegistrationOptions implements WorkspaceSymbolOptions {
  WorkspaceSymbolRegistrationOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory WorkspaceSymbolRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return WorkspaceSymbolRegistrationOptions(
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// The server provides support to resolve additional information for a
  /// workspace symbol.
  /// @since 3.17.0
  @override
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameters of a {@link CodeLensRequest}.
class CodeLensParams implements WorkDoneProgressParams, PartialResultParams {
  CodeLensParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory CodeLensParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return CodeLensParams(
      partialResultToken: partialResultToken,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The document to request code lens for.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// A code lens represents a {@link Command command} that should be shown along
/// with source text, like the number of references, a way to run tests, etc.
/// A code lens is _unresolved_ when no command is associated to it. For
/// performance reasons the creation of a code lens and resolving should be
/// done in two stages.
class CodeLens implements ToJson {
  CodeLens({required this.command, required this.data, required this.range});

  factory CodeLens.fromJson(Map<String, Object?> json) {
    final commandJson = json['command']!;
    final command = Command.fromJson((commandJson as Map<String, Object?>));
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));

    return CodeLens(command: command, data: data, range: range);
  }

  /// The command this code lens represents.
  final Command? command;

  /// A data entry field that is preserved on a code lens item between a
  /// {@link CodeLensRequest} and a {@link CodeLensResolveRequest}
  final LSPAny? data;

  /// The range in which this code lens is valid. Should only span a single
  /// line.
  final Range range;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['command'] = command?.toJson();
    json['data'] = data;
    json['range'] = range.toJson();
    return json;
  }
}

/// Struct
/// Registration options for a {@link CodeLensRequest}.
class CodeLensRegistrationOptions
    implements TextDocumentRegistrationOptions, CodeLensOptions {
  CodeLensRegistrationOptions({
    required this.documentSelector,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory CodeLensRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return CodeLensRegistrationOptions(
      documentSelector: documentSelector,
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// Code lens has a resolve provider as well.
  @override
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameters of a {@link DocumentLinkRequest}.
class DocumentLinkParams
    implements WorkDoneProgressParams, PartialResultParams {
  DocumentLinkParams({
    required this.partialResultToken,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DocumentLinkParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DocumentLinkParams(
      partialResultToken: partialResultToken,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  @override
  final ProgressToken? partialResultToken;

  /// The document to provide document links for.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// A document link is a range in a text document that links to an internal or
/// external resource, like another text document or a web site.
class DocumentLink implements ToJson {
  DocumentLink({
    required this.data,
    required this.range,
    required this.target,
    required this.tooltip,
  });

  factory DocumentLink.fromJson(Map<String, Object?> json) {
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final targetJson = json['target']!;
    final target = (targetJson as Uri);
    final tooltipJson = json['tooltip']!;
    final tooltip = (tooltipJson as String);

    return DocumentLink(
      data: data,
      range: range,
      target: target,
      tooltip: tooltip,
    );
  }

  /// A data entry field that is preserved on a document link between a
  /// DocumentLinkRequest and a DocumentLinkResolveRequest.
  final LSPAny? data;

  /// The range this link applies to.
  final Range range;

  /// The uri this link points to. If missing a resolve request is sent later.
  final Uri? target;

  /// The tooltip text when you hover over this link.
  /// If a tooltip is provided, is will be displayed in a string that
  /// includes instructions on how to trigger the link, such as `{0} (ctrl +
  /// click)`. The specific instructions vary depending on OS, user settings,
  /// and localization.
  /// @since 3.15.0
  final String? tooltip;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['data'] = data;
    json['range'] = range.toJson();
    json['target'] = target;
    json['tooltip'] = tooltip;
    return json;
  }
}

/// Struct
/// Registration options for a {@link DocumentLinkRequest}.
class DocumentLinkRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentLinkOptions {
  DocumentLinkRegistrationOptions({
    required this.documentSelector,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory DocumentLinkRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentLinkRegistrationOptions(
      documentSelector: documentSelector,
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// Document links have a resolve provider as well.
  @override
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameters of a {@link DocumentFormattingRequest}.
class DocumentFormattingParams implements WorkDoneProgressParams {
  DocumentFormattingParams({
    required this.options,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DocumentFormattingParams.fromJson(Map<String, Object?> json) {
    final optionsJson = json['options']!;
    final options = FormattingOptions.fromJson(
      (optionsJson as Map<String, Object?>),
    );
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DocumentFormattingParams(
      options: options,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The format options.
  final FormattingOptions options;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['options'] = options.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Registration options for a {@link DocumentFormattingRequest}.
class DocumentFormattingRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentFormattingOptions {
  DocumentFormattingRegistrationOptions({
    required this.documentSelector,
    required this.workDoneProgress,
  });

  factory DocumentFormattingRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentFormattingRegistrationOptions(
      documentSelector: documentSelector,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameters of a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingParams implements WorkDoneProgressParams {
  DocumentRangeFormattingParams({
    required this.options,
    required this.range,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DocumentRangeFormattingParams.fromJson(Map<String, Object?> json) {
    final optionsJson = json['options']!;
    final options = FormattingOptions.fromJson(
      (optionsJson as Map<String, Object?>),
    );
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DocumentRangeFormattingParams(
      options: options,
      range: range,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The format options
  final FormattingOptions options;

  /// The range to format
  final Range range;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['options'] = options.toJson();
    json['range'] = range.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Registration options for a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingRegistrationOptions
    implements TextDocumentRegistrationOptions, DocumentRangeFormattingOptions {
  DocumentRangeFormattingRegistrationOptions({
    required this.documentSelector,
    required this.rangesSupport,
    required this.workDoneProgress,
  });

  factory DocumentRangeFormattingRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final rangesSupportJson = json['rangesSupport']!;
    final rangesSupport = (rangesSupportJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentRangeFormattingRegistrationOptions(
      documentSelector: documentSelector,
      rangesSupport: rangesSupport,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// Whether the server supports formatting multiple ranges at once.
  /// @since 3.18.0 @proposed
  @override
  final bool? rangesSupport;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['rangesSupport'] = rangesSupport;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameters of a {@link DocumentRangesFormattingRequest}.
/// @since 3.18.0 @proposed
class DocumentRangesFormattingParams implements WorkDoneProgressParams {
  DocumentRangesFormattingParams({
    required this.options,
    required this.ranges,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory DocumentRangesFormattingParams.fromJson(Map<String, Object?> json) {
    final optionsJson = json['options']!;
    final options = FormattingOptions.fromJson(
      (optionsJson as Map<String, Object?>),
    );
    final rangesJson = json['ranges']!;
    final ranges = (rangesJson as List<Range>);
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return DocumentRangesFormattingParams(
      options: options,
      ranges: ranges,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The format options
  final FormattingOptions options;

  /// The ranges to format
  final List<Range> ranges;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['options'] = options.toJson();
    json['ranges'] = ranges;
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// The parameters of a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingParams implements ToJson {
  DocumentOnTypeFormattingParams({
    required this.ch,
    required this.options,
    required this.position,
    required this.textDocument,
  });

  factory DocumentOnTypeFormattingParams.fromJson(Map<String, Object?> json) {
    final chJson = json['ch']!;
    final ch = (chJson as String);
    final optionsJson = json['options']!;
    final options = FormattingOptions.fromJson(
      (optionsJson as Map<String, Object?>),
    );
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );

    return DocumentOnTypeFormattingParams(
      ch: ch,
      options: options,
      position: position,
      textDocument: textDocument,
    );
  }

  /// The character that has been typed that triggered the formatting on type
  /// request. That is not necessarily the last character that got inserted
  /// into the document since the client could auto insert characters as well
  /// (e.g. like automatic brace completion).
  final String ch;

  /// The formatting options.
  final FormattingOptions options;

  /// The position around which the on type formatting should happen. This is
  /// not necessarily the exact position where the character denoted by the
  /// property `ch` got typed.
  final Position position;

  /// The document to format.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['ch'] = ch;
    json['options'] = options.toJson();
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    return json;
  }
}

/// Struct
/// Registration options for a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingRegistrationOptions
    implements
        TextDocumentRegistrationOptions,
        DocumentOnTypeFormattingOptions {
  DocumentOnTypeFormattingRegistrationOptions({
    required this.documentSelector,
    required this.firstTriggerCharacter,
    required this.moreTriggerCharacter,
  });

  factory DocumentOnTypeFormattingRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final firstTriggerCharacterJson = json['firstTriggerCharacter']!;
    final firstTriggerCharacter = (firstTriggerCharacterJson as String);
    final moreTriggerCharacterJson = json['moreTriggerCharacter']!;
    final moreTriggerCharacter = (moreTriggerCharacterJson as List<String>);

    return DocumentOnTypeFormattingRegistrationOptions(
      documentSelector: documentSelector,
      firstTriggerCharacter: firstTriggerCharacter,
      moreTriggerCharacter: moreTriggerCharacter,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// A character on which formatting should be triggered, like `{`.
  @override
  final String firstTriggerCharacter;

  /// More trigger characters.
  @override
  final List<String>? moreTriggerCharacter;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['firstTriggerCharacter'] = firstTriggerCharacter;
    json['moreTriggerCharacter'] = moreTriggerCharacter;
    return json;
  }
}

/// Struct
/// The parameters of a {@link RenameRequest}.
class RenameParams implements WorkDoneProgressParams {
  RenameParams({
    required this.newName,
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory RenameParams.fromJson(Map<String, Object?> json) {
    final newNameJson = json['newName']!;
    final newName = (newNameJson as String);
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return RenameParams(
      newName: newName,
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The new name of the symbol. If the given name is not valid the request
  /// must return a {@link ResponseError} with an appropriate message set.
  final String newName;

  /// The position at which this request was sent.
  final Position position;

  /// The document to rename.
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['newName'] = newName;
    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Registration options for a {@link RenameRequest}.
class RenameRegistrationOptions
    implements TextDocumentRegistrationOptions, RenameOptions {
  RenameRegistrationOptions({
    required this.documentSelector,
    required this.prepareProvider,
    required this.workDoneProgress,
  });

  factory RenameRegistrationOptions.fromJson(Map<String, Object?> json) {
    final documentSelectorJson = json['documentSelector']!;
    final documentSelector = (documentSelectorJson as OrRefType);
    final prepareProviderJson = json['prepareProvider']!;
    final prepareProvider = (prepareProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return RenameRegistrationOptions(
      documentSelector: documentSelector,
      prepareProvider: prepareProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A document selector to identify the scope of the registration. If set
  /// to null the document selector provided on the client side will be used.
  @override
  final OrRefType documentSelector;

  /// Renames should be checked and tested before being executed.
  /// @since version 3.12.0
  @override
  final bool? prepareProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentSelector'] = documentSelector;
    json['prepareProvider'] = prepareProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
class PrepareRenameParams
    implements TextDocumentPositionParams, WorkDoneProgressParams {
  PrepareRenameParams({
    required this.position,
    required this.textDocument,
    required this.workDoneToken,
  });

  factory PrepareRenameParams.fromJson(Map<String, Object?> json) {
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return PrepareRenameParams(
      position: position,
      textDocument: textDocument,
      workDoneToken: workDoneToken,
    );
  }

  /// The position inside the text document.
  @override
  final Position position;

  /// The text document.
  @override
  final TextDocumentIdentifier textDocument;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// The parameters of a {@link ExecuteCommandRequest}.
class ExecuteCommandParams implements WorkDoneProgressParams {
  ExecuteCommandParams({
    required this.arguments,
    required this.command,
    required this.workDoneToken,
  });

  factory ExecuteCommandParams.fromJson(Map<String, Object?> json) {
    final argumentsJson = json['arguments']!;
    final arguments = (argumentsJson as List<LSPAny>);
    final commandJson = json['command']!;
    final command = (commandJson as String);
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return ExecuteCommandParams(
      arguments: arguments,
      command: command,
      workDoneToken: workDoneToken,
    );
  }

  /// Arguments that the command should be invoked with.
  final List<LSPAny>? arguments;

  /// The identifier of the actual command handler.
  final String command;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['arguments'] = arguments;
    json['command'] = command;
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
/// Registration options for a {@link ExecuteCommandRequest}.
class ExecuteCommandRegistrationOptions implements ExecuteCommandOptions {
  ExecuteCommandRegistrationOptions({
    required this.commands,
    required this.workDoneProgress,
  });

  factory ExecuteCommandRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final commandsJson = json['commands']!;
    final commands = (commandsJson as List<String>);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return ExecuteCommandRegistrationOptions(
      commands: commands,
      workDoneProgress: workDoneProgress,
    );
  }

  /// The commands to be executed on the server
  @override
  final List<String> commands;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['commands'] = commands;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The parameters passed via an apply workspace edit request.
class ApplyWorkspaceEditParams implements ToJson {
  ApplyWorkspaceEditParams({required this.edit, required this.label});

  factory ApplyWorkspaceEditParams.fromJson(Map<String, Object?> json) {
    final editJson = json['edit']!;
    final edit = WorkspaceEdit.fromJson((editJson as Map<String, Object?>));
    final labelJson = json['label']!;
    final label = (labelJson as String);

    return ApplyWorkspaceEditParams(edit: edit, label: label);
  }

  /// The edits to apply.
  final WorkspaceEdit edit;

  /// An optional label of the workspace edit. This label is presented in the
  /// user interface for example on an undo stack to undo the workspace edit.
  final String? label;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['edit'] = edit.toJson();
    json['label'] = label;
    return json;
  }
}

/// Struct
/// The result returned from the apply workspace edit request.
/// @since 3.17 renamed from ApplyWorkspaceEditResponse
class ApplyWorkspaceEditResult implements ToJson {
  ApplyWorkspaceEditResult({
    required this.applied,
    required this.failedChange,
    required this.failureReason,
  });

  factory ApplyWorkspaceEditResult.fromJson(Map<String, Object?> json) {
    final appliedJson = json['applied']!;
    final applied = (appliedJson as bool);
    final failedChangeJson = json['failedChange']!;
    final failedChange = (failedChangeJson as int);
    final failureReasonJson = json['failureReason']!;
    final failureReason = (failureReasonJson as String);

    return ApplyWorkspaceEditResult(
      applied: applied,
      failedChange: failedChange,
      failureReason: failureReason,
    );
  }

  /// Indicates whether the edit was applied or not.
  final bool applied;

  /// Depending on the client's failure handling strategy `failedChange`
  /// might contain the index of the change that failed. This property is
  /// only available if the client signals a `failureHandlingStrategy` in its
  /// client capabilities.
  final int? failedChange;

  /// An optional textual description for why the edit was not applied. This
  /// may be used by the server for diagnostic logging or to provide a
  /// suitable error for a request that triggered the edit.
  final String? failureReason;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['applied'] = applied;
    json['failedChange'] = failedChange;
    json['failureReason'] = failureReason;
    return json;
  }
}

/// Struct
class WorkDoneProgressBegin implements ToJson {
  WorkDoneProgressBegin({
    required this.cancellable,
    required this.kind,
    required this.message,
    required this.percentage,
    required this.title,
  });

  factory WorkDoneProgressBegin.fromJson(Map<String, Object?> json) {
    final cancellableJson = json['cancellable']!;
    final cancellable = (cancellableJson as bool);
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final messageJson = json['message']!;
    final message = (messageJson as String);
    final percentageJson = json['percentage']!;
    final percentage = (percentageJson as int);
    final titleJson = json['title']!;
    final title = (titleJson as String);

    return WorkDoneProgressBegin(
      cancellable: cancellable,
      kind: kind,
      message: message,
      percentage: percentage,
      title: title,
    );
  }

  /// Controls if a cancel button should show to allow the user to cancel the
  /// long running operation. Clients that don't support cancellation are
  /// allowed to ignore the setting.
  final bool? cancellable;

  final String kind;

  /// Optional, more detailed associated progress message. Contains
  /// complementary information to the `title`.
  /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
  /// If unset, the previous progress message (if any) is still valid.
  final String? message;

  /// Optional progress percentage to display (value 100 is considered 100%).
  /// If not provided infinite progress is assumed and clients are allowed to
  /// ignore the `percentage` value in subsequent report notifications.
  /// The value should be steadily rising. Clients are free to ignore values
  /// that are not following this rule. The value range is [0, 100].
  final int? percentage;

  /// Mandatory title of the progress operation. Used to briefly inform about
  /// the kind of operation being performed.
  /// Examples: "Indexing" or "Linking dependencies".
  final String title;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['cancellable'] = cancellable;
    json['kind'] = kind;
    json['message'] = message;
    json['percentage'] = percentage;
    json['title'] = title;
    return json;
  }
}

/// Struct
class WorkDoneProgressReport implements ToJson {
  WorkDoneProgressReport({
    required this.cancellable,
    required this.kind,
    required this.message,
    required this.percentage,
  });

  factory WorkDoneProgressReport.fromJson(Map<String, Object?> json) {
    final cancellableJson = json['cancellable']!;
    final cancellable = (cancellableJson as bool);
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final messageJson = json['message']!;
    final message = (messageJson as String);
    final percentageJson = json['percentage']!;
    final percentage = (percentageJson as int);

    return WorkDoneProgressReport(
      cancellable: cancellable,
      kind: kind,
      message: message,
      percentage: percentage,
    );
  }

  /// Controls enablement state of a cancel button.
  /// Clients that don't support cancellation or don't support controlling
  /// the button's enablement state are allowed to ignore the property.
  final bool? cancellable;

  final String kind;

  /// Optional, more detailed associated progress message. Contains
  /// complementary information to the `title`.
  /// Examples: "3/25 files", "project/src/module2", "node_modules/some_dep".
  /// If unset, the previous progress message (if any) is still valid.
  final String? message;

  /// Optional progress percentage to display (value 100 is considered 100%).
  /// If not provided infinite progress is assumed and clients are allowed to
  /// ignore the `percentage` value in subsequent report notifications.
  /// The value should be steadily rising. Clients are free to ignore values
  /// that are not following this rule. The value range is [0, 100].
  final int? percentage;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['cancellable'] = cancellable;
    json['kind'] = kind;
    json['message'] = message;
    json['percentage'] = percentage;
    return json;
  }
}

/// Struct
class WorkDoneProgressEnd implements ToJson {
  WorkDoneProgressEnd({required this.kind, required this.message});

  factory WorkDoneProgressEnd.fromJson(Map<String, Object?> json) {
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final messageJson = json['message']!;
    final message = (messageJson as String);

    return WorkDoneProgressEnd(kind: kind, message: message);
  }

  final String kind;

  /// Optional, a final message indicating to for example indicate the
  /// outcome of the operation.
  final String? message;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['kind'] = kind;
    json['message'] = message;
    return json;
  }
}

/// Struct
class SetTraceParams implements ToJson {
  SetTraceParams({required this.value});

  factory SetTraceParams.fromJson(Map<String, Object?> json) {
    final valueJson = json['value']!;
    // Handle enum type
    final value = _i1.$enumDecode(_$TraceValuesEnumMap, valueJson);

    return SetTraceParams(value: value);
  }

  final TraceValues value;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['value'] = value.value;
    return json;
  }
}

/// Struct
class LogTraceParams implements ToJson {
  LogTraceParams({required this.message, required this.verbose});

  factory LogTraceParams.fromJson(Map<String, Object?> json) {
    final messageJson = json['message']!;
    final message = (messageJson as String);
    final verboseJson = json['verbose']!;
    final verbose = (verboseJson as String);

    return LogTraceParams(message: message, verbose: verbose);
  }

  final String message;

  final String? verbose;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['message'] = message;
    json['verbose'] = verbose;
    return json;
  }
}

/// Struct
class CancelParams implements ToJson {
  CancelParams({required this.id});

  factory CancelParams.fromJson(Map<String, Object?> json) {
    final idJson = json['id']!;
    final id = (idJson as OrRefType);

    return CancelParams(id: id);
  }

  /// The request id to cancel.
  final OrRefType id;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['id'] = id;
    return json;
  }
}

/// Struct
class ProgressParams implements ToJson {
  ProgressParams({required this.token, required this.value});

  factory ProgressParams.fromJson(Map<String, Object?> json) {
    final tokenJson = json['token']!;
    final token = (tokenJson as ProgressToken);
    final valueJson = json['value']!;
    final value = (valueJson as LSPAny);

    return ProgressParams(token: token, value: value);
  }

  /// The progress token provided by the client or server.
  final ProgressToken token;

  /// The progress data.
  final LSPAny value;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['token'] = token;
    json['value'] = value;
    return json;
  }
}

/// Struct
/// A parameter literal used in requests to pass a text document and a position
/// inside that document.
class TextDocumentPositionParams implements ToJson {
  TextDocumentPositionParams({
    required this.position,
    required this.textDocument,
  });

  factory TextDocumentPositionParams.fromJson(Map<String, Object?> json) {
    final positionJson = json['position']!;
    final position = Position.fromJson((positionJson as Map<String, Object?>));
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );

    return TextDocumentPositionParams(
      position: position,
      textDocument: textDocument,
    );
  }

  /// The position inside the text document.
  final Position position;

  /// The text document.
  final TextDocumentIdentifier textDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['position'] = position.toJson();
    json['textDocument'] = textDocument.toJson();
    return json;
  }
}

/// Struct
class WorkDoneProgressParams implements ToJson {
  WorkDoneProgressParams({required this.workDoneToken});

  factory WorkDoneProgressParams.fromJson(Map<String, Object?> json) {
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return WorkDoneProgressParams(workDoneToken: workDoneToken);
  }

  /// An optional token that a server can use to report work done progress.
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
class PartialResultParams implements ToJson {
  PartialResultParams({required this.partialResultToken});

  factory PartialResultParams.fromJson(Map<String, Object?> json) {
    final partialResultTokenJson = json['partialResultToken']!;
    final partialResultToken = (partialResultTokenJson as ProgressToken);

    return PartialResultParams(partialResultToken: partialResultToken);
  }

  /// An optional token that a server can use to report partial results (e.g.
  /// streaming) to the client.
  final ProgressToken? partialResultToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['partialResultToken'] = partialResultToken;
    return json;
  }
}

/// Struct
/// Represents the connection of two locations. Provides additional metadata
/// over normal {@link Location locations}, including an origin range.
class LocationLink implements ToJson {
  LocationLink({
    required this.originSelectionRange,
    required this.targetRange,
    required this.targetSelectionRange,
    required this.targetUri,
  });

  factory LocationLink.fromJson(Map<String, Object?> json) {
    final originSelectionRangeJson = json['originSelectionRange']!;
    final originSelectionRange = Range.fromJson(
      (originSelectionRangeJson as Map<String, Object?>),
    );
    final targetRangeJson = json['targetRange']!;
    final targetRange = Range.fromJson(
      (targetRangeJson as Map<String, Object?>),
    );
    final targetSelectionRangeJson = json['targetSelectionRange']!;
    final targetSelectionRange = Range.fromJson(
      (targetSelectionRangeJson as Map<String, Object?>),
    );
    final targetUriJson = json['targetUri']!;
    final targetUri = (targetUriJson as Uri);

    return LocationLink(
      originSelectionRange: originSelectionRange,
      targetRange: targetRange,
      targetSelectionRange: targetSelectionRange,
      targetUri: targetUri,
    );
  }

  /// Span of the origin of this link.
  /// Used as the underlined span for mouse interaction. Defaults to the word
  /// range at the definition position.
  final Range? originSelectionRange;

  /// The full target range of this link. If the target for example is a
  /// symbol then target range is the range enclosing this symbol not
  /// including leading/trailing whitespace but everything else like
  /// comments. This information is typically used to highlight the range in
  /// the editor.
  final Range targetRange;

  /// The range that should be selected and revealed when this link is being
  /// followed, e.g the name of a function. Must be contained by the
  /// `targetRange`. See also `DocumentSymbol#range`
  final Range targetSelectionRange;

  /// The target resource identifier of this link.
  final Uri targetUri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['originSelectionRange'] = originSelectionRange?.toJson();
    json['targetRange'] = targetRange.toJson();
    json['targetSelectionRange'] = targetSelectionRange.toJson();
    json['targetUri'] = targetUri;
    return json;
  }
}

/// Struct
/// A range in a text document expressed as (zero-based) start and end
/// positions.
/// If you want to specify a range that contains a line including the line
/// ending character(s) then use an end position denoting the start of the next
/// line. For example: ```ts { start: { line: 5, character: 23 } end : { line
/// 6, character : 0 } } ```
class Range implements ToJson {
  Range({required this.end, required this.start});

  factory Range.fromJson(Map<String, Object?> json) {
    final endJson = json['end']!;
    final end = Position.fromJson((endJson as Map<String, Object?>));
    final startJson = json['start']!;
    final start = Position.fromJson((startJson as Map<String, Object?>));

    return Range(end: end, start: start);
  }

  /// The range's end position.
  final Position end;

  /// The range's start position.
  final Position start;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['end'] = end.toJson();
    json['start'] = start.toJson();
    return json;
  }
}

/// Struct
class ImplementationOptions implements WorkDoneProgressOptions {
  ImplementationOptions({required this.workDoneProgress});

  factory ImplementationOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return ImplementationOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Static registration options to be returned in the initialize request.
class StaticRegistrationOptions implements ToJson {
  StaticRegistrationOptions({required this.id});

  factory StaticRegistrationOptions.fromJson(Map<String, Object?> json) {
    final idJson = json['id']!;
    final id = (idJson as String);

    return StaticRegistrationOptions(id: id);
  }

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  final String? id;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['id'] = id;
    return json;
  }
}

/// Struct
class TypeDefinitionOptions implements WorkDoneProgressOptions {
  TypeDefinitionOptions({required this.workDoneProgress});

  factory TypeDefinitionOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return TypeDefinitionOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The workspace folder change event.
class WorkspaceFoldersChangeEvent implements ToJson {
  WorkspaceFoldersChangeEvent({required this.added, required this.removed});

  factory WorkspaceFoldersChangeEvent.fromJson(Map<String, Object?> json) {
    final addedJson = json['added']!;
    final added = (addedJson as List<WorkspaceFolder>);
    final removedJson = json['removed']!;
    final removed = (removedJson as List<WorkspaceFolder>);

    return WorkspaceFoldersChangeEvent(added: added, removed: removed);
  }

  /// The array of added workspace folders
  final List<WorkspaceFolder> added;

  /// The array of the removed workspace folders
  final List<WorkspaceFolder> removed;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['added'] = added;
    json['removed'] = removed;
    return json;
  }
}

/// Struct
class ConfigurationItem implements ToJson {
  ConfigurationItem({required this.scopeUri, required this.section});

  factory ConfigurationItem.fromJson(Map<String, Object?> json) {
    final scopeUriJson = json['scopeUri']!;
    final scopeUri = (scopeUriJson as Uri);
    final sectionJson = json['section']!;
    final section = (sectionJson as String);

    return ConfigurationItem(scopeUri: scopeUri, section: section);
  }

  /// The scope to get the configuration section for.
  final Uri? scopeUri;

  /// The configuration section asked for.
  final String? section;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['scopeUri'] = scopeUri;
    json['section'] = section;
    return json;
  }
}

/// Struct
/// A literal to identify a text document in the client.
class TextDocumentIdentifier implements ToJson {
  TextDocumentIdentifier({required this.uri});

  factory TextDocumentIdentifier.fromJson(Map<String, Object?> json) {
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return TextDocumentIdentifier(uri: uri);
  }

  /// The text document's uri.
  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['uri'] = uri;
    return json;
  }
}

/// Struct
/// Represents a color in RGBA space.
class Color implements ToJson {
  Color({
    required this.alpha,
    required this.blue,
    required this.green,
    required this.red,
  });

  factory Color.fromJson(Map<String, Object?> json) {
    final alphaJson = json['alpha']!;
    final alpha = (alphaJson as double);
    final blueJson = json['blue']!;
    final blue = (blueJson as double);
    final greenJson = json['green']!;
    final green = (greenJson as double);
    final redJson = json['red']!;
    final red = (redJson as double);

    return Color(alpha: alpha, blue: blue, green: green, red: red);
  }

  /// The alpha component of this color in the range [0-1].
  final double alpha;

  /// The blue component of this color in the range [0-1].
  final double blue;

  /// The green component of this color in the range [0-1].
  final double green;

  /// The red component of this color in the range [0-1].
  final double red;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['alpha'] = alpha;
    json['blue'] = blue;
    json['green'] = green;
    json['red'] = red;
    return json;
  }
}

/// Struct
class DocumentColorOptions implements WorkDoneProgressOptions {
  DocumentColorOptions({required this.workDoneProgress});

  factory DocumentColorOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentColorOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
class FoldingRangeOptions implements WorkDoneProgressOptions {
  FoldingRangeOptions({required this.workDoneProgress});

  factory FoldingRangeOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return FoldingRangeOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
class DeclarationOptions implements WorkDoneProgressOptions {
  DeclarationOptions({required this.workDoneProgress});

  factory DeclarationOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DeclarationOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Position in a text document expressed as zero-based line and character
/// offset. Prior to 3.17 the offsets were always based on a UTF-16 string
/// representation. So a string of the form `a𐐀b` the character offset of the
/// character `a` is 0, the character offset of `𐐀` is 1 and the character
/// offset of b is 3 since `𐐀` is represented using two code units in UTF-16.
/// Since 3.17 clients and servers can agree on a different string encoding
/// representation (e.g. UTF-8). The client announces it's supported encoding
/// via the client capability
/// [`general.positionEncodings`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#clientCapabilities).
/// The value is an array of position encodings the client supports, with
/// decreasing preference (e.g. the encoding at index `0` is the most preferred
/// one). To stay backwards compatible the only mandatory encoding is UTF-16
/// represented via the string `utf-16`. The server can pick one of the
/// encodings offered by the client and signals that encoding back to the
/// client via the initialize result's property
/// [`capabilities.positionEncoding`](https://microsoft.github.io/language-server-protocol/specifications/specification-current/#serverCapabilities).
/// If the string value `utf-16` is missing from the client's capability
/// `general.positionEncodings` servers can safely assume that the client
/// supports UTF-16. If the server omits the position encoding in its
/// initialize result the encoding defaults to the string value `utf-16`.
/// Implementation considerations: since the conversion from one encoding into
/// another requires the content of the file / line the conversion is best done
/// where the file is read which is usually on the server side.
/// Positions are line end character agnostic. So you can not specify a
/// position that denotes `\r|\n` or `\n|` where `|` represents the character
/// offset.
/// @since 3.17.0 - support for negotiated position encoding.
class Position implements ToJson {
  Position({required this.character, required this.line});

  factory Position.fromJson(Map<String, Object?> json) {
    final characterJson = json['character']!;
    final character = (characterJson as int);
    final lineJson = json['line']!;
    final line = (lineJson as int);

    return Position(character: character, line: line);
  }

  /// Character offset on a line in a document (zero-based).
  /// The meaning of this offset is determined by the negotiated
  /// `PositionEncodingKind`.
  /// If the character value is greater than the line length it defaults back
  /// to the line length.
  final int character;

  /// Line position in a document (zero-based).
  /// If a line number is greater than the number of lines in a document, it
  /// defaults back to the number of lines in the document. If a line number
  /// is negative, it defaults to 0.
  final int line;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['character'] = character;
    json['line'] = line;
    return json;
  }
}

/// Struct
class SelectionRangeOptions implements WorkDoneProgressOptions {
  SelectionRangeOptions({required this.workDoneProgress});

  factory SelectionRangeOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return SelectionRangeOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Call hierarchy options used during static registration.
/// @since 3.16.0
class CallHierarchyOptions implements WorkDoneProgressOptions {
  CallHierarchyOptions({required this.workDoneProgress});

  factory CallHierarchyOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return CallHierarchyOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensOptions implements WorkDoneProgressOptions {
  SemanticTokensOptions({
    required this.full,
    required this.legend,
    required this.range,
    required this.workDoneProgress,
  });

  factory SemanticTokensOptions.fromJson(Map<String, Object?> json) {
    final fullJson = json['full']!;
    final full = (fullJson as OrRefType);
    final legendJson = json['legend']!;
    final legend = SemanticTokensLegend.fromJson(
      (legendJson as Map<String, Object?>),
    );
    final rangeJson = json['range']!;
    final range = (rangeJson as OrRefType);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return SemanticTokensOptions(
      full: full,
      legend: legend,
      range: range,
      workDoneProgress: workDoneProgress,
    );
  }

  /// Server supports providing semantic tokens for a full document.
  final OrRefType? full;

  /// The legend used by the server
  final SemanticTokensLegend legend;

  /// Server supports providing semantic tokens for a specific range of a
  /// document.
  final OrRefType? range;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['full'] = full;
    json['legend'] = legend.toJson();
    json['range'] = range;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensEdit implements ToJson {
  SemanticTokensEdit({
    required this.data,
    required this.deleteCount,
    required this.start,
  });

  factory SemanticTokensEdit.fromJson(Map<String, Object?> json) {
    final dataJson = json['data']!;
    final data = (dataJson as List<int>);
    final deleteCountJson = json['deleteCount']!;
    final deleteCount = (deleteCountJson as int);
    final startJson = json['start']!;
    final start = (startJson as int);

    return SemanticTokensEdit(
      data: data,
      deleteCount: deleteCount,
      start: start,
    );
  }

  /// The elements to insert.
  final List<int>? data;

  /// The count of elements to remove.
  final int deleteCount;

  /// The start offset of the edit.
  final int start;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['data'] = data;
    json['deleteCount'] = deleteCount;
    json['start'] = start;
    return json;
  }
}

/// Struct
class LinkedEditingRangeOptions implements WorkDoneProgressOptions {
  LinkedEditingRangeOptions({required this.workDoneProgress});

  factory LinkedEditingRangeOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return LinkedEditingRangeOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Represents information on a file/folder create.
/// @since 3.16.0
class FileCreate implements ToJson {
  FileCreate({required this.uri});

  factory FileCreate.fromJson(Map<String, Object?> json) {
    final uriJson = json['uri']!;
    final uri = (uriJson as String);

    return FileCreate(uri: uri);
  }

  /// A file:// URI for the location of the file/folder being created.
  final String uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['uri'] = uri;
    return json;
  }
}

/// Struct
/// Describes textual changes on a text document. A TextDocumentEdit describes
/// all changes on a document version Si and after they are applied move the
/// document to version Si+1. So the creator of a TextDocumentEdit doesn't need
/// to sort the array of edits or do any kind of ordering. However the edits
/// must be non overlapping.
class TextDocumentEdit implements ToJson {
  TextDocumentEdit({required this.edits, required this.textDocument});

  factory TextDocumentEdit.fromJson(Map<String, Object?> json) {
    final editsJson = json['edits']!;
    final edits = (editsJson as List<OrRefType>);
    final textDocumentJson = json['textDocument']!;
    final textDocument = OptionalVersionedTextDocumentIdentifier.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );

    return TextDocumentEdit(edits: edits, textDocument: textDocument);
  }

  /// The edits to be applied.
  /// @since 3.16.0 - support for AnnotatedTextEdit. This is guarded using a
  /// client capability.
  final List<OrRefType> edits;

  /// The text document to change.
  final OptionalVersionedTextDocumentIdentifier textDocument;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['edits'] = edits;
    json['textDocument'] = textDocument.toJson();
    return json;
  }
}

/// Struct
/// Create file operation.
class CreateFile implements ResourceOperation {
  CreateFile({
    required this.annotationId,
    required this.kind,
    required this.options,
    required this.uri,
  });

  factory CreateFile.fromJson(Map<String, Object?> json) {
    final annotationIdJson = json['annotationId']!;
    final annotationId = (annotationIdJson as ChangeAnnotationIdentifier);
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final optionsJson = json['options']!;
    final options = CreateFileOptions.fromJson(
      (optionsJson as Map<String, Object?>),
    );
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return CreateFile(
      annotationId: annotationId,
      kind: kind,
      options: options,
      uri: uri,
    );
  }

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  @override
  final ChangeAnnotationIdentifier? annotationId;

  /// A create
  @override
  final String kind;

  /// Additional options
  final CreateFileOptions? options;

  /// The resource to create.
  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['annotationId'] = annotationId;
    json['kind'] = kind;
    json['options'] = options?.toJson();
    json['uri'] = uri;
    return json;
  }
}

/// Struct
/// Rename file operation
class RenameFile implements ResourceOperation {
  RenameFile({
    required this.annotationId,
    required this.kind,
    required this.newUri,
    required this.oldUri,
    required this.options,
  });

  factory RenameFile.fromJson(Map<String, Object?> json) {
    final annotationIdJson = json['annotationId']!;
    final annotationId = (annotationIdJson as ChangeAnnotationIdentifier);
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final newUriJson = json['newUri']!;
    final newUri = (newUriJson as Uri);
    final oldUriJson = json['oldUri']!;
    final oldUri = (oldUriJson as Uri);
    final optionsJson = json['options']!;
    final options = RenameFileOptions.fromJson(
      (optionsJson as Map<String, Object?>),
    );

    return RenameFile(
      annotationId: annotationId,
      kind: kind,
      newUri: newUri,
      oldUri: oldUri,
      options: options,
    );
  }

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  @override
  final ChangeAnnotationIdentifier? annotationId;

  /// A rename
  @override
  final String kind;

  /// The new location.
  final Uri newUri;

  /// The old (existing) location.
  final Uri oldUri;

  /// Rename options.
  final RenameFileOptions? options;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['annotationId'] = annotationId;
    json['kind'] = kind;
    json['newUri'] = newUri;
    json['oldUri'] = oldUri;
    json['options'] = options?.toJson();
    return json;
  }
}

/// Struct
/// Delete file operation
class DeleteFile implements ResourceOperation {
  DeleteFile({
    required this.annotationId,
    required this.kind,
    required this.options,
    required this.uri,
  });

  factory DeleteFile.fromJson(Map<String, Object?> json) {
    final annotationIdJson = json['annotationId']!;
    final annotationId = (annotationIdJson as ChangeAnnotationIdentifier);
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final optionsJson = json['options']!;
    final options = DeleteFileOptions.fromJson(
      (optionsJson as Map<String, Object?>),
    );
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return DeleteFile(
      annotationId: annotationId,
      kind: kind,
      options: options,
      uri: uri,
    );
  }

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  @override
  final ChangeAnnotationIdentifier? annotationId;

  /// A delete
  @override
  final String kind;

  /// Delete options.
  final DeleteFileOptions? options;

  /// The file to delete.
  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['annotationId'] = annotationId;
    json['kind'] = kind;
    json['options'] = options?.toJson();
    json['uri'] = uri;
    return json;
  }
}

/// Struct
/// Additional information that describes document changes.
/// @since 3.16.0
class ChangeAnnotation implements ToJson {
  ChangeAnnotation({
    required this.description,
    required this.label,
    required this.needsConfirmation,
  });

  factory ChangeAnnotation.fromJson(Map<String, Object?> json) {
    final descriptionJson = json['description']!;
    final description = (descriptionJson as String);
    final labelJson = json['label']!;
    final label = (labelJson as String);
    final needsConfirmationJson = json['needsConfirmation']!;
    final needsConfirmation = (needsConfirmationJson as bool);

    return ChangeAnnotation(
      description: description,
      label: label,
      needsConfirmation: needsConfirmation,
    );
  }

  /// A human-readable string which is rendered less prominent in the user
  /// interface.
  final String? description;

  /// A human-readable string describing the actual change. The string is
  /// rendered prominent in the user interface.
  final String label;

  /// A flag which indicates that user confirmation is needed before applying
  /// the change.
  final bool? needsConfirmation;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['description'] = description;
    json['label'] = label;
    json['needsConfirmation'] = needsConfirmation;
    return json;
  }
}

/// Struct
/// A filter to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
class FileOperationFilter implements ToJson {
  FileOperationFilter({required this.pattern, required this.scheme});

  factory FileOperationFilter.fromJson(Map<String, Object?> json) {
    final patternJson = json['pattern']!;
    final pattern = FileOperationPattern.fromJson(
      (patternJson as Map<String, Object?>),
    );
    final schemeJson = json['scheme']!;
    final scheme = (schemeJson as String);

    return FileOperationFilter(pattern: pattern, scheme: scheme);
  }

  /// The actual file operation pattern.
  final FileOperationPattern pattern;

  /// A Uri scheme like `file` or `untitled`.
  final String? scheme;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['pattern'] = pattern.toJson();
    json['scheme'] = scheme;
    return json;
  }
}

/// Struct
/// Represents information on a file/folder rename.
/// @since 3.16.0
class FileRename implements ToJson {
  FileRename({required this.newUri, required this.oldUri});

  factory FileRename.fromJson(Map<String, Object?> json) {
    final newUriJson = json['newUri']!;
    final newUri = (newUriJson as String);
    final oldUriJson = json['oldUri']!;
    final oldUri = (oldUriJson as String);

    return FileRename(newUri: newUri, oldUri: oldUri);
  }

  /// A file:// URI for the new location of the file/folder being renamed.
  final String newUri;

  /// A file:// URI for the original location of the file/folder being
  /// renamed.
  final String oldUri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['newUri'] = newUri;
    json['oldUri'] = oldUri;
    return json;
  }
}

/// Struct
/// Represents information on a file/folder delete.
/// @since 3.16.0
class FileDelete implements ToJson {
  FileDelete({required this.uri});

  factory FileDelete.fromJson(Map<String, Object?> json) {
    final uriJson = json['uri']!;
    final uri = (uriJson as String);

    return FileDelete(uri: uri);
  }

  /// A file:// URI for the location of the file/folder being deleted.
  final String uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['uri'] = uri;
    return json;
  }
}

/// Struct
class MonikerOptions implements WorkDoneProgressOptions {
  MonikerOptions({required this.workDoneProgress});

  factory MonikerOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return MonikerOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Type hierarchy options used during static registration.
/// @since 3.17.0
class TypeHierarchyOptions implements WorkDoneProgressOptions {
  TypeHierarchyOptions({required this.workDoneProgress});

  factory TypeHierarchyOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return TypeHierarchyOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// @since 3.17.0
class InlineValueContext implements ToJson {
  InlineValueContext({required this.frameId, required this.stoppedLocation});

  factory InlineValueContext.fromJson(Map<String, Object?> json) {
    final frameIdJson = json['frameId']!;
    final frameId = (frameIdJson as int);
    final stoppedLocationJson = json['stoppedLocation']!;
    final stoppedLocation = Range.fromJson(
      (stoppedLocationJson as Map<String, Object?>),
    );

    return InlineValueContext(
      frameId: frameId,
      stoppedLocation: stoppedLocation,
    );
  }

  /// The stack frame (as a DAP Id) where the execution has stopped.
  final int frameId;

  /// The document range where execution has stopped. Typically the end
  /// position of the range denotes the line where the inline values are
  /// shown.
  final Range stoppedLocation;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['frameId'] = frameId;
    json['stoppedLocation'] = stoppedLocation.toJson();
    return json;
  }
}

/// Struct
/// Provide inline value as text.
/// @since 3.17.0
class InlineValueText implements ToJson {
  InlineValueText({required this.range, required this.text});

  factory InlineValueText.fromJson(Map<String, Object?> json) {
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final textJson = json['text']!;
    final text = (textJson as String);

    return InlineValueText(range: range, text: text);
  }

  /// The document range for which the inline value applies.
  final Range range;

  /// The text of the inline value.
  final String text;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['range'] = range.toJson();
    json['text'] = text;
    return json;
  }
}

/// Struct
/// Provide inline value through a variable lookup. If only a range is
/// specified, the variable name will be extracted from the underlying
/// document. An optional variable name can be used to override the extracted
/// name.
/// @since 3.17.0
class InlineValueVariableLookup implements ToJson {
  InlineValueVariableLookup({
    required this.caseSensitiveLookup,
    required this.range,
    required this.variableName,
  });

  factory InlineValueVariableLookup.fromJson(Map<String, Object?> json) {
    final caseSensitiveLookupJson = json['caseSensitiveLookup']!;
    final caseSensitiveLookup = (caseSensitiveLookupJson as bool);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final variableNameJson = json['variableName']!;
    final variableName = (variableNameJson as String);

    return InlineValueVariableLookup(
      caseSensitiveLookup: caseSensitiveLookup,
      range: range,
      variableName: variableName,
    );
  }

  /// How to perform the lookup.
  final bool caseSensitiveLookup;

  /// The document range for which the inline value applies. The range is
  /// used to extract the variable name from the underlying document.
  final Range range;

  /// If specified the name of the variable to look up.
  final String? variableName;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['caseSensitiveLookup'] = caseSensitiveLookup;
    json['range'] = range.toJson();
    json['variableName'] = variableName;
    return json;
  }
}

/// Struct
/// Provide an inline value through an expression evaluation. If only a range
/// is specified, the expression will be extracted from the underlying
/// document. An optional expression can be used to override the extracted
/// expression.
/// @since 3.17.0
class InlineValueEvaluatableExpression implements ToJson {
  InlineValueEvaluatableExpression({
    required this.expression,
    required this.range,
  });

  factory InlineValueEvaluatableExpression.fromJson(Map<String, Object?> json) {
    final expressionJson = json['expression']!;
    final expression = (expressionJson as String);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));

    return InlineValueEvaluatableExpression(
      expression: expression,
      range: range,
    );
  }

  /// If specified the expression overrides the extracted expression.
  final String? expression;

  /// The document range for which the inline value applies. The range is
  /// used to extract the evaluatable expression from the underlying
  /// document.
  final Range range;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['expression'] = expression;
    json['range'] = range.toJson();
    return json;
  }
}

/// Struct
/// Inline value options used during static registration.
/// @since 3.17.0
class InlineValueOptions implements WorkDoneProgressOptions {
  InlineValueOptions({required this.workDoneProgress});

  factory InlineValueOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return InlineValueOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// An inlay hint label part allows for interactive and composite labels of
/// inlay hints.
/// @since 3.17.0
class InlayHintLabelPart implements ToJson {
  InlayHintLabelPart({
    required this.command,
    required this.location,
    required this.tooltip,
    required this.value,
  });

  factory InlayHintLabelPart.fromJson(Map<String, Object?> json) {
    final commandJson = json['command']!;
    final command = Command.fromJson((commandJson as Map<String, Object?>));
    final locationJson = json['location']!;
    final location = Location.fromJson((locationJson as Map<String, Object?>));
    final tooltipJson = json['tooltip']!;
    final tooltip = (tooltipJson as OrRefType);
    final valueJson = json['value']!;
    final value = (valueJson as String);

    return InlayHintLabelPart(
      command: command,
      location: location,
      tooltip: tooltip,
      value: value,
    );
  }

  /// An optional command for this label part.
  /// Depending on the client capability `inlayHint.resolveSupport` clients
  /// might resolve this property late using the resolve request.
  final Command? command;

  /// An optional source code location that represents this label part.
  /// The editor will use this location for the hover and for code navigation
  /// features: This part will become a clickable link that resolves to the
  /// definition of the symbol at the given location (not necessarily the
  /// location itself), it shows the hover that shows at the given location,
  /// and it shows a context menu with further code navigation commands.
  /// Depending on the client capability `inlayHint.resolveSupport` clients
  /// might resolve this property late using the resolve request.
  final Location? location;

  /// The tooltip text when you hover over this label part. Depending on the
  /// client capability `inlayHint.resolveSupport` clients might resolve this
  /// property late using the resolve request.
  final OrRefType? tooltip;

  /// The value of this label part.
  final String value;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['command'] = command?.toJson();
    json['location'] = location?.toJson();
    json['tooltip'] = tooltip;
    json['value'] = value;
    return json;
  }
}

/// Struct
/// A `MarkupContent` literal represents a string value which content is
/// interpreted base on its kind flag. Currently the protocol supports
/// `plaintext` and `markdown` as markup kinds.
/// If the kind is `markdown` then the value can contain fenced code blocks
/// like in GitHub issues. See
/// https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
/// Here is an example how such a string can be constructed using JavaScript /
/// TypeScript: ```ts let markdown: MarkdownContent = { kind:
/// MarkupKind.Markdown, value: [ '# Header', 'Some text', '```typescript',
/// 'someCode();', '```' ].join('\n') }; ```
/// *Please Note* that clients might sanitize the return markdown. A client
/// could decide to remove HTML from the markdown to avoid script execution.
class MarkupContent implements ToJson {
  MarkupContent({required this.kind, required this.value});

  factory MarkupContent.fromJson(Map<String, Object?> json) {
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$MarkupKindEnumMap, kindJson);
    final valueJson = json['value']!;
    final value = (valueJson as String);

    return MarkupContent(kind: kind, value: value);
  }

  /// The type of the Markup
  final MarkupKind kind;

  /// The content itself
  final String value;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['kind'] = kind.value;
    json['value'] = value;
    return json;
  }
}

/// Struct
/// Inlay hint options used during static registration.
/// @since 3.17.0
class InlayHintOptions implements WorkDoneProgressOptions {
  InlayHintOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory InlayHintOptions.fromJson(Map<String, Object?> json) {
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return InlayHintOptions(
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// The server provides support to resolve additional information for an
  /// inlay hint item.
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// A full diagnostic report with a set of related documents.
/// @since 3.17.0
class RelatedFullDocumentDiagnosticReport
    implements FullDocumentDiagnosticReport {
  RelatedFullDocumentDiagnosticReport({
    required this.items,
    required this.kind,
    required this.relatedDocuments,
    required this.resultId,
  });

  factory RelatedFullDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) {
    final itemsJson = json['items']!;
    final items = (itemsJson as List<Diagnostic>);
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final relatedDocumentsJson = json['relatedDocuments']!;
    final relatedDocuments = (relatedDocumentsJson as Map<Uri, OrRefType>);
    final resultIdJson = json['resultId']!;
    final resultId = (resultIdJson as String);

    return RelatedFullDocumentDiagnosticReport(
      items: items,
      kind: kind,
      relatedDocuments: relatedDocuments,
      resultId: resultId,
    );
  }

  /// The actual items.
  @override
  final List<Diagnostic> items;

  /// A full document diagnostic report.
  @override
  final String kind;

  /// Diagnostics of related documents. This information is useful in
  /// programming languages where code in a file A can generate diagnostics
  /// in a file B which A depends on. An example of such a language is C/C++
  /// where marco definitions in a file a.cpp and result in errors in a
  /// header file b.hpp.
  /// @since 3.17.0
  final Map<Uri, OrRefType>? relatedDocuments;

  /// An optional result id. If provided it will be sent on the next
  /// diagnostic request for the same document.
  @override
  final String? resultId;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['items'] = items;
    json['kind'] = kind;
    json['relatedDocuments'] = relatedDocuments;
    json['resultId'] = resultId;
    return json;
  }
}

/// Struct
/// An unchanged diagnostic report with a set of related documents.
/// @since 3.17.0
class RelatedUnchangedDocumentDiagnosticReport
    implements UnchangedDocumentDiagnosticReport {
  RelatedUnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.relatedDocuments,
    required this.resultId,
  });

  factory RelatedUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) {
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final relatedDocumentsJson = json['relatedDocuments']!;
    final relatedDocuments = (relatedDocumentsJson as Map<Uri, OrRefType>);
    final resultIdJson = json['resultId']!;
    final resultId = (resultIdJson as String);

    return RelatedUnchangedDocumentDiagnosticReport(
      kind: kind,
      relatedDocuments: relatedDocuments,
      resultId: resultId,
    );
  }

  /// A document diagnostic report indicating no changes to the last result.
  /// A server can only return `unchanged` if result ids are provided.
  @override
  final String kind;

  /// Diagnostics of related documents. This information is useful in
  /// programming languages where code in a file A can generate diagnostics
  /// in a file B which A depends on. An example of such a language is C/C++
  /// where marco definitions in a file a.cpp and result in errors in a
  /// header file b.hpp.
  /// @since 3.17.0
  final Map<Uri, OrRefType>? relatedDocuments;

  /// A result id which will be sent on the next diagnostic request for the
  /// same document.
  @override
  final String resultId;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['kind'] = kind;
    json['relatedDocuments'] = relatedDocuments;
    json['resultId'] = resultId;
    return json;
  }
}

/// Struct
/// A diagnostic report with a full set of problems.
/// @since 3.17.0
class FullDocumentDiagnosticReport implements ToJson {
  FullDocumentDiagnosticReport({
    required this.items,
    required this.kind,
    required this.resultId,
  });

  factory FullDocumentDiagnosticReport.fromJson(Map<String, Object?> json) {
    final itemsJson = json['items']!;
    final items = (itemsJson as List<Diagnostic>);
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final resultIdJson = json['resultId']!;
    final resultId = (resultIdJson as String);

    return FullDocumentDiagnosticReport(
      items: items,
      kind: kind,
      resultId: resultId,
    );
  }

  /// The actual items.
  final List<Diagnostic> items;

  /// A full document diagnostic report.
  final String kind;

  /// An optional result id. If provided it will be sent on the next
  /// diagnostic request for the same document.
  final String? resultId;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['items'] = items;
    json['kind'] = kind;
    json['resultId'] = resultId;
    return json;
  }
}

/// Struct
/// A diagnostic report indicating that the last returned report is still
/// accurate.
/// @since 3.17.0
class UnchangedDocumentDiagnosticReport implements ToJson {
  UnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.resultId,
  });

  factory UnchangedDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) {
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final resultIdJson = json['resultId']!;
    final resultId = (resultIdJson as String);

    return UnchangedDocumentDiagnosticReport(kind: kind, resultId: resultId);
  }

  /// A document diagnostic report indicating no changes to the last result.
  /// A server can only return `unchanged` if result ids are provided.
  final String kind;

  /// A result id which will be sent on the next diagnostic request for the
  /// same document.
  final String resultId;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['kind'] = kind;
    json['resultId'] = resultId;
    return json;
  }
}

/// Struct
/// Diagnostic options.
/// @since 3.17.0
class DiagnosticOptions implements WorkDoneProgressOptions {
  DiagnosticOptions({
    required this.identifier,
    required this.interFileDependencies,
    required this.workDoneProgress,
    required this.workspaceDiagnostics,
  });

  factory DiagnosticOptions.fromJson(Map<String, Object?> json) {
    final identifierJson = json['identifier']!;
    final identifier = (identifierJson as String);
    final interFileDependenciesJson = json['interFileDependencies']!;
    final interFileDependencies = (interFileDependenciesJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);
    final workspaceDiagnosticsJson = json['workspaceDiagnostics']!;
    final workspaceDiagnostics = (workspaceDiagnosticsJson as bool);

    return DiagnosticOptions(
      identifier: identifier,
      interFileDependencies: interFileDependencies,
      workDoneProgress: workDoneProgress,
      workspaceDiagnostics: workspaceDiagnostics,
    );
  }

  /// An optional identifier under which the diagnostics are managed by the
  /// client.
  final String? identifier;

  /// Whether the language has inter file dependencies meaning that editing
  /// code in one file can result in a different diagnostic set in another
  /// file. Inter file dependencies are common for most programming languages
  /// and typically uncommon for linters.
  final bool interFileDependencies;

  @override
  final bool? workDoneProgress;

  /// The server provides support for workspace diagnostics as well.
  final bool workspaceDiagnostics;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['identifier'] = identifier;
    json['interFileDependencies'] = interFileDependencies;
    json['workDoneProgress'] = workDoneProgress;
    json['workspaceDiagnostics'] = workspaceDiagnostics;
    return json;
  }
}

/// Struct
/// A previous result id in a workspace pull request.
/// @since 3.17.0
class PreviousResultId implements ToJson {
  PreviousResultId({required this.uri, required this.value});

  factory PreviousResultId.fromJson(Map<String, Object?> json) {
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);
    final valueJson = json['value']!;
    final value = (valueJson as String);

    return PreviousResultId(uri: uri, value: value);
  }

  /// The URI for which the client knowns a result id.
  final Uri uri;

  /// The value of the previous result id.
  final String value;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['uri'] = uri;
    json['value'] = value;
    return json;
  }
}

/// Struct
/// A notebook document.
/// @since 3.17.0
class NotebookDocument implements ToJson {
  NotebookDocument({
    required this.cells,
    required this.metadata,
    required this.notebookType,
    required this.uri,
    required this.version,
  });

  factory NotebookDocument.fromJson(Map<String, Object?> json) {
    final cellsJson = json['cells']!;
    final cells = (cellsJson as List<NotebookCell>);
    final metadataJson = json['metadata']!;
    final metadata = (metadataJson as LSPObject);
    final notebookTypeJson = json['notebookType']!;
    final notebookType = (notebookTypeJson as String);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);
    final versionJson = json['version']!;
    final version = (versionJson as int);

    return NotebookDocument(
      cells: cells,
      metadata: metadata,
      notebookType: notebookType,
      uri: uri,
      version: version,
    );
  }

  /// The cells of a notebook.
  final List<NotebookCell> cells;

  /// Additional metadata stored with the notebook document.
  /// Note: should always be an object literal (e.g. LSPObject)
  final LSPObject? metadata;

  /// The type of the notebook.
  final String notebookType;

  /// The notebook document's uri.
  final Uri uri;

  /// The version number of this document (it will increase after each
  /// change, including undo/redo).
  final int version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['cells'] = cells;
    json['metadata'] = metadata;
    json['notebookType'] = notebookType;
    json['uri'] = uri;
    json['version'] = version;
    return json;
  }
}

/// Struct
/// An item to transfer a text document from the client to the server.
class TextDocumentItem implements ToJson {
  TextDocumentItem({
    required this.languageId,
    required this.text,
    required this.uri,
    required this.version,
  });

  factory TextDocumentItem.fromJson(Map<String, Object?> json) {
    final languageIdJson = json['languageId']!;
    final languageId = (languageIdJson as String);
    final textJson = json['text']!;
    final text = (textJson as String);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);
    final versionJson = json['version']!;
    final version = (versionJson as int);

    return TextDocumentItem(
      languageId: languageId,
      text: text,
      uri: uri,
      version: version,
    );
  }

  /// The text document's language identifier.
  final String languageId;

  /// The content of the opened text document.
  final String text;

  /// The text document's uri.
  final Uri uri;

  /// The version number of this document (it will increase after each
  /// change, including undo/redo).
  final int version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['languageId'] = languageId;
    json['text'] = text;
    json['uri'] = uri;
    json['version'] = version;
    return json;
  }
}

/// Struct
/// A versioned notebook document identifier.
/// @since 3.17.0
class VersionedNotebookDocumentIdentifier implements ToJson {
  VersionedNotebookDocumentIdentifier({
    required this.uri,
    required this.version,
  });

  factory VersionedNotebookDocumentIdentifier.fromJson(
    Map<String, Object?> json,
  ) {
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);
    final versionJson = json['version']!;
    final version = (versionJson as int);

    return VersionedNotebookDocumentIdentifier(uri: uri, version: version);
  }

  /// The notebook document's uri.
  final Uri uri;

  /// The version number of this notebook document.
  final int version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['uri'] = uri;
    json['version'] = version;
    return json;
  }
}

/// Struct
/// A change event for a notebook document.
/// @since 3.17.0
class NotebookDocumentChangeEvent implements ToJson {
  NotebookDocumentChangeEvent({required this.cells, required this.metadata});

  factory NotebookDocumentChangeEvent.fromJson(Map<String, Object?> json) {
    final cellsJson = json['cells']!;
    final cells = (cellsJson as NotebookDocumentChangeEventCells);
    final metadataJson = json['metadata']!;
    final metadata = (metadataJson as LSPObject);

    return NotebookDocumentChangeEvent(cells: cells, metadata: metadata);
  }

  /// Changes to cells
  final NotebookDocumentChangeEventCells? cells;

  /// The changed meta data if any.
  /// Note: should always be an object literal (e.g. LSPObject)
  final LSPObject? metadata;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['cells'] = cells;
    json['metadata'] = metadata;
    return json;
  }
}

/// Struct
/// A literal to identify a notebook document in the client.
/// @since 3.17.0
class NotebookDocumentIdentifier implements ToJson {
  NotebookDocumentIdentifier({required this.uri});

  factory NotebookDocumentIdentifier.fromJson(Map<String, Object?> json) {
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return NotebookDocumentIdentifier(uri: uri);
  }

  /// The notebook document's uri.
  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['uri'] = uri;
    return json;
  }
}

/// Struct
/// Provides information about the context in which an inline completion was
/// requested.
/// @since 3.18.0 @proposed
class InlineCompletionContext implements ToJson {
  InlineCompletionContext({
    required this.selectedCompletionInfo,
    required this.triggerKind,
  });

  factory InlineCompletionContext.fromJson(Map<String, Object?> json) {
    final selectedCompletionInfoJson = json['selectedCompletionInfo']!;
    final selectedCompletionInfo = SelectedCompletionInfo.fromJson(
      (selectedCompletionInfoJson as Map<String, Object?>),
    );
    final triggerKindJson = json['triggerKind']!;
    // Handle enum type
    final triggerKind = _i1.$enumDecode(
      _$InlineCompletionTriggerKindEnumMap,
      triggerKindJson,
    );

    return InlineCompletionContext(
      selectedCompletionInfo: selectedCompletionInfo,
      triggerKind: triggerKind,
    );
  }

  /// Provides information about the currently selected item in the
  /// autocomplete widget if it is visible.
  final SelectedCompletionInfo? selectedCompletionInfo;

  /// Describes how the inline completion was triggered.
  final InlineCompletionTriggerKind triggerKind;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['selectedCompletionInfo'] = selectedCompletionInfo?.toJson();
    json['triggerKind'] = triggerKind.value;
    return json;
  }
}

/// Struct
/// A string value used as a snippet is a template which allows to insert text
/// and to control the editor cursor when insertion happens.
/// A snippet can define tab stops and placeholders with `$1`, `$2` and
/// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of the
/// snippet. Variables are defined with `$name` and `${name:default value}`.
/// @since 3.18.0 @proposed
class StringValue implements ToJson {
  StringValue({required this.kind, required this.value});

  factory StringValue.fromJson(Map<String, Object?> json) {
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final valueJson = json['value']!;
    final value = (valueJson as String);

    return StringValue(kind: kind, value: value);
  }

  /// The kind of string value.
  final String kind;

  /// The snippet string.
  final String value;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['kind'] = kind;
    json['value'] = value;
    return json;
  }
}

/// Struct
/// Inline completion options used during static registration.
/// @since 3.18.0 @proposed
class InlineCompletionOptions implements WorkDoneProgressOptions {
  InlineCompletionOptions({required this.workDoneProgress});

  factory InlineCompletionOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return InlineCompletionOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// General parameters to register for a notification or to register a provider.
class Registration implements ToJson {
  Registration({
    required this.id,
    required this.method,
    required this.registerOptions,
  });

  factory Registration.fromJson(Map<String, Object?> json) {
    final idJson = json['id']!;
    final id = (idJson as String);
    final methodJson = json['method']!;
    final method = (methodJson as String);
    final registerOptionsJson = json['registerOptions']!;
    final registerOptions = (registerOptionsJson as LSPAny);

    return Registration(
      id: id,
      method: method,
      registerOptions: registerOptions,
    );
  }

  /// The id used to register the request. The id can be used to deregister
  /// the request again.
  final String id;

  /// The method / capability to register for.
  final String method;

  /// Options necessary for the registration.
  final LSPAny? registerOptions;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['id'] = id;
    json['method'] = method;
    json['registerOptions'] = registerOptions;
    return json;
  }
}

/// Struct
/// General parameters to unregister a request or notification.
class Unregistration implements ToJson {
  Unregistration({required this.id, required this.method});

  factory Unregistration.fromJson(Map<String, Object?> json) {
    final idJson = json['id']!;
    final id = (idJson as String);
    final methodJson = json['method']!;
    final method = (methodJson as String);

    return Unregistration(id: id, method: method);
  }

  /// The id used to unregister the request or notification. Usually an id
  /// provided during the register request.
  final String id;

  /// The method to unregister for.
  final String method;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['id'] = id;
    json['method'] = method;
    return json;
  }
}

/// Struct
/// The initialize parameters
class _InitializeParams implements WorkDoneProgressParams {
  _InitializeParams({
    required this.capabilities,
    required this.clientInfo,
    required this.initializationOptions,
    required this.locale,
    required this.processId,
    required this.rootPath,
    required this.rootUri,
    required this.trace,
    required this.workDoneToken,
  });

  factory _InitializeParams.fromJson(Map<String, Object?> json) {
    final capabilitiesJson = json['capabilities']!;
    final capabilities = ClientCapabilities.fromJson(
      (capabilitiesJson as Map<String, Object?>),
    );
    final clientInfoJson = json['clientInfo']!;
    final clientInfo = (clientInfoJson as InitializeParamsClientInfo);
    final initializationOptionsJson = json['initializationOptions']!;
    final initializationOptions = (initializationOptionsJson as LSPAny);
    final localeJson = json['locale']!;
    final locale = (localeJson as String);
    final processIdJson = json['processId']!;
    final processId = (processIdJson as OrRefType);
    final rootPathJson = json['rootPath']!;
    final rootPath = (rootPathJson as OrRefType);
    final rootUriJson = json['rootUri']!;
    final rootUri = (rootUriJson as OrRefType);
    final traceJson = json['trace']!;
    // Handle enum type
    final trace = _i1.$enumDecode(_$TraceValuesEnumMap, traceJson);
    final workDoneTokenJson = json['workDoneToken']!;
    final workDoneToken = (workDoneTokenJson as ProgressToken);

    return _InitializeParams(
      capabilities: capabilities,
      clientInfo: clientInfo,
      initializationOptions: initializationOptions,
      locale: locale,
      processId: processId,
      rootPath: rootPath,
      rootUri: rootUri,
      trace: trace,
      workDoneToken: workDoneToken,
    );
  }

  /// The capabilities provided by the client (editor or tool)
  final ClientCapabilities capabilities;

  /// Information about the client
  /// @since 3.15.0
  final InitializeParamsClientInfo? clientInfo;

  /// User provided initialization options.
  final LSPAny? initializationOptions;

  /// The locale the client is currently showing the user interface in. This
  /// must not necessarily be the locale of the operating system.
  /// Uses IETF language tags as the value's syntax (See
  /// https://en.wikipedia.org/wiki/IETF_language_tag)
  /// @since 3.16.0
  final String? locale;

  /// The process Id of the parent process that started the server.
  /// Is `null` if the process has not been started by another process. If
  /// the parent process is not alive then the server should exit.
  final OrRefType processId;

  /// The rootPath of the workspace. Is null if no folder is open.
  /// @deprecated in favour of rootUri.
  final OrRefType? rootPath;

  /// The rootUri of the workspace. Is null if no folder is open. If both
  /// `rootPath` and `rootUri` are set `rootUri` wins.
  /// @deprecated in favour of workspaceFolders.
  final OrRefType rootUri;

  /// The initial trace setting. If omitted trace is disabled ('off').
  final TraceValues? trace;

  /// An optional token that a server can use to report work done progress.
  @override
  final ProgressToken? workDoneToken;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['capabilities'] = capabilities.toJson();
    json['clientInfo'] = clientInfo;
    json['initializationOptions'] = initializationOptions;
    json['locale'] = locale;
    json['processId'] = processId;
    json['rootPath'] = rootPath;
    json['rootUri'] = rootUri;
    json['trace'] = trace?.value;
    json['workDoneToken'] = workDoneToken;
    return json;
  }
}

/// Struct
class WorkspaceFoldersInitializeParams implements ToJson {
  WorkspaceFoldersInitializeParams({required this.workspaceFolders});

  factory WorkspaceFoldersInitializeParams.fromJson(Map<String, Object?> json) {
    final workspaceFoldersJson = json['workspaceFolders']!;
    final workspaceFolders = (workspaceFoldersJson as OrRefType);

    return WorkspaceFoldersInitializeParams(workspaceFolders: workspaceFolders);
  }

  /// The workspace folders configured in the client when the server starts.
  /// This property is only available if the client supports workspace
  /// folders. It can be `null` if the client supports workspace folders but
  /// none are configured.
  /// @since 3.6.0
  final OrRefType? workspaceFolders;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workspaceFolders'] = workspaceFolders;
    return json;
  }
}

/// Struct
/// Defines the capabilities provided by a language server.
class ServerCapabilities implements ToJson {
  ServerCapabilities({
    required this.callHierarchyProvider,
    required this.codeActionProvider,
    required this.codeLensProvider,
    required this.colorProvider,
    required this.completionProvider,
    required this.declarationProvider,
    required this.definitionProvider,
    required this.diagnosticProvider,
    required this.documentFormattingProvider,
    required this.documentHighlightProvider,
    required this.documentLinkProvider,
    required this.documentOnTypeFormattingProvider,
    required this.documentRangeFormattingProvider,
    required this.documentSymbolProvider,
    required this.executeCommandProvider,
    required this.experimental,
    required this.foldingRangeProvider,
    required this.hoverProvider,
    required this.implementationProvider,
    required this.inlayHintProvider,
    required this.inlineCompletionProvider,
    required this.inlineValueProvider,
    required this.linkedEditingRangeProvider,
    required this.monikerProvider,
    required this.notebookDocumentSync,
    required this.positionEncoding,
    required this.referencesProvider,
    required this.renameProvider,
    required this.selectionRangeProvider,
    required this.semanticTokensProvider,
    required this.signatureHelpProvider,
    required this.textDocumentSync,
    required this.typeDefinitionProvider,
    required this.typeHierarchyProvider,
    required this.workspace,
    required this.workspaceSymbolProvider,
  });

  factory ServerCapabilities.fromJson(Map<String, Object?> json) {
    final callHierarchyProviderJson = json['callHierarchyProvider']!;
    final callHierarchyProvider = (callHierarchyProviderJson as OrRefType);
    final codeActionProviderJson = json['codeActionProvider']!;
    final codeActionProvider = (codeActionProviderJson as OrRefType);
    final codeLensProviderJson = json['codeLensProvider']!;
    final codeLensProvider = CodeLensOptions.fromJson(
      (codeLensProviderJson as Map<String, Object?>),
    );
    final colorProviderJson = json['colorProvider']!;
    final colorProvider = (colorProviderJson as OrRefType);
    final completionProviderJson = json['completionProvider']!;
    final completionProvider = CompletionOptions.fromJson(
      (completionProviderJson as Map<String, Object?>),
    );
    final declarationProviderJson = json['declarationProvider']!;
    final declarationProvider = (declarationProviderJson as OrRefType);
    final definitionProviderJson = json['definitionProvider']!;
    final definitionProvider = (definitionProviderJson as OrRefType);
    final diagnosticProviderJson = json['diagnosticProvider']!;
    final diagnosticProvider = (diagnosticProviderJson as OrRefType);
    final documentFormattingProviderJson = json['documentFormattingProvider']!;
    final documentFormattingProvider =
        (documentFormattingProviderJson as OrRefType);
    final documentHighlightProviderJson = json['documentHighlightProvider']!;
    final documentHighlightProvider =
        (documentHighlightProviderJson as OrRefType);
    final documentLinkProviderJson = json['documentLinkProvider']!;
    final documentLinkProvider = DocumentLinkOptions.fromJson(
      (documentLinkProviderJson as Map<String, Object?>),
    );
    final documentOnTypeFormattingProviderJson =
        json['documentOnTypeFormattingProvider']!;
    final documentOnTypeFormattingProvider =
        DocumentOnTypeFormattingOptions.fromJson(
          (documentOnTypeFormattingProviderJson as Map<String, Object?>),
        );
    final documentRangeFormattingProviderJson =
        json['documentRangeFormattingProvider']!;
    final documentRangeFormattingProvider =
        (documentRangeFormattingProviderJson as OrRefType);
    final documentSymbolProviderJson = json['documentSymbolProvider']!;
    final documentSymbolProvider = (documentSymbolProviderJson as OrRefType);
    final executeCommandProviderJson = json['executeCommandProvider']!;
    final executeCommandProvider = ExecuteCommandOptions.fromJson(
      (executeCommandProviderJson as Map<String, Object?>),
    );
    final experimentalJson = json['experimental']!;
    final experimental = (experimentalJson as LSPAny);
    final foldingRangeProviderJson = json['foldingRangeProvider']!;
    final foldingRangeProvider = (foldingRangeProviderJson as OrRefType);
    final hoverProviderJson = json['hoverProvider']!;
    final hoverProvider = (hoverProviderJson as OrRefType);
    final implementationProviderJson = json['implementationProvider']!;
    final implementationProvider = (implementationProviderJson as OrRefType);
    final inlayHintProviderJson = json['inlayHintProvider']!;
    final inlayHintProvider = (inlayHintProviderJson as OrRefType);
    final inlineCompletionProviderJson = json['inlineCompletionProvider']!;
    final inlineCompletionProvider =
        (inlineCompletionProviderJson as OrRefType);
    final inlineValueProviderJson = json['inlineValueProvider']!;
    final inlineValueProvider = (inlineValueProviderJson as OrRefType);
    final linkedEditingRangeProviderJson = json['linkedEditingRangeProvider']!;
    final linkedEditingRangeProvider =
        (linkedEditingRangeProviderJson as OrRefType);
    final monikerProviderJson = json['monikerProvider']!;
    final monikerProvider = (monikerProviderJson as OrRefType);
    final notebookDocumentSyncJson = json['notebookDocumentSync']!;
    final notebookDocumentSync = (notebookDocumentSyncJson as OrRefType);
    final positionEncodingJson = json['positionEncoding']!;
    // Handle enum type
    final positionEncoding = _i1.$enumDecode(
      _$PositionEncodingKindEnumMap,
      positionEncodingJson,
    );
    final referencesProviderJson = json['referencesProvider']!;
    final referencesProvider = (referencesProviderJson as OrRefType);
    final renameProviderJson = json['renameProvider']!;
    final renameProvider = (renameProviderJson as OrRefType);
    final selectionRangeProviderJson = json['selectionRangeProvider']!;
    final selectionRangeProvider = (selectionRangeProviderJson as OrRefType);
    final semanticTokensProviderJson = json['semanticTokensProvider']!;
    final semanticTokensProvider = (semanticTokensProviderJson as OrRefType);
    final signatureHelpProviderJson = json['signatureHelpProvider']!;
    final signatureHelpProvider = SignatureHelpOptions.fromJson(
      (signatureHelpProviderJson as Map<String, Object?>),
    );
    final textDocumentSyncJson = json['textDocumentSync']!;
    final textDocumentSync = (textDocumentSyncJson as OrRefType);
    final typeDefinitionProviderJson = json['typeDefinitionProvider']!;
    final typeDefinitionProvider = (typeDefinitionProviderJson as OrRefType);
    final typeHierarchyProviderJson = json['typeHierarchyProvider']!;
    final typeHierarchyProvider = (typeHierarchyProviderJson as OrRefType);
    final workspaceJson = json['workspace']!;
    final workspace = (workspaceJson as ServerCapabilitiesWorkspace);
    final workspaceSymbolProviderJson = json['workspaceSymbolProvider']!;
    final workspaceSymbolProvider = (workspaceSymbolProviderJson as OrRefType);

    return ServerCapabilities(
      callHierarchyProvider: callHierarchyProvider,
      codeActionProvider: codeActionProvider,
      codeLensProvider: codeLensProvider,
      colorProvider: colorProvider,
      completionProvider: completionProvider,
      declarationProvider: declarationProvider,
      definitionProvider: definitionProvider,
      diagnosticProvider: diagnosticProvider,
      documentFormattingProvider: documentFormattingProvider,
      documentHighlightProvider: documentHighlightProvider,
      documentLinkProvider: documentLinkProvider,
      documentOnTypeFormattingProvider: documentOnTypeFormattingProvider,
      documentRangeFormattingProvider: documentRangeFormattingProvider,
      documentSymbolProvider: documentSymbolProvider,
      executeCommandProvider: executeCommandProvider,
      experimental: experimental,
      foldingRangeProvider: foldingRangeProvider,
      hoverProvider: hoverProvider,
      implementationProvider: implementationProvider,
      inlayHintProvider: inlayHintProvider,
      inlineCompletionProvider: inlineCompletionProvider,
      inlineValueProvider: inlineValueProvider,
      linkedEditingRangeProvider: linkedEditingRangeProvider,
      monikerProvider: monikerProvider,
      notebookDocumentSync: notebookDocumentSync,
      positionEncoding: positionEncoding,
      referencesProvider: referencesProvider,
      renameProvider: renameProvider,
      selectionRangeProvider: selectionRangeProvider,
      semanticTokensProvider: semanticTokensProvider,
      signatureHelpProvider: signatureHelpProvider,
      textDocumentSync: textDocumentSync,
      typeDefinitionProvider: typeDefinitionProvider,
      typeHierarchyProvider: typeHierarchyProvider,
      workspace: workspace,
      workspaceSymbolProvider: workspaceSymbolProvider,
    );
  }

  /// The server provides call hierarchy support.
  /// @since 3.16.0
  final OrRefType? callHierarchyProvider;

  /// The server provides code actions. CodeActionOptions may only be
  /// specified if the client states that it supports
  /// `codeActionLiteralSupport` in its initial `initialize` request.
  final OrRefType? codeActionProvider;

  /// The server provides code lens.
  final CodeLensOptions? codeLensProvider;

  /// The server provides color provider support.
  final OrRefType? colorProvider;

  /// The server provides completion support.
  final CompletionOptions? completionProvider;

  /// The server provides Goto Declaration support.
  final OrRefType? declarationProvider;

  /// The server provides goto definition support.
  final OrRefType? definitionProvider;

  /// The server has support for pull model diagnostics.
  /// @since 3.17.0
  final OrRefType? diagnosticProvider;

  /// The server provides document formatting.
  final OrRefType? documentFormattingProvider;

  /// The server provides document highlight support.
  final OrRefType? documentHighlightProvider;

  /// The server provides document link support.
  final DocumentLinkOptions? documentLinkProvider;

  /// The server provides document formatting on typing.
  final DocumentOnTypeFormattingOptions? documentOnTypeFormattingProvider;

  /// The server provides document range formatting.
  final OrRefType? documentRangeFormattingProvider;

  /// The server provides document symbol support.
  final OrRefType? documentSymbolProvider;

  /// The server provides execute command support.
  final ExecuteCommandOptions? executeCommandProvider;

  /// Experimental server capabilities.
  final LSPAny? experimental;

  /// The server provides folding provider support.
  final OrRefType? foldingRangeProvider;

  /// The server provides hover support.
  final OrRefType? hoverProvider;

  /// The server provides Goto Implementation support.
  final OrRefType? implementationProvider;

  /// The server provides inlay hints.
  /// @since 3.17.0
  final OrRefType? inlayHintProvider;

  /// Inline completion options used during static registration.
  /// @since 3.18.0 @proposed
  final OrRefType? inlineCompletionProvider;

  /// The server provides inline values.
  /// @since 3.17.0
  final OrRefType? inlineValueProvider;

  /// The server provides linked editing range support.
  /// @since 3.16.0
  final OrRefType? linkedEditingRangeProvider;

  /// The server provides moniker support.
  /// @since 3.16.0
  final OrRefType? monikerProvider;

  /// Defines how notebook documents are synced.
  /// @since 3.17.0
  final OrRefType? notebookDocumentSync;

  /// The position encoding the server picked from the encodings offered by
  /// the client via the client capability `general.positionEncodings`.
  /// If the client didn't provide any position encodings the only valid
  /// value that a server can return is 'utf-16'.
  /// If omitted it defaults to 'utf-16'.
  /// @since 3.17.0
  final PositionEncodingKind? positionEncoding;

  /// The server provides find references support.
  final OrRefType? referencesProvider;

  /// The server provides rename support. RenameOptions may only be specified
  /// if the client states that it supports `prepareSupport` in its initial
  /// `initialize` request.
  final OrRefType? renameProvider;

  /// The server provides selection range support.
  final OrRefType? selectionRangeProvider;

  /// The server provides semantic tokens support.
  /// @since 3.16.0
  final OrRefType? semanticTokensProvider;

  /// The server provides signature help support.
  final SignatureHelpOptions? signatureHelpProvider;

  /// Defines how text documents are synced. Is either a detailed structure
  /// defining each notification or for backwards compatibility the
  /// TextDocumentSyncKind number.
  final OrRefType? textDocumentSync;

  /// The server provides Goto Type Definition support.
  final OrRefType? typeDefinitionProvider;

  /// The server provides type hierarchy support.
  /// @since 3.17.0
  final OrRefType? typeHierarchyProvider;

  /// Workspace specific server capabilities.
  final ServerCapabilitiesWorkspace? workspace;

  /// The server provides workspace symbol support.
  final OrRefType? workspaceSymbolProvider;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['callHierarchyProvider'] = callHierarchyProvider;
    json['codeActionProvider'] = codeActionProvider;
    json['codeLensProvider'] = codeLensProvider?.toJson();
    json['colorProvider'] = colorProvider;
    json['completionProvider'] = completionProvider?.toJson();
    json['declarationProvider'] = declarationProvider;
    json['definitionProvider'] = definitionProvider;
    json['diagnosticProvider'] = diagnosticProvider;
    json['documentFormattingProvider'] = documentFormattingProvider;
    json['documentHighlightProvider'] = documentHighlightProvider;
    json['documentLinkProvider'] = documentLinkProvider?.toJson();
    json['documentOnTypeFormattingProvider'] = documentOnTypeFormattingProvider
        ?.toJson();
    json['documentRangeFormattingProvider'] = documentRangeFormattingProvider;
    json['documentSymbolProvider'] = documentSymbolProvider;
    json['executeCommandProvider'] = executeCommandProvider?.toJson();
    json['experimental'] = experimental;
    json['foldingRangeProvider'] = foldingRangeProvider;
    json['hoverProvider'] = hoverProvider;
    json['implementationProvider'] = implementationProvider;
    json['inlayHintProvider'] = inlayHintProvider;
    json['inlineCompletionProvider'] = inlineCompletionProvider;
    json['inlineValueProvider'] = inlineValueProvider;
    json['linkedEditingRangeProvider'] = linkedEditingRangeProvider;
    json['monikerProvider'] = monikerProvider;
    json['notebookDocumentSync'] = notebookDocumentSync;
    json['positionEncoding'] = positionEncoding?.value;
    json['referencesProvider'] = referencesProvider;
    json['renameProvider'] = renameProvider;
    json['selectionRangeProvider'] = selectionRangeProvider;
    json['semanticTokensProvider'] = semanticTokensProvider;
    json['signatureHelpProvider'] = signatureHelpProvider?.toJson();
    json['textDocumentSync'] = textDocumentSync;
    json['typeDefinitionProvider'] = typeDefinitionProvider;
    json['typeHierarchyProvider'] = typeHierarchyProvider;
    json['workspace'] = workspace;
    json['workspaceSymbolProvider'] = workspaceSymbolProvider;
    return json;
  }
}

/// Struct
/// A text document identifier to denote a specific version of a text document.
class VersionedTextDocumentIdentifier implements TextDocumentIdentifier {
  VersionedTextDocumentIdentifier({required this.uri, required this.version});

  factory VersionedTextDocumentIdentifier.fromJson(Map<String, Object?> json) {
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);
    final versionJson = json['version']!;
    final version = (versionJson as int);

    return VersionedTextDocumentIdentifier(uri: uri, version: version);
  }

  /// The text document's uri.
  @override
  final Uri uri;

  /// The version number of this document.
  final int version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['uri'] = uri;
    json['version'] = version;
    return json;
  }
}

/// Struct
/// Save options.
class SaveOptions implements ToJson {
  SaveOptions({required this.includeText});

  factory SaveOptions.fromJson(Map<String, Object?> json) {
    final includeTextJson = json['includeText']!;
    final includeText = (includeTextJson as bool);

    return SaveOptions(includeText: includeText);
  }

  /// The client is supposed to include the content on save.
  final bool? includeText;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['includeText'] = includeText;
    return json;
  }
}

/// Struct
/// An event describing a file change.
class FileEvent implements ToJson {
  FileEvent({required this.type, required this.uri});

  factory FileEvent.fromJson(Map<String, Object?> json) {
    final typeJson = json['type']!;
    // Handle enum type
    final type = _i1.$enumDecode(_$FileChangeTypeEnumMap, typeJson);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);

    return FileEvent(type: type, uri: uri);
  }

  /// The change type.
  final FileChangeType type;

  /// The file's uri.
  final Uri uri;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['type'] = type.value;
    json['uri'] = uri;
    return json;
  }
}

/// Struct
class FileSystemWatcher implements ToJson {
  FileSystemWatcher({required this.globPattern, required this.kind});

  factory FileSystemWatcher.fromJson(Map<String, Object?> json) {
    final globPatternJson = json['globPattern']!;
    final globPattern = (globPatternJson as GlobPattern);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$WatchKindEnumMap, kindJson);

    return FileSystemWatcher(globPattern: globPattern, kind: kind);
  }

  /// The glob pattern to watch. See {@link GlobPattern glob pattern} for
  /// more detail.
  /// @since 3.17.0 support for relative patterns.
  final GlobPattern globPattern;

  /// The kind of events of interest. If omitted it defaults to
  /// WatchKind.Create | WatchKind.Change | WatchKind.Delete which is 7.
  final WatchKind? kind;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['globPattern'] = globPattern;
    json['kind'] = kind?.value;
    return json;
  }
}

/// Struct
/// Represents a diagnostic, such as a compiler error or warning. Diagnostic
/// objects are only valid in the scope of a resource.
class Diagnostic implements ToJson {
  Diagnostic({
    required this.code,
    required this.codeDescription,
    required this.data,
    required this.message,
    required this.range,
    required this.relatedInformation,
    required this.severity,
    required this.source,
    required this.tags,
  });

  factory Diagnostic.fromJson(Map<String, Object?> json) {
    final codeJson = json['code']!;
    final code = (codeJson as OrRefType);
    final codeDescriptionJson = json['codeDescription']!;
    final codeDescription = CodeDescription.fromJson(
      (codeDescriptionJson as Map<String, Object?>),
    );
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);
    final messageJson = json['message']!;
    final message = (messageJson as String);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final relatedInformationJson = json['relatedInformation']!;
    final relatedInformation =
        (relatedInformationJson as List<DiagnosticRelatedInformation>);
    final severityJson = json['severity']!;
    // Handle enum type
    final severity = _i1.$enumDecode(_$DiagnosticSeverityEnumMap, severityJson);
    final sourceJson = json['source']!;
    final source = (sourceJson as String);
    final tagsJson = json['tags']!;
    final tags = (tagsJson as List<DiagnosticTag>);

    return Diagnostic(
      code: code,
      codeDescription: codeDescription,
      data: data,
      message: message,
      range: range,
      relatedInformation: relatedInformation,
      severity: severity,
      source: source,
      tags: tags,
    );
  }

  /// The diagnostic's code, which usually appear in the user interface.
  final OrRefType? code;

  /// An optional property to describe the error code. Requires the code
  /// field (above) to be present/not null.
  /// @since 3.16.0
  final CodeDescription? codeDescription;

  /// A data entry field that is preserved between a
  /// `textDocument/publishDiagnostics` notification and
  /// `textDocument/codeAction` request.
  /// @since 3.16.0
  final LSPAny? data;

  /// The diagnostic's message. It usually appears in the user interface
  final String message;

  /// The range at which the message applies
  final Range range;

  /// An array of related diagnostic information, e.g. when symbol-names
  /// within a scope collide all definitions can be marked via this property.
  final List<DiagnosticRelatedInformation>? relatedInformation;

  /// The diagnostic's severity. Can be omitted. If omitted it is up to the
  /// client to interpret diagnostics as error, warning, info or hint.
  final DiagnosticSeverity? severity;

  /// A human-readable string describing the source of this diagnostic, e.g.
  /// 'typescript' or 'super lint'. It usually appears in the user interface.
  final String? source;

  /// Additional metadata about the diagnostic.
  /// @since 3.15.0
  final List<DiagnosticTag>? tags;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['code'] = code;
    json['codeDescription'] = codeDescription?.toJson();
    json['data'] = data;
    json['message'] = message;
    json['range'] = range.toJson();
    json['relatedInformation'] = relatedInformation;
    json['severity'] = severity?.value;
    json['source'] = source;
    json['tags'] = tags;
    return json;
  }
}

/// Struct
/// Contains additional information about the context in which a completion
/// request is triggered.
class CompletionContext implements ToJson {
  CompletionContext({
    required this.triggerCharacter,
    required this.triggerKind,
  });

  factory CompletionContext.fromJson(Map<String, Object?> json) {
    final triggerCharacterJson = json['triggerCharacter']!;
    final triggerCharacter = (triggerCharacterJson as String);
    final triggerKindJson = json['triggerKind']!;
    // Handle enum type
    final triggerKind = _i1.$enumDecode(
      _$CompletionTriggerKindEnumMap,
      triggerKindJson,
    );

    return CompletionContext(
      triggerCharacter: triggerCharacter,
      triggerKind: triggerKind,
    );
  }

  /// The trigger character (a single character) that has trigger code
  /// complete. Is undefined if `triggerKind !==
  /// CompletionTriggerKind.TriggerCharacter`
  final String? triggerCharacter;

  /// How the completion was triggered.
  final CompletionTriggerKind triggerKind;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['triggerCharacter'] = triggerCharacter;
    json['triggerKind'] = triggerKind.value;
    return json;
  }
}

/// Struct
/// Additional details for a completion item label.
/// @since 3.17.0
class CompletionItemLabelDetails implements ToJson {
  CompletionItemLabelDetails({required this.description, required this.detail});

  factory CompletionItemLabelDetails.fromJson(Map<String, Object?> json) {
    final descriptionJson = json['description']!;
    final description = (descriptionJson as String);
    final detailJson = json['detail']!;
    final detail = (detailJson as String);

    return CompletionItemLabelDetails(description: description, detail: detail);
  }

  /// An optional string which is rendered less prominently after {@link
  /// CompletionItem.detail}. Should be used for fully qualified names and
  /// file paths.
  final String? description;

  /// An optional string which is rendered less prominently directly after
  /// {@link CompletionItem.label label}, without any spacing. Should be used
  /// for function signatures and type annotations.
  final String? detail;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['description'] = description;
    json['detail'] = detail;
    return json;
  }
}

/// Struct
/// A special text edit to provide an insert and a replace operation.
/// @since 3.16.0
class InsertReplaceEdit implements ToJson {
  InsertReplaceEdit({
    required this.insert,
    required this.newText,
    required this.replace,
  });

  factory InsertReplaceEdit.fromJson(Map<String, Object?> json) {
    final insertJson = json['insert']!;
    final insert = Range.fromJson((insertJson as Map<String, Object?>));
    final newTextJson = json['newText']!;
    final newText = (newTextJson as String);
    final replaceJson = json['replace']!;
    final replace = Range.fromJson((replaceJson as Map<String, Object?>));

    return InsertReplaceEdit(
      insert: insert,
      newText: newText,
      replace: replace,
    );
  }

  /// The range if the insert is requested
  final Range insert;

  /// The string to be inserted.
  final String newText;

  /// The range if the replace is requested.
  final Range replace;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['insert'] = insert.toJson();
    json['newText'] = newText;
    json['replace'] = replace.toJson();
    return json;
  }
}

/// Struct
/// Completion options.
class CompletionOptions implements WorkDoneProgressOptions {
  CompletionOptions({
    required this.allCommitCharacters,
    required this.completionItem,
    required this.resolveProvider,
    required this.triggerCharacters,
    required this.workDoneProgress,
  });

  factory CompletionOptions.fromJson(Map<String, Object?> json) {
    final allCommitCharactersJson = json['allCommitCharacters']!;
    final allCommitCharacters = (allCommitCharactersJson as List<String>);
    final completionItemJson = json['completionItem']!;
    final completionItem =
        (completionItemJson as CompletionOptionsCompletionItem);
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final triggerCharactersJson = json['triggerCharacters']!;
    final triggerCharacters = (triggerCharactersJson as List<String>);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return CompletionOptions(
      allCommitCharacters: allCommitCharacters,
      completionItem: completionItem,
      resolveProvider: resolveProvider,
      triggerCharacters: triggerCharacters,
      workDoneProgress: workDoneProgress,
    );
  }

  /// The list of all possible characters that commit a completion. This
  /// field can be used if clients don't support individual commit characters
  /// per completion item. See
  /// `ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`
  /// If a server provides both `allCommitCharacters` and commit characters
  /// on an individual completion item the ones on the completion item win.
  /// @since 3.2.0
  final List<String>? allCommitCharacters;

  /// The server supports the following `CompletionItem` specific
  /// capabilities.
  /// @since 3.17.0
  final CompletionOptionsCompletionItem? completionItem;

  /// The server provides support to resolve additional information for a
  /// completion item.
  final bool? resolveProvider;

  /// Most tools trigger completion request automatically without explicitly
  /// requesting it using a keyboard shortcut (e.g. Ctrl+Space). Typically
  /// they do so when the user starts to type an identifier. For example if
  /// the user types `c` in a JavaScript file code complete will
  /// automatically pop up present `console` besides others as a completion
  /// item. Characters that make up identifiers don't need to be listed here.
  /// If code complete should automatically be trigger on characters not
  /// being valid inside an identifier (for example `.` in JavaScript) list
  /// them in `triggerCharacters`.
  final List<String>? triggerCharacters;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['allCommitCharacters'] = allCommitCharacters;
    json['completionItem'] = completionItem;
    json['resolveProvider'] = resolveProvider;
    json['triggerCharacters'] = triggerCharacters;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Hover options.
class HoverOptions implements WorkDoneProgressOptions {
  HoverOptions({required this.workDoneProgress});

  factory HoverOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return HoverOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Additional information about the context in which a signature help request
/// was triggered.
/// @since 3.15.0
class SignatureHelpContext implements ToJson {
  SignatureHelpContext({
    required this.activeSignatureHelp,
    required this.isRetrigger,
    required this.triggerCharacter,
    required this.triggerKind,
  });

  factory SignatureHelpContext.fromJson(Map<String, Object?> json) {
    final activeSignatureHelpJson = json['activeSignatureHelp']!;
    final activeSignatureHelp = SignatureHelp.fromJson(
      (activeSignatureHelpJson as Map<String, Object?>),
    );
    final isRetriggerJson = json['isRetrigger']!;
    final isRetrigger = (isRetriggerJson as bool);
    final triggerCharacterJson = json['triggerCharacter']!;
    final triggerCharacter = (triggerCharacterJson as String);
    final triggerKindJson = json['triggerKind']!;
    // Handle enum type
    final triggerKind = _i1.$enumDecode(
      _$SignatureHelpTriggerKindEnumMap,
      triggerKindJson,
    );

    return SignatureHelpContext(
      activeSignatureHelp: activeSignatureHelp,
      isRetrigger: isRetrigger,
      triggerCharacter: triggerCharacter,
      triggerKind: triggerKind,
    );
  }

  /// The currently active `SignatureHelp`.
  /// The `activeSignatureHelp` has its `SignatureHelp.activeSignature` field
  /// updated based on the user navigating through available signatures.
  final SignatureHelp? activeSignatureHelp;

  /// `true` if signature help was already showing when it was triggered.
  /// Retriggers occurs when the signature help is already active and can be
  /// caused by actions such as typing a trigger character, a cursor move, or
  /// document content changes.
  final bool isRetrigger;

  /// Character that caused signature help to be triggered.
  /// This is undefined when `triggerKind !==
  /// SignatureHelpTriggerKind.TriggerCharacter`
  final String? triggerCharacter;

  /// Action that caused signature help to be triggered.
  final SignatureHelpTriggerKind triggerKind;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['activeSignatureHelp'] = activeSignatureHelp?.toJson();
    json['isRetrigger'] = isRetrigger;
    json['triggerCharacter'] = triggerCharacter;
    json['triggerKind'] = triggerKind.value;
    return json;
  }
}

/// Struct
/// Represents the signature of something callable. A signature can have a
/// label, like a function-name, a doc-comment, and a set of parameters.
class SignatureInformation implements ToJson {
  SignatureInformation({
    required this.activeParameter,
    required this.documentation,
    required this.label,
    required this.parameters,
  });

  factory SignatureInformation.fromJson(Map<String, Object?> json) {
    final activeParameterJson = json['activeParameter']!;
    final activeParameter = (activeParameterJson as int);
    final documentationJson = json['documentation']!;
    final documentation = (documentationJson as OrRefType);
    final labelJson = json['label']!;
    final label = (labelJson as String);
    final parametersJson = json['parameters']!;
    final parameters = (parametersJson as List<ParameterInformation>);

    return SignatureInformation(
      activeParameter: activeParameter,
      documentation: documentation,
      label: label,
      parameters: parameters,
    );
  }

  /// The index of the active parameter.
  /// If provided, this is used in place of `SignatureHelp.activeParameter`.
  /// @since 3.16.0
  final int? activeParameter;

  /// The human-readable doc-comment of this signature. Will be shown in the
  /// UI but can be omitted.
  final OrRefType? documentation;

  /// The label of this signature. Will be shown in the UI.
  final String label;

  /// The parameters of this signature.
  final List<ParameterInformation>? parameters;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['activeParameter'] = activeParameter;
    json['documentation'] = documentation;
    json['label'] = label;
    json['parameters'] = parameters;
    return json;
  }
}

/// Struct
/// Server Capabilities for a {@link SignatureHelpRequest}.
class SignatureHelpOptions implements WorkDoneProgressOptions {
  SignatureHelpOptions({
    required this.retriggerCharacters,
    required this.triggerCharacters,
    required this.workDoneProgress,
  });

  factory SignatureHelpOptions.fromJson(Map<String, Object?> json) {
    final retriggerCharactersJson = json['retriggerCharacters']!;
    final retriggerCharacters = (retriggerCharactersJson as List<String>);
    final triggerCharactersJson = json['triggerCharacters']!;
    final triggerCharacters = (triggerCharactersJson as List<String>);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return SignatureHelpOptions(
      retriggerCharacters: retriggerCharacters,
      triggerCharacters: triggerCharacters,
      workDoneProgress: workDoneProgress,
    );
  }

  /// List of characters that re-trigger signature help.
  /// These trigger characters are only active when signature help is already
  /// showing. All trigger characters are also counted as re-trigger
  /// characters.
  /// @since 3.15.0
  final List<String>? retriggerCharacters;

  /// List of characters that trigger signature help automatically.
  final List<String>? triggerCharacters;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['retriggerCharacters'] = retriggerCharacters;
    json['triggerCharacters'] = triggerCharacters;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Server Capabilities for a {@link DefinitionRequest}.
class DefinitionOptions implements WorkDoneProgressOptions {
  DefinitionOptions({required this.workDoneProgress});

  factory DefinitionOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DefinitionOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Value-object that contains additional information when requesting
/// references.
class ReferenceContext implements ToJson {
  ReferenceContext({required this.includeDeclaration});

  factory ReferenceContext.fromJson(Map<String, Object?> json) {
    final includeDeclarationJson = json['includeDeclaration']!;
    final includeDeclaration = (includeDeclarationJson as bool);

    return ReferenceContext(includeDeclaration: includeDeclaration);
  }

  /// Include the declaration of the current symbol.
  final bool includeDeclaration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['includeDeclaration'] = includeDeclaration;
    return json;
  }
}

/// Struct
/// Reference options.
class ReferenceOptions implements WorkDoneProgressOptions {
  ReferenceOptions({required this.workDoneProgress});

  factory ReferenceOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return ReferenceOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Provider options for a {@link DocumentHighlightRequest}.
class DocumentHighlightOptions implements WorkDoneProgressOptions {
  DocumentHighlightOptions({required this.workDoneProgress});

  factory DocumentHighlightOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentHighlightOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// A base for all symbol information.
class BaseSymbolInformation implements ToJson {
  BaseSymbolInformation({
    required this.containerName,
    required this.kind,
    required this.name,
    required this.tags,
  });

  factory BaseSymbolInformation.fromJson(Map<String, Object?> json) {
    final containerNameJson = json['containerName']!;
    final containerName = (containerNameJson as String);
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$SymbolKindEnumMap, kindJson);
    final nameJson = json['name']!;
    final name = (nameJson as String);
    final tagsJson = json['tags']!;
    final tags = (tagsJson as List<SymbolTag>);

    return BaseSymbolInformation(
      containerName: containerName,
      kind: kind,
      name: name,
      tags: tags,
    );
  }

  /// The name of the symbol containing this symbol. This information is for
  /// user interface purposes (e.g. to render a qualifier in the user
  /// interface if necessary). It can't be used to re-infer a hierarchy for
  /// the document symbols.
  final String? containerName;

  /// The kind of this symbol.
  final SymbolKind kind;

  /// The name of this symbol.
  final String name;

  /// Tags for this symbol.
  /// @since 3.16.0
  final List<SymbolTag>? tags;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['containerName'] = containerName;
    json['kind'] = kind.value;
    json['name'] = name;
    json['tags'] = tags;
    return json;
  }
}

/// Struct
/// Provider options for a {@link DocumentSymbolRequest}.
class DocumentSymbolOptions implements WorkDoneProgressOptions {
  DocumentSymbolOptions({required this.label, required this.workDoneProgress});

  factory DocumentSymbolOptions.fromJson(Map<String, Object?> json) {
    final labelJson = json['label']!;
    final label = (labelJson as String);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentSymbolOptions(
      label: label,
      workDoneProgress: workDoneProgress,
    );
  }

  /// A human-readable string that is shown when multiple outlines trees are
  /// shown for the same document.
  /// @since 3.16.0
  final String? label;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['label'] = label;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Contains additional diagnostic information about the context in which a
/// {@link CodeActionProvider.provideCodeActions code action} is run.
class CodeActionContext implements ToJson {
  CodeActionContext({
    required this.diagnostics,
    required this.only,
    required this.triggerKind,
  });

  factory CodeActionContext.fromJson(Map<String, Object?> json) {
    final diagnosticsJson = json['diagnostics']!;
    final diagnostics = (diagnosticsJson as List<Diagnostic>);
    final onlyJson = json['only']!;
    final only = (onlyJson as List<CodeActionKind>);
    final triggerKindJson = json['triggerKind']!;
    // Handle enum type
    final triggerKind = _i1.$enumDecode(
      _$CodeActionTriggerKindEnumMap,
      triggerKindJson,
    );

    return CodeActionContext(
      diagnostics: diagnostics,
      only: only,
      triggerKind: triggerKind,
    );
  }

  /// An array of diagnostics known on the client side overlapping the range
  /// provided to the `textDocument/codeAction` request. They are provided so
  /// that the server knows which errors are currently presented to the user
  /// for the given range. There is no guarantee that these accurately
  /// reflect the error state of the resource. The primary parameter to
  /// compute code actions is the provided range.
  final List<Diagnostic> diagnostics;

  /// Requested kind of actions to return.
  /// Actions not of this kind are filtered out by the client before being
  /// shown. So servers can omit computing them.
  final List<CodeActionKind>? only;

  /// The reason why code actions were requested.
  /// @since 3.17.0
  final CodeActionTriggerKind? triggerKind;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['diagnostics'] = diagnostics;
    json['only'] = only;
    json['triggerKind'] = triggerKind?.value;
    return json;
  }
}

/// Struct
/// Provider options for a {@link CodeActionRequest}.
class CodeActionOptions implements WorkDoneProgressOptions {
  CodeActionOptions({
    required this.codeActionKinds,
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory CodeActionOptions.fromJson(Map<String, Object?> json) {
    final codeActionKindsJson = json['codeActionKinds']!;
    final codeActionKinds = (codeActionKindsJson as List<CodeActionKind>);
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return CodeActionOptions(
      codeActionKinds: codeActionKinds,
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// CodeActionKinds that this server may return.
  /// The list of kinds may be generic, such as `CodeActionKind.Refactor`, or
  /// the server may list out every specific kind they provide.
  final List<CodeActionKind>? codeActionKinds;

  /// The server provides support to resolve additional information for a
  /// code action.
  /// @since 3.16.0
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['codeActionKinds'] = codeActionKinds;
    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Server capabilities for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolOptions implements WorkDoneProgressOptions {
  WorkspaceSymbolOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory WorkspaceSymbolOptions.fromJson(Map<String, Object?> json) {
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return WorkspaceSymbolOptions(
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// The server provides support to resolve additional information for a
  /// workspace symbol.
  /// @since 3.17.0
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Code Lens provider options of a {@link CodeLensRequest}.
class CodeLensOptions implements WorkDoneProgressOptions {
  CodeLensOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory CodeLensOptions.fromJson(Map<String, Object?> json) {
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return CodeLensOptions(
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// Code lens has a resolve provider as well.
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Provider options for a {@link DocumentLinkRequest}.
class DocumentLinkOptions implements WorkDoneProgressOptions {
  DocumentLinkOptions({
    required this.resolveProvider,
    required this.workDoneProgress,
  });

  factory DocumentLinkOptions.fromJson(Map<String, Object?> json) {
    final resolveProviderJson = json['resolveProvider']!;
    final resolveProvider = (resolveProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentLinkOptions(
      resolveProvider: resolveProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// Document links have a resolve provider as well.
  final bool? resolveProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['resolveProvider'] = resolveProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Value-object describing what options formatting should use.
class FormattingOptions implements ToJson {
  FormattingOptions({
    required this.insertFinalNewline,
    required this.insertSpaces,
    required this.tabSize,
    required this.trimFinalNewlines,
    required this.trimTrailingWhitespace,
  });

  factory FormattingOptions.fromJson(Map<String, Object?> json) {
    final insertFinalNewlineJson = json['insertFinalNewline']!;
    final insertFinalNewline = (insertFinalNewlineJson as bool);
    final insertSpacesJson = json['insertSpaces']!;
    final insertSpaces = (insertSpacesJson as bool);
    final tabSizeJson = json['tabSize']!;
    final tabSize = (tabSizeJson as int);
    final trimFinalNewlinesJson = json['trimFinalNewlines']!;
    final trimFinalNewlines = (trimFinalNewlinesJson as bool);
    final trimTrailingWhitespaceJson = json['trimTrailingWhitespace']!;
    final trimTrailingWhitespace = (trimTrailingWhitespaceJson as bool);

    return FormattingOptions(
      insertFinalNewline: insertFinalNewline,
      insertSpaces: insertSpaces,
      tabSize: tabSize,
      trimFinalNewlines: trimFinalNewlines,
      trimTrailingWhitespace: trimTrailingWhitespace,
    );
  }

  /// Insert a newline character at the end of the file if one does not exist.
  /// @since 3.15.0
  final bool? insertFinalNewline;

  /// Prefer spaces over tabs.
  final bool insertSpaces;

  /// Size of a tab in spaces.
  final int tabSize;

  /// Trim all newlines after the final newline at the end of the file.
  /// @since 3.15.0
  final bool? trimFinalNewlines;

  /// Trim trailing whitespace on a line.
  /// @since 3.15.0
  final bool? trimTrailingWhitespace;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['insertFinalNewline'] = insertFinalNewline;
    json['insertSpaces'] = insertSpaces;
    json['tabSize'] = tabSize;
    json['trimFinalNewlines'] = trimFinalNewlines;
    json['trimTrailingWhitespace'] = trimTrailingWhitespace;
    return json;
  }
}

/// Struct
/// Provider options for a {@link DocumentFormattingRequest}.
class DocumentFormattingOptions implements WorkDoneProgressOptions {
  DocumentFormattingOptions({required this.workDoneProgress});

  factory DocumentFormattingOptions.fromJson(Map<String, Object?> json) {
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentFormattingOptions(workDoneProgress: workDoneProgress);
  }

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Provider options for a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingOptions implements WorkDoneProgressOptions {
  DocumentRangeFormattingOptions({
    required this.rangesSupport,
    required this.workDoneProgress,
  });

  factory DocumentRangeFormattingOptions.fromJson(Map<String, Object?> json) {
    final rangesSupportJson = json['rangesSupport']!;
    final rangesSupport = (rangesSupportJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return DocumentRangeFormattingOptions(
      rangesSupport: rangesSupport,
      workDoneProgress: workDoneProgress,
    );
  }

  /// Whether the server supports formatting multiple ranges at once.
  /// @since 3.18.0 @proposed
  final bool? rangesSupport;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['rangesSupport'] = rangesSupport;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// Provider options for a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingOptions implements ToJson {
  DocumentOnTypeFormattingOptions({
    required this.firstTriggerCharacter,
    required this.moreTriggerCharacter,
  });

  factory DocumentOnTypeFormattingOptions.fromJson(Map<String, Object?> json) {
    final firstTriggerCharacterJson = json['firstTriggerCharacter']!;
    final firstTriggerCharacter = (firstTriggerCharacterJson as String);
    final moreTriggerCharacterJson = json['moreTriggerCharacter']!;
    final moreTriggerCharacter = (moreTriggerCharacterJson as List<String>);

    return DocumentOnTypeFormattingOptions(
      firstTriggerCharacter: firstTriggerCharacter,
      moreTriggerCharacter: moreTriggerCharacter,
    );
  }

  /// A character on which formatting should be triggered, like `{`.
  final String firstTriggerCharacter;

  /// More trigger characters.
  final List<String>? moreTriggerCharacter;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['firstTriggerCharacter'] = firstTriggerCharacter;
    json['moreTriggerCharacter'] = moreTriggerCharacter;
    return json;
  }
}

/// Struct
/// Provider options for a {@link RenameRequest}.
class RenameOptions implements WorkDoneProgressOptions {
  RenameOptions({
    required this.prepareProvider,
    required this.workDoneProgress,
  });

  factory RenameOptions.fromJson(Map<String, Object?> json) {
    final prepareProviderJson = json['prepareProvider']!;
    final prepareProvider = (prepareProviderJson as bool);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return RenameOptions(
      prepareProvider: prepareProvider,
      workDoneProgress: workDoneProgress,
    );
  }

  /// Renames should be checked and tested before being executed.
  /// @since version 3.12.0
  final bool? prepareProvider;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['prepareProvider'] = prepareProvider;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// The server capabilities of a {@link ExecuteCommandRequest}.
class ExecuteCommandOptions implements WorkDoneProgressOptions {
  ExecuteCommandOptions({
    required this.commands,
    required this.workDoneProgress,
  });

  factory ExecuteCommandOptions.fromJson(Map<String, Object?> json) {
    final commandsJson = json['commands']!;
    final commands = (commandsJson as List<String>);
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return ExecuteCommandOptions(
      commands: commands,
      workDoneProgress: workDoneProgress,
    );
  }

  /// The commands to be executed on the server
  final List<String> commands;

  @override
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['commands'] = commands;
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensLegend implements ToJson {
  SemanticTokensLegend({
    required this.tokenModifiers,
    required this.tokenTypes,
  });

  factory SemanticTokensLegend.fromJson(Map<String, Object?> json) {
    final tokenModifiersJson = json['tokenModifiers']!;
    final tokenModifiers = (tokenModifiersJson as List<String>);
    final tokenTypesJson = json['tokenTypes']!;
    final tokenTypes = (tokenTypesJson as List<String>);

    return SemanticTokensLegend(
      tokenModifiers: tokenModifiers,
      tokenTypes: tokenTypes,
    );
  }

  /// The token modifiers a server uses.
  final List<String> tokenModifiers;

  /// The token types a server uses.
  final List<String> tokenTypes;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['tokenModifiers'] = tokenModifiers;
    json['tokenTypes'] = tokenTypes;
    return json;
  }
}

/// Struct
/// A text document identifier to optionally denote a specific version of a
/// text document.
class OptionalVersionedTextDocumentIdentifier
    implements TextDocumentIdentifier {
  OptionalVersionedTextDocumentIdentifier({
    required this.uri,
    required this.version,
  });

  factory OptionalVersionedTextDocumentIdentifier.fromJson(
    Map<String, Object?> json,
  ) {
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);
    final versionJson = json['version']!;
    final version = (versionJson as OrRefType);

    return OptionalVersionedTextDocumentIdentifier(uri: uri, version: version);
  }

  /// The text document's uri.
  @override
  final Uri uri;

  /// The version number of this document. If a versioned text document
  /// identifier is sent from the server to the client and the file is not
  /// open in the editor (the server has not received an open notification
  /// before) the server can send `null` to indicate that the version is
  /// unknown and the content on disk is the truth (as specified with
  /// document content ownership).
  final OrRefType version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['uri'] = uri;
    json['version'] = version;
    return json;
  }
}

/// Struct
/// A special text edit with an additional change annotation.
/// @since 3.16.0.
class AnnotatedTextEdit implements TextEdit {
  AnnotatedTextEdit({
    required this.annotationId,
    required this.newText,
    required this.range,
  });

  factory AnnotatedTextEdit.fromJson(Map<String, Object?> json) {
    final annotationIdJson = json['annotationId']!;
    final annotationId = (annotationIdJson as ChangeAnnotationIdentifier);
    final newTextJson = json['newText']!;
    final newText = (newTextJson as String);
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));

    return AnnotatedTextEdit(
      annotationId: annotationId,
      newText: newText,
      range: range,
    );
  }

  /// The actual identifier of the change annotation
  final ChangeAnnotationIdentifier annotationId;

  /// The string to be inserted. For delete operations use an empty string.
  @override
  final String newText;

  /// The range of the text document to be manipulated. To insert text into a
  /// document create a range where start === end.
  @override
  final Range range;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['annotationId'] = annotationId;
    json['newText'] = newText;
    json['range'] = range.toJson();
    return json;
  }
}

/// Struct
/// A generic resource operation.
class ResourceOperation implements ToJson {
  ResourceOperation({required this.annotationId, required this.kind});

  factory ResourceOperation.fromJson(Map<String, Object?> json) {
    final annotationIdJson = json['annotationId']!;
    final annotationId = (annotationIdJson as ChangeAnnotationIdentifier);
    final kindJson = json['kind']!;
    final kind = (kindJson as String);

    return ResourceOperation(annotationId: annotationId, kind: kind);
  }

  /// An optional annotation identifier describing the operation.
  /// @since 3.16.0
  final ChangeAnnotationIdentifier? annotationId;

  /// The resource operation kind.
  final String kind;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['annotationId'] = annotationId;
    json['kind'] = kind;
    return json;
  }
}

/// Struct
/// Options to create a file.
class CreateFileOptions implements ToJson {
  CreateFileOptions({required this.ignoreIfExists, required this.overwrite});

  factory CreateFileOptions.fromJson(Map<String, Object?> json) {
    final ignoreIfExistsJson = json['ignoreIfExists']!;
    final ignoreIfExists = (ignoreIfExistsJson as bool);
    final overwriteJson = json['overwrite']!;
    final overwrite = (overwriteJson as bool);

    return CreateFileOptions(
      ignoreIfExists: ignoreIfExists,
      overwrite: overwrite,
    );
  }

  /// Ignore if exists.
  final bool? ignoreIfExists;

  /// Overwrite existing file. Overwrite wins over `ignoreIfExists`
  final bool? overwrite;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['ignoreIfExists'] = ignoreIfExists;
    json['overwrite'] = overwrite;
    return json;
  }
}

/// Struct
/// Rename file options
class RenameFileOptions implements ToJson {
  RenameFileOptions({required this.ignoreIfExists, required this.overwrite});

  factory RenameFileOptions.fromJson(Map<String, Object?> json) {
    final ignoreIfExistsJson = json['ignoreIfExists']!;
    final ignoreIfExists = (ignoreIfExistsJson as bool);
    final overwriteJson = json['overwrite']!;
    final overwrite = (overwriteJson as bool);

    return RenameFileOptions(
      ignoreIfExists: ignoreIfExists,
      overwrite: overwrite,
    );
  }

  /// Ignores if target exists.
  final bool? ignoreIfExists;

  /// Overwrite target if existing. Overwrite wins over `ignoreIfExists`
  final bool? overwrite;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['ignoreIfExists'] = ignoreIfExists;
    json['overwrite'] = overwrite;
    return json;
  }
}

/// Struct
/// Delete file options
class DeleteFileOptions implements ToJson {
  DeleteFileOptions({required this.ignoreIfNotExists, required this.recursive});

  factory DeleteFileOptions.fromJson(Map<String, Object?> json) {
    final ignoreIfNotExistsJson = json['ignoreIfNotExists']!;
    final ignoreIfNotExists = (ignoreIfNotExistsJson as bool);
    final recursiveJson = json['recursive']!;
    final recursive = (recursiveJson as bool);

    return DeleteFileOptions(
      ignoreIfNotExists: ignoreIfNotExists,
      recursive: recursive,
    );
  }

  /// Ignore the operation if the file doesn't exist.
  final bool? ignoreIfNotExists;

  /// Delete the content recursively if a folder is denoted.
  final bool? recursive;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['ignoreIfNotExists'] = ignoreIfNotExists;
    json['recursive'] = recursive;
    return json;
  }
}

/// Struct
/// A pattern to describe in which file operation requests or notifications the
/// server is interested in receiving.
/// @since 3.16.0
class FileOperationPattern implements ToJson {
  FileOperationPattern({
    required this.glob,
    required this.matches,
    required this.options,
  });

  factory FileOperationPattern.fromJson(Map<String, Object?> json) {
    final globJson = json['glob']!;
    final glob = (globJson as String);
    final matchesJson = json['matches']!;
    // Handle enum type
    final matches = _i1.$enumDecode(
      _$FileOperationPatternKindEnumMap,
      matchesJson,
    );
    final optionsJson = json['options']!;
    final options = FileOperationPatternOptions.fromJson(
      (optionsJson as Map<String, Object?>),
    );

    return FileOperationPattern(glob: glob, matches: matches, options: options);
  }

  /// The glob pattern to match. Glob patterns can have the following syntax:
  /// - `*` to match zero or more characters in a path segment - `?` to match
  /// on one character in a path segment - `**` to match any number of path
  /// segments, including none - `{}` to group sub patterns into an OR
  /// expression. (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript
  /// files) - `[]` to declare a range of characters to match in a path
  /// segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
  /// - `[!...]` to negate a range of characters to match in a path segment
  /// (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not
  /// `example.0`)
  final String glob;

  /// Whether to match files or folders with this pattern.
  /// Matches both if undefined.
  final FileOperationPatternKind? matches;

  /// Additional options used during matching.
  final FileOperationPatternOptions? options;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['glob'] = glob;
    json['matches'] = matches?.value;
    json['options'] = options?.toJson();
    return json;
  }
}

/// Struct
/// A full document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
class WorkspaceFullDocumentDiagnosticReport
    implements FullDocumentDiagnosticReport {
  WorkspaceFullDocumentDiagnosticReport({
    required this.items,
    required this.kind,
    required this.resultId,
    required this.uri,
    required this.version,
  });

  factory WorkspaceFullDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) {
    final itemsJson = json['items']!;
    final items = (itemsJson as List<Diagnostic>);
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final resultIdJson = json['resultId']!;
    final resultId = (resultIdJson as String);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);
    final versionJson = json['version']!;
    final version = (versionJson as OrRefType);

    return WorkspaceFullDocumentDiagnosticReport(
      items: items,
      kind: kind,
      resultId: resultId,
      uri: uri,
      version: version,
    );
  }

  /// The actual items.
  @override
  final List<Diagnostic> items;

  /// A full document diagnostic report.
  @override
  final String kind;

  /// An optional result id. If provided it will be sent on the next
  /// diagnostic request for the same document.
  @override
  final String? resultId;

  /// The URI for which diagnostic information is reported.
  final Uri uri;

  /// The version number for which the diagnostics are reported. If the
  /// document is not marked as open `null` can be provided.
  final OrRefType version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['items'] = items;
    json['kind'] = kind;
    json['resultId'] = resultId;
    json['uri'] = uri;
    json['version'] = version;
    return json;
  }
}

/// Struct
/// An unchanged document diagnostic report for a workspace diagnostic result.
/// @since 3.17.0
class WorkspaceUnchangedDocumentDiagnosticReport
    implements UnchangedDocumentDiagnosticReport {
  WorkspaceUnchangedDocumentDiagnosticReport({
    required this.kind,
    required this.resultId,
    required this.uri,
    required this.version,
  });

  factory WorkspaceUnchangedDocumentDiagnosticReport.fromJson(
    Map<String, Object?> json,
  ) {
    final kindJson = json['kind']!;
    final kind = (kindJson as String);
    final resultIdJson = json['resultId']!;
    final resultId = (resultIdJson as String);
    final uriJson = json['uri']!;
    final uri = (uriJson as Uri);
    final versionJson = json['version']!;
    final version = (versionJson as OrRefType);

    return WorkspaceUnchangedDocumentDiagnosticReport(
      kind: kind,
      resultId: resultId,
      uri: uri,
      version: version,
    );
  }

  /// A document diagnostic report indicating no changes to the last result.
  /// A server can only return `unchanged` if result ids are provided.
  @override
  final String kind;

  /// A result id which will be sent on the next diagnostic request for the
  /// same document.
  @override
  final String resultId;

  /// The URI for which diagnostic information is reported.
  final Uri uri;

  /// The version number for which the diagnostics are reported. If the
  /// document is not marked as open `null` can be provided.
  final OrRefType version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['kind'] = kind;
    json['resultId'] = resultId;
    json['uri'] = uri;
    json['version'] = version;
    return json;
  }
}

/// Struct
/// A notebook cell.
/// A cell's document URI must be unique across ALL notebook cells and can
/// therefore be used to uniquely identify a notebook cell or the cell's text
/// document.
/// @since 3.17.0
class NotebookCell implements ToJson {
  NotebookCell({
    required this.document,
    required this.executionSummary,
    required this.kind,
    required this.metadata,
  });

  factory NotebookCell.fromJson(Map<String, Object?> json) {
    final documentJson = json['document']!;
    final document = (documentJson as Uri);
    final executionSummaryJson = json['executionSummary']!;
    final executionSummary = ExecutionSummary.fromJson(
      (executionSummaryJson as Map<String, Object?>),
    );
    final kindJson = json['kind']!;
    // Handle enum type
    final kind = _i1.$enumDecode(_$NotebookCellKindEnumMap, kindJson);
    final metadataJson = json['metadata']!;
    final metadata = (metadataJson as LSPObject);

    return NotebookCell(
      document: document,
      executionSummary: executionSummary,
      kind: kind,
      metadata: metadata,
    );
  }

  /// The URI of the cell's text document content.
  final Uri document;

  /// Additional execution summary information if supported by the client.
  final ExecutionSummary? executionSummary;

  /// The cell's kind
  final NotebookCellKind kind;

  /// Additional metadata stored with the cell.
  /// Note: should always be an object literal (e.g. LSPObject)
  final LSPObject? metadata;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['document'] = document;
    json['executionSummary'] = executionSummary?.toJson();
    json['kind'] = kind.value;
    json['metadata'] = metadata;
    return json;
  }
}

/// Struct
/// A change describing how to move a `NotebookCell` array from state S to S'.
/// @since 3.17.0
class NotebookCellArrayChange implements ToJson {
  NotebookCellArrayChange({
    required this.cells,
    required this.deleteCount,
    required this.start,
  });

  factory NotebookCellArrayChange.fromJson(Map<String, Object?> json) {
    final cellsJson = json['cells']!;
    final cells = (cellsJson as List<NotebookCell>);
    final deleteCountJson = json['deleteCount']!;
    final deleteCount = (deleteCountJson as int);
    final startJson = json['start']!;
    final start = (startJson as int);

    return NotebookCellArrayChange(
      cells: cells,
      deleteCount: deleteCount,
      start: start,
    );
  }

  /// The new cells, if any
  final List<NotebookCell>? cells;

  /// The deleted cells
  final int deleteCount;

  /// The start oftest of the cell that changed.
  final int start;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['cells'] = cells;
    json['deleteCount'] = deleteCount;
    json['start'] = start;
    return json;
  }
}

/// Struct
/// Describes the currently selected completion item.
/// @since 3.18.0 @proposed
class SelectedCompletionInfo implements ToJson {
  SelectedCompletionInfo({required this.range, required this.text});

  factory SelectedCompletionInfo.fromJson(Map<String, Object?> json) {
    final rangeJson = json['range']!;
    final range = Range.fromJson((rangeJson as Map<String, Object?>));
    final textJson = json['text']!;
    final text = (textJson as String);

    return SelectedCompletionInfo(range: range, text: text);
  }

  /// The range that will be replaced if this completion item is accepted.
  final Range range;

  /// The text the range will be replaced with if this completion is accepted.
  final String text;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['range'] = range.toJson();
    json['text'] = text;
    return json;
  }
}

/// Struct
/// Defines the capabilities provided by the client.
class ClientCapabilities implements ToJson {
  ClientCapabilities({
    required this.experimental,
    required this.general,
    required this.notebookDocument,
    required this.textDocument,
    required this.window,
    required this.workspace,
  });

  factory ClientCapabilities.fromJson(Map<String, Object?> json) {
    final experimentalJson = json['experimental']!;
    final experimental = (experimentalJson as LSPAny);
    final generalJson = json['general']!;
    final general = GeneralClientCapabilities.fromJson(
      (generalJson as Map<String, Object?>),
    );
    final notebookDocumentJson = json['notebookDocument']!;
    final notebookDocument = NotebookDocumentClientCapabilities.fromJson(
      (notebookDocumentJson as Map<String, Object?>),
    );
    final textDocumentJson = json['textDocument']!;
    final textDocument = TextDocumentClientCapabilities.fromJson(
      (textDocumentJson as Map<String, Object?>),
    );
    final windowJson = json['window']!;
    final window = WindowClientCapabilities.fromJson(
      (windowJson as Map<String, Object?>),
    );
    final workspaceJson = json['workspace']!;
    final workspace = WorkspaceClientCapabilities.fromJson(
      (workspaceJson as Map<String, Object?>),
    );

    return ClientCapabilities(
      experimental: experimental,
      general: general,
      notebookDocument: notebookDocument,
      textDocument: textDocument,
      window: window,
      workspace: workspace,
    );
  }

  /// Experimental client capabilities.
  final LSPAny? experimental;

  /// General client capabilities.
  /// @since 3.16.0
  final GeneralClientCapabilities? general;

  /// Capabilities specific to the notebook document support.
  /// @since 3.17.0
  final NotebookDocumentClientCapabilities? notebookDocument;

  /// Text document specific client capabilities.
  final TextDocumentClientCapabilities? textDocument;

  /// Window specific client capabilities.
  final WindowClientCapabilities? window;

  /// Workspace specific client capabilities.
  final WorkspaceClientCapabilities? workspace;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['experimental'] = experimental;
    json['general'] = general?.toJson();
    json['notebookDocument'] = notebookDocument?.toJson();
    json['textDocument'] = textDocument?.toJson();
    json['window'] = window?.toJson();
    json['workspace'] = workspace?.toJson();
    return json;
  }
}

/// Struct
class TextDocumentSyncOptions implements ToJson {
  TextDocumentSyncOptions({
    required this.change,
    required this.openClose,
    required this.save,
    required this.willSave,
    required this.willSaveWaitUntil,
  });

  factory TextDocumentSyncOptions.fromJson(Map<String, Object?> json) {
    final changeJson = json['change']!;
    // Handle enum type
    final change = _i1.$enumDecode(_$TextDocumentSyncKindEnumMap, changeJson);
    final openCloseJson = json['openClose']!;
    final openClose = (openCloseJson as bool);
    final saveJson = json['save']!;
    final save = (saveJson as OrRefType);
    final willSaveJson = json['willSave']!;
    final willSave = (willSaveJson as bool);
    final willSaveWaitUntilJson = json['willSaveWaitUntil']!;
    final willSaveWaitUntil = (willSaveWaitUntilJson as bool);

    return TextDocumentSyncOptions(
      change: change,
      openClose: openClose,
      save: save,
      willSave: willSave,
      willSaveWaitUntil: willSaveWaitUntil,
    );
  }

  /// Change notifications are sent to the server. See
  /// TextDocumentSyncKind.None, TextDocumentSyncKind.Full and
  /// TextDocumentSyncKind.Incremental. If omitted it defaults to
  /// TextDocumentSyncKind.None.
  final TextDocumentSyncKind? change;

  /// Open and close notifications are sent to the server. If omitted open
  /// close notification should not be sent.
  final bool? openClose;

  /// If present save notifications are sent to the server. If omitted the
  /// notification should not be sent.
  final OrRefType? save;

  /// If present will save notifications are sent to the server. If omitted
  /// the notification should not be sent.
  final bool? willSave;

  /// If present will save wait until requests are sent to the server. If
  /// omitted the request should not be sent.
  final bool? willSaveWaitUntil;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['change'] = change?.value;
    json['openClose'] = openClose;
    json['save'] = save;
    json['willSave'] = willSave;
    json['willSaveWaitUntil'] = willSaveWaitUntil;
    return json;
  }
}

/// Struct
/// Options specific to a notebook plus its cells to be synced to the server.
/// If a selector provides a notebook document filter but no cell selector all
/// cells of a matching notebook document will be synced.
/// If a selector provides no notebook document filter but only a cell selector
/// all notebook document that contain at least one matching cell will be
/// synced.
/// @since 3.17.0
class NotebookDocumentSyncOptions implements ToJson {
  NotebookDocumentSyncOptions({
    required this.notebookSelector,
    required this.save,
  });

  factory NotebookDocumentSyncOptions.fromJson(Map<String, Object?> json) {
    final notebookSelectorJson = json['notebookSelector']!;
    final notebookSelector = (notebookSelectorJson as List<OrRefType>);
    final saveJson = json['save']!;
    final save = (saveJson as bool);

    return NotebookDocumentSyncOptions(
      notebookSelector: notebookSelector,
      save: save,
    );
  }

  /// The notebooks to be synced
  final List<OrRefType> notebookSelector;

  /// Whether save notification should be forwarded to the server. Will only
  /// be honored if mode === `notebook`.
  final bool? save;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['notebookSelector'] = notebookSelector;
    json['save'] = save;
    return json;
  }
}

/// Struct
/// Registration options specific to a notebook.
/// @since 3.17.0
class NotebookDocumentSyncRegistrationOptions
    implements NotebookDocumentSyncOptions, StaticRegistrationOptions {
  NotebookDocumentSyncRegistrationOptions({
    required this.id,
    required this.notebookSelector,
    required this.save,
  });

  factory NotebookDocumentSyncRegistrationOptions.fromJson(
    Map<String, Object?> json,
  ) {
    final idJson = json['id']!;
    final id = (idJson as String);
    final notebookSelectorJson = json['notebookSelector']!;
    final notebookSelector = (notebookSelectorJson as List<OrRefType>);
    final saveJson = json['save']!;
    final save = (saveJson as bool);

    return NotebookDocumentSyncRegistrationOptions(
      id: id,
      notebookSelector: notebookSelector,
      save: save,
    );
  }

  /// The id used to register the request. The id can be used to deregister
  /// the request again. See also Registration#id.
  @override
  final String? id;

  /// The notebooks to be synced
  @override
  final List<OrRefType> notebookSelector;

  /// Whether save notification should be forwarded to the server. Will only
  /// be honored if mode === `notebook`.
  @override
  final bool? save;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['id'] = id;
    json['notebookSelector'] = notebookSelector;
    json['save'] = save;
    return json;
  }
}

/// Struct
class WorkspaceFoldersServerCapabilities implements ToJson {
  WorkspaceFoldersServerCapabilities({
    required this.changeNotifications,
    required this.supported,
  });

  factory WorkspaceFoldersServerCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final changeNotificationsJson = json['changeNotifications']!;
    final changeNotifications = (changeNotificationsJson as OrRefType);
    final supportedJson = json['supported']!;
    final supported = (supportedJson as bool);

    return WorkspaceFoldersServerCapabilities(
      changeNotifications: changeNotifications,
      supported: supported,
    );
  }

  /// Whether the server wants to receive workspace folder change
  /// notifications.
  /// If a string is provided the string is treated as an ID under which the
  /// notification is registered on the client side. The ID can be used to
  /// unregister for these events using the `client/unregisterCapability`
  /// request.
  final OrRefType? changeNotifications;

  /// The server has support for workspace folders
  final bool? supported;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['changeNotifications'] = changeNotifications;
    json['supported'] = supported;
    return json;
  }
}

/// Struct
/// Options for notifications/requests for user operations on files.
/// @since 3.16.0
class FileOperationOptions implements ToJson {
  FileOperationOptions({
    required this.didCreate,
    required this.didDelete,
    required this.didRename,
    required this.willCreate,
    required this.willDelete,
    required this.willRename,
  });

  factory FileOperationOptions.fromJson(Map<String, Object?> json) {
    final didCreateJson = json['didCreate']!;
    final didCreate = FileOperationRegistrationOptions.fromJson(
      (didCreateJson as Map<String, Object?>),
    );
    final didDeleteJson = json['didDelete']!;
    final didDelete = FileOperationRegistrationOptions.fromJson(
      (didDeleteJson as Map<String, Object?>),
    );
    final didRenameJson = json['didRename']!;
    final didRename = FileOperationRegistrationOptions.fromJson(
      (didRenameJson as Map<String, Object?>),
    );
    final willCreateJson = json['willCreate']!;
    final willCreate = FileOperationRegistrationOptions.fromJson(
      (willCreateJson as Map<String, Object?>),
    );
    final willDeleteJson = json['willDelete']!;
    final willDelete = FileOperationRegistrationOptions.fromJson(
      (willDeleteJson as Map<String, Object?>),
    );
    final willRenameJson = json['willRename']!;
    final willRename = FileOperationRegistrationOptions.fromJson(
      (willRenameJson as Map<String, Object?>),
    );

    return FileOperationOptions(
      didCreate: didCreate,
      didDelete: didDelete,
      didRename: didRename,
      willCreate: willCreate,
      willDelete: willDelete,
      willRename: willRename,
    );
  }

  /// The server is interested in receiving didCreateFiles notifications.
  final FileOperationRegistrationOptions? didCreate;

  /// The server is interested in receiving didDeleteFiles file notifications.
  final FileOperationRegistrationOptions? didDelete;

  /// The server is interested in receiving didRenameFiles notifications.
  final FileOperationRegistrationOptions? didRename;

  /// The server is interested in receiving willCreateFiles requests.
  final FileOperationRegistrationOptions? willCreate;

  /// The server is interested in receiving willDeleteFiles file requests.
  final FileOperationRegistrationOptions? willDelete;

  /// The server is interested in receiving willRenameFiles requests.
  final FileOperationRegistrationOptions? willRename;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['didCreate'] = didCreate?.toJson();
    json['didDelete'] = didDelete?.toJson();
    json['didRename'] = didRename?.toJson();
    json['willCreate'] = willCreate?.toJson();
    json['willDelete'] = willDelete?.toJson();
    json['willRename'] = willRename?.toJson();
    return json;
  }
}

/// Struct
/// Structure to capture a description for an error code.
/// @since 3.16.0
class CodeDescription implements ToJson {
  CodeDescription({required this.href});

  factory CodeDescription.fromJson(Map<String, Object?> json) {
    final hrefJson = json['href']!;
    final href = (hrefJson as Uri);

    return CodeDescription(href: href);
  }

  /// An URI to open with more information about the diagnostic error.
  final Uri href;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['href'] = href;
    return json;
  }
}

/// Struct
/// Represents a related message and source code location for a diagnostic.
/// This should be used to point to code locations that cause or related to a
/// diagnostics, e.g when duplicating a symbol in a scope.
class DiagnosticRelatedInformation implements ToJson {
  DiagnosticRelatedInformation({required this.location, required this.message});

  factory DiagnosticRelatedInformation.fromJson(Map<String, Object?> json) {
    final locationJson = json['location']!;
    final location = Location.fromJson((locationJson as Map<String, Object?>));
    final messageJson = json['message']!;
    final message = (messageJson as String);

    return DiagnosticRelatedInformation(location: location, message: message);
  }

  /// The location of this related diagnostic information.
  final Location location;

  /// The message of this related diagnostic information.
  final String message;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['location'] = location.toJson();
    json['message'] = message;
    return json;
  }
}

/// Struct
/// Represents a parameter of a callable-signature. A parameter can have a
/// label and a doc-comment.
class ParameterInformation implements ToJson {
  ParameterInformation({required this.documentation, required this.label});

  factory ParameterInformation.fromJson(Map<String, Object?> json) {
    final documentationJson = json['documentation']!;
    final documentation = (documentationJson as OrRefType);
    final labelJson = json['label']!;
    final label = (labelJson as OrRefType);

    return ParameterInformation(documentation: documentation, label: label);
  }

  /// The human-readable doc-comment of this parameter. Will be shown in the
  /// UI but can be omitted.
  final OrRefType? documentation;

  /// The label of this parameter information.
  /// Either a string or an inclusive start and exclusive end offsets within
  /// its containing signature label. (see SignatureInformation.label). The
  /// offsets are based on a UTF-16 string representation as `Position` and
  /// `Range` does.
  /// *Note*: a label of type string should be a substring of its containing
  /// signature label. Its intended use case is to highlight the parameter
  /// label part in the `SignatureInformation.label`.
  final OrRefType label;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentation'] = documentation;
    json['label'] = label;
    return json;
  }
}

/// Struct
/// A notebook cell text document filter denotes a cell text document by
/// different properties.
/// @since 3.17.0
class NotebookCellTextDocumentFilter implements ToJson {
  NotebookCellTextDocumentFilter({
    required this.language,
    required this.notebook,
  });

  factory NotebookCellTextDocumentFilter.fromJson(Map<String, Object?> json) {
    final languageJson = json['language']!;
    final language = (languageJson as String);
    final notebookJson = json['notebook']!;
    final notebook = (notebookJson as OrRefType);

    return NotebookCellTextDocumentFilter(
      language: language,
      notebook: notebook,
    );
  }

  /// A language id like `python`.
  /// Will be matched against the language id of the notebook cell document.
  /// '*' matches every language.
  final String? language;

  /// A filter that matches against the notebook containing the notebook
  /// cell. If a string value is provided it matches against the notebook
  /// type. '*' matches every notebook.
  final OrRefType notebook;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['language'] = language;
    json['notebook'] = notebook;
    return json;
  }
}

/// Struct
/// Matching options for the file operation pattern.
/// @since 3.16.0
class FileOperationPatternOptions implements ToJson {
  FileOperationPatternOptions({required this.ignoreCase});

  factory FileOperationPatternOptions.fromJson(Map<String, Object?> json) {
    final ignoreCaseJson = json['ignoreCase']!;
    final ignoreCase = (ignoreCaseJson as bool);

    return FileOperationPatternOptions(ignoreCase: ignoreCase);
  }

  /// The pattern should be matched ignoring casing.
  final bool? ignoreCase;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['ignoreCase'] = ignoreCase;
    return json;
  }
}

/// Struct
class ExecutionSummary implements ToJson {
  ExecutionSummary({required this.executionOrder, required this.success});

  factory ExecutionSummary.fromJson(Map<String, Object?> json) {
    final executionOrderJson = json['executionOrder']!;
    final executionOrder = (executionOrderJson as int);
    final successJson = json['success']!;
    final success = (successJson as bool);

    return ExecutionSummary(executionOrder: executionOrder, success: success);
  }

  /// A strict monotonically increasing value indicating the execution order
  /// of a cell inside a notebook.
  final int executionOrder;

  /// Whether the execution was successful or not if known by the client.
  final bool? success;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['executionOrder'] = executionOrder;
    json['success'] = success;
    return json;
  }
}

/// Struct
/// Workspace specific client capabilities.
class WorkspaceClientCapabilities implements ToJson {
  WorkspaceClientCapabilities({
    required this.applyEdit,
    required this.codeLens,
    required this.configuration,
    required this.diagnostics,
    required this.didChangeConfiguration,
    required this.didChangeWatchedFiles,
    required this.executeCommand,
    required this.fileOperations,
    required this.foldingRange,
    required this.inlayHint,
    required this.inlineValue,
    required this.semanticTokens,
    required this.symbol,
    required this.workspaceEdit,
    required this.workspaceFolders,
  });

  factory WorkspaceClientCapabilities.fromJson(Map<String, Object?> json) {
    final applyEditJson = json['applyEdit']!;
    final applyEdit = (applyEditJson as bool);
    final codeLensJson = json['codeLens']!;
    final codeLens = CodeLensWorkspaceClientCapabilities.fromJson(
      (codeLensJson as Map<String, Object?>),
    );
    final configurationJson = json['configuration']!;
    final configuration = (configurationJson as bool);
    final diagnosticsJson = json['diagnostics']!;
    final diagnostics = DiagnosticWorkspaceClientCapabilities.fromJson(
      (diagnosticsJson as Map<String, Object?>),
    );
    final didChangeConfigurationJson = json['didChangeConfiguration']!;
    final didChangeConfiguration =
        DidChangeConfigurationClientCapabilities.fromJson(
          (didChangeConfigurationJson as Map<String, Object?>),
        );
    final didChangeWatchedFilesJson = json['didChangeWatchedFiles']!;
    final didChangeWatchedFiles =
        DidChangeWatchedFilesClientCapabilities.fromJson(
          (didChangeWatchedFilesJson as Map<String, Object?>),
        );
    final executeCommandJson = json['executeCommand']!;
    final executeCommand = ExecuteCommandClientCapabilities.fromJson(
      (executeCommandJson as Map<String, Object?>),
    );
    final fileOperationsJson = json['fileOperations']!;
    final fileOperations = FileOperationClientCapabilities.fromJson(
      (fileOperationsJson as Map<String, Object?>),
    );
    final foldingRangeJson = json['foldingRange']!;
    final foldingRange = FoldingRangeWorkspaceClientCapabilities.fromJson(
      (foldingRangeJson as Map<String, Object?>),
    );
    final inlayHintJson = json['inlayHint']!;
    final inlayHint = InlayHintWorkspaceClientCapabilities.fromJson(
      (inlayHintJson as Map<String, Object?>),
    );
    final inlineValueJson = json['inlineValue']!;
    final inlineValue = InlineValueWorkspaceClientCapabilities.fromJson(
      (inlineValueJson as Map<String, Object?>),
    );
    final semanticTokensJson = json['semanticTokens']!;
    final semanticTokens = SemanticTokensWorkspaceClientCapabilities.fromJson(
      (semanticTokensJson as Map<String, Object?>),
    );
    final symbolJson = json['symbol']!;
    final symbol = WorkspaceSymbolClientCapabilities.fromJson(
      (symbolJson as Map<String, Object?>),
    );
    final workspaceEditJson = json['workspaceEdit']!;
    final workspaceEdit = WorkspaceEditClientCapabilities.fromJson(
      (workspaceEditJson as Map<String, Object?>),
    );
    final workspaceFoldersJson = json['workspaceFolders']!;
    final workspaceFolders = (workspaceFoldersJson as bool);

    return WorkspaceClientCapabilities(
      applyEdit: applyEdit,
      codeLens: codeLens,
      configuration: configuration,
      diagnostics: diagnostics,
      didChangeConfiguration: didChangeConfiguration,
      didChangeWatchedFiles: didChangeWatchedFiles,
      executeCommand: executeCommand,
      fileOperations: fileOperations,
      foldingRange: foldingRange,
      inlayHint: inlayHint,
      inlineValue: inlineValue,
      semanticTokens: semanticTokens,
      symbol: symbol,
      workspaceEdit: workspaceEdit,
      workspaceFolders: workspaceFolders,
    );
  }

  /// The client supports applying batch edits to the workspace by supporting
  /// the request 'workspace/applyEdit'
  final bool? applyEdit;

  /// Capabilities specific to the code lens requests scoped to the workspace.
  /// @since 3.16.0.
  final CodeLensWorkspaceClientCapabilities? codeLens;

  /// The client supports `workspace/configuration` requests.
  /// @since 3.6.0
  final bool? configuration;

  /// Capabilities specific to the diagnostic requests scoped to the
  /// workspace.
  /// @since 3.17.0.
  final DiagnosticWorkspaceClientCapabilities? diagnostics;

  /// Capabilities specific to the `workspace/didChangeConfiguration`
  /// notification.
  final DidChangeConfigurationClientCapabilities? didChangeConfiguration;

  /// Capabilities specific to the `workspace/didChangeWatchedFiles`
  /// notification.
  final DidChangeWatchedFilesClientCapabilities? didChangeWatchedFiles;

  /// Capabilities specific to the `workspace/executeCommand` request.
  final ExecuteCommandClientCapabilities? executeCommand;

  /// The client has support for file notifications/requests for user
  /// operations on files.
  /// Since 3.16.0
  final FileOperationClientCapabilities? fileOperations;

  /// Capabilities specific to the folding range requests scoped to the
  /// workspace.
  /// @since 3.18.0 @proposed
  final FoldingRangeWorkspaceClientCapabilities? foldingRange;

  /// Capabilities specific to the inlay hint requests scoped to the
  /// workspace.
  /// @since 3.17.0.
  final InlayHintWorkspaceClientCapabilities? inlayHint;

  /// Capabilities specific to the inline values requests scoped to the
  /// workspace.
  /// @since 3.17.0.
  final InlineValueWorkspaceClientCapabilities? inlineValue;

  /// Capabilities specific to the semantic token requests scoped to the
  /// workspace.
  /// @since 3.16.0.
  final SemanticTokensWorkspaceClientCapabilities? semanticTokens;

  /// Capabilities specific to the `workspace/symbol` request.
  final WorkspaceSymbolClientCapabilities? symbol;

  /// Capabilities specific to `WorkspaceEdit`s.
  final WorkspaceEditClientCapabilities? workspaceEdit;

  /// The client has support for workspace folders.
  /// @since 3.6.0
  final bool? workspaceFolders;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['applyEdit'] = applyEdit;
    json['codeLens'] = codeLens?.toJson();
    json['configuration'] = configuration;
    json['diagnostics'] = diagnostics?.toJson();
    json['didChangeConfiguration'] = didChangeConfiguration?.toJson();
    json['didChangeWatchedFiles'] = didChangeWatchedFiles?.toJson();
    json['executeCommand'] = executeCommand?.toJson();
    json['fileOperations'] = fileOperations?.toJson();
    json['foldingRange'] = foldingRange?.toJson();
    json['inlayHint'] = inlayHint?.toJson();
    json['inlineValue'] = inlineValue?.toJson();
    json['semanticTokens'] = semanticTokens?.toJson();
    json['symbol'] = symbol?.toJson();
    json['workspaceEdit'] = workspaceEdit?.toJson();
    json['workspaceFolders'] = workspaceFolders;
    return json;
  }
}

/// Struct
/// Text document specific client capabilities.
class TextDocumentClientCapabilities implements ToJson {
  TextDocumentClientCapabilities({
    required this.callHierarchy,
    required this.codeAction,
    required this.codeLens,
    required this.colorProvider,
    required this.completion,
    required this.declaration,
    required this.definition,
    required this.diagnostic,
    required this.documentHighlight,
    required this.documentLink,
    required this.documentSymbol,
    required this.foldingRange,
    required this.formatting,
    required this.hover,
    required this.implementation,
    required this.inlayHint,
    required this.inlineCompletion,
    required this.inlineValue,
    required this.linkedEditingRange,
    required this.moniker,
    required this.onTypeFormatting,
    required this.publishDiagnostics,
    required this.rangeFormatting,
    required this.references,
    required this.rename,
    required this.selectionRange,
    required this.semanticTokens,
    required this.signatureHelp,
    required this.synchronization,
    required this.typeDefinition,
    required this.typeHierarchy,
  });

  factory TextDocumentClientCapabilities.fromJson(Map<String, Object?> json) {
    final callHierarchyJson = json['callHierarchy']!;
    final callHierarchy = CallHierarchyClientCapabilities.fromJson(
      (callHierarchyJson as Map<String, Object?>),
    );
    final codeActionJson = json['codeAction']!;
    final codeAction = CodeActionClientCapabilities.fromJson(
      (codeActionJson as Map<String, Object?>),
    );
    final codeLensJson = json['codeLens']!;
    final codeLens = CodeLensClientCapabilities.fromJson(
      (codeLensJson as Map<String, Object?>),
    );
    final colorProviderJson = json['colorProvider']!;
    final colorProvider = DocumentColorClientCapabilities.fromJson(
      (colorProviderJson as Map<String, Object?>),
    );
    final completionJson = json['completion']!;
    final completion = CompletionClientCapabilities.fromJson(
      (completionJson as Map<String, Object?>),
    );
    final declarationJson = json['declaration']!;
    final declaration = DeclarationClientCapabilities.fromJson(
      (declarationJson as Map<String, Object?>),
    );
    final definitionJson = json['definition']!;
    final definition = DefinitionClientCapabilities.fromJson(
      (definitionJson as Map<String, Object?>),
    );
    final diagnosticJson = json['diagnostic']!;
    final diagnostic = DiagnosticClientCapabilities.fromJson(
      (diagnosticJson as Map<String, Object?>),
    );
    final documentHighlightJson = json['documentHighlight']!;
    final documentHighlight = DocumentHighlightClientCapabilities.fromJson(
      (documentHighlightJson as Map<String, Object?>),
    );
    final documentLinkJson = json['documentLink']!;
    final documentLink = DocumentLinkClientCapabilities.fromJson(
      (documentLinkJson as Map<String, Object?>),
    );
    final documentSymbolJson = json['documentSymbol']!;
    final documentSymbol = DocumentSymbolClientCapabilities.fromJson(
      (documentSymbolJson as Map<String, Object?>),
    );
    final foldingRangeJson = json['foldingRange']!;
    final foldingRange = FoldingRangeClientCapabilities.fromJson(
      (foldingRangeJson as Map<String, Object?>),
    );
    final formattingJson = json['formatting']!;
    final formatting = DocumentFormattingClientCapabilities.fromJson(
      (formattingJson as Map<String, Object?>),
    );
    final hoverJson = json['hover']!;
    final hover = HoverClientCapabilities.fromJson(
      (hoverJson as Map<String, Object?>),
    );
    final implementationJson = json['implementation']!;
    final implementation = ImplementationClientCapabilities.fromJson(
      (implementationJson as Map<String, Object?>),
    );
    final inlayHintJson = json['inlayHint']!;
    final inlayHint = InlayHintClientCapabilities.fromJson(
      (inlayHintJson as Map<String, Object?>),
    );
    final inlineCompletionJson = json['inlineCompletion']!;
    final inlineCompletion = InlineCompletionClientCapabilities.fromJson(
      (inlineCompletionJson as Map<String, Object?>),
    );
    final inlineValueJson = json['inlineValue']!;
    final inlineValue = InlineValueClientCapabilities.fromJson(
      (inlineValueJson as Map<String, Object?>),
    );
    final linkedEditingRangeJson = json['linkedEditingRange']!;
    final linkedEditingRange = LinkedEditingRangeClientCapabilities.fromJson(
      (linkedEditingRangeJson as Map<String, Object?>),
    );
    final monikerJson = json['moniker']!;
    final moniker = MonikerClientCapabilities.fromJson(
      (monikerJson as Map<String, Object?>),
    );
    final onTypeFormattingJson = json['onTypeFormatting']!;
    final onTypeFormatting =
        DocumentOnTypeFormattingClientCapabilities.fromJson(
          (onTypeFormattingJson as Map<String, Object?>),
        );
    final publishDiagnosticsJson = json['publishDiagnostics']!;
    final publishDiagnostics = PublishDiagnosticsClientCapabilities.fromJson(
      (publishDiagnosticsJson as Map<String, Object?>),
    );
    final rangeFormattingJson = json['rangeFormatting']!;
    final rangeFormatting = DocumentRangeFormattingClientCapabilities.fromJson(
      (rangeFormattingJson as Map<String, Object?>),
    );
    final referencesJson = json['references']!;
    final references = ReferenceClientCapabilities.fromJson(
      (referencesJson as Map<String, Object?>),
    );
    final renameJson = json['rename']!;
    final rename = RenameClientCapabilities.fromJson(
      (renameJson as Map<String, Object?>),
    );
    final selectionRangeJson = json['selectionRange']!;
    final selectionRange = SelectionRangeClientCapabilities.fromJson(
      (selectionRangeJson as Map<String, Object?>),
    );
    final semanticTokensJson = json['semanticTokens']!;
    final semanticTokens = SemanticTokensClientCapabilities.fromJson(
      (semanticTokensJson as Map<String, Object?>),
    );
    final signatureHelpJson = json['signatureHelp']!;
    final signatureHelp = SignatureHelpClientCapabilities.fromJson(
      (signatureHelpJson as Map<String, Object?>),
    );
    final synchronizationJson = json['synchronization']!;
    final synchronization = TextDocumentSyncClientCapabilities.fromJson(
      (synchronizationJson as Map<String, Object?>),
    );
    final typeDefinitionJson = json['typeDefinition']!;
    final typeDefinition = TypeDefinitionClientCapabilities.fromJson(
      (typeDefinitionJson as Map<String, Object?>),
    );
    final typeHierarchyJson = json['typeHierarchy']!;
    final typeHierarchy = TypeHierarchyClientCapabilities.fromJson(
      (typeHierarchyJson as Map<String, Object?>),
    );

    return TextDocumentClientCapabilities(
      callHierarchy: callHierarchy,
      codeAction: codeAction,
      codeLens: codeLens,
      colorProvider: colorProvider,
      completion: completion,
      declaration: declaration,
      definition: definition,
      diagnostic: diagnostic,
      documentHighlight: documentHighlight,
      documentLink: documentLink,
      documentSymbol: documentSymbol,
      foldingRange: foldingRange,
      formatting: formatting,
      hover: hover,
      implementation: implementation,
      inlayHint: inlayHint,
      inlineCompletion: inlineCompletion,
      inlineValue: inlineValue,
      linkedEditingRange: linkedEditingRange,
      moniker: moniker,
      onTypeFormatting: onTypeFormatting,
      publishDiagnostics: publishDiagnostics,
      rangeFormatting: rangeFormatting,
      references: references,
      rename: rename,
      selectionRange: selectionRange,
      semanticTokens: semanticTokens,
      signatureHelp: signatureHelp,
      synchronization: synchronization,
      typeDefinition: typeDefinition,
      typeHierarchy: typeHierarchy,
    );
  }

  /// Capabilities specific to the various call hierarchy requests.
  /// @since 3.16.0
  final CallHierarchyClientCapabilities? callHierarchy;

  /// Capabilities specific to the `textDocument/codeAction` request.
  final CodeActionClientCapabilities? codeAction;

  /// Capabilities specific to the `textDocument/codeLens` request.
  final CodeLensClientCapabilities? codeLens;

  /// Capabilities specific to the `textDocument/documentColor` and the
  /// `textDocument/colorPresentation` request.
  /// @since 3.6.0
  final DocumentColorClientCapabilities? colorProvider;

  /// Capabilities specific to the `textDocument/completion` request.
  final CompletionClientCapabilities? completion;

  /// Capabilities specific to the `textDocument/declaration` request.
  /// @since 3.14.0
  final DeclarationClientCapabilities? declaration;

  /// Capabilities specific to the `textDocument/definition` request.
  final DefinitionClientCapabilities? definition;

  /// Capabilities specific to the diagnostic pull model.
  /// @since 3.17.0
  final DiagnosticClientCapabilities? diagnostic;

  /// Capabilities specific to the `textDocument/documentHighlight` request.
  final DocumentHighlightClientCapabilities? documentHighlight;

  /// Capabilities specific to the `textDocument/documentLink` request.
  final DocumentLinkClientCapabilities? documentLink;

  /// Capabilities specific to the `textDocument/documentSymbol` request.
  final DocumentSymbolClientCapabilities? documentSymbol;

  /// Capabilities specific to the `textDocument/foldingRange` request.
  /// @since 3.10.0
  final FoldingRangeClientCapabilities? foldingRange;

  /// Capabilities specific to the `textDocument/formatting` request.
  final DocumentFormattingClientCapabilities? formatting;

  /// Capabilities specific to the `textDocument/hover` request.
  final HoverClientCapabilities? hover;

  /// Capabilities specific to the `textDocument/implementation` request.
  /// @since 3.6.0
  final ImplementationClientCapabilities? implementation;

  /// Capabilities specific to the `textDocument/inlayHint` request.
  /// @since 3.17.0
  final InlayHintClientCapabilities? inlayHint;

  /// Client capabilities specific to inline completions.
  /// @since 3.18.0 @proposed
  final InlineCompletionClientCapabilities? inlineCompletion;

  /// Capabilities specific to the `textDocument/inlineValue` request.
  /// @since 3.17.0
  final InlineValueClientCapabilities? inlineValue;

  /// Capabilities specific to the `textDocument/linkedEditingRange` request.
  /// @since 3.16.0
  final LinkedEditingRangeClientCapabilities? linkedEditingRange;

  /// Client capabilities specific to the `textDocument/moniker` request.
  /// @since 3.16.0
  final MonikerClientCapabilities? moniker;

  /// Capabilities specific to the `textDocument/onTypeFormatting` request.
  final DocumentOnTypeFormattingClientCapabilities? onTypeFormatting;

  /// Capabilities specific to the `textDocument/publishDiagnostics`
  /// notification.
  final PublishDiagnosticsClientCapabilities? publishDiagnostics;

  /// Capabilities specific to the `textDocument/rangeFormatting` request.
  final DocumentRangeFormattingClientCapabilities? rangeFormatting;

  /// Capabilities specific to the `textDocument/references` request.
  final ReferenceClientCapabilities? references;

  /// Capabilities specific to the `textDocument/rename` request.
  final RenameClientCapabilities? rename;

  /// Capabilities specific to the `textDocument/selectionRange` request.
  /// @since 3.15.0
  final SelectionRangeClientCapabilities? selectionRange;

  /// Capabilities specific to the various semantic token request.
  /// @since 3.16.0
  final SemanticTokensClientCapabilities? semanticTokens;

  /// Capabilities specific to the `textDocument/signatureHelp` request.
  final SignatureHelpClientCapabilities? signatureHelp;

  /// Defines which synchronization capabilities the client supports.
  final TextDocumentSyncClientCapabilities? synchronization;

  /// Capabilities specific to the `textDocument/typeDefinition` request.
  /// @since 3.6.0
  final TypeDefinitionClientCapabilities? typeDefinition;

  /// Capabilities specific to the various type hierarchy requests.
  /// @since 3.17.0
  final TypeHierarchyClientCapabilities? typeHierarchy;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['callHierarchy'] = callHierarchy?.toJson();
    json['codeAction'] = codeAction?.toJson();
    json['codeLens'] = codeLens?.toJson();
    json['colorProvider'] = colorProvider?.toJson();
    json['completion'] = completion?.toJson();
    json['declaration'] = declaration?.toJson();
    json['definition'] = definition?.toJson();
    json['diagnostic'] = diagnostic?.toJson();
    json['documentHighlight'] = documentHighlight?.toJson();
    json['documentLink'] = documentLink?.toJson();
    json['documentSymbol'] = documentSymbol?.toJson();
    json['foldingRange'] = foldingRange?.toJson();
    json['formatting'] = formatting?.toJson();
    json['hover'] = hover?.toJson();
    json['implementation'] = implementation?.toJson();
    json['inlayHint'] = inlayHint?.toJson();
    json['inlineCompletion'] = inlineCompletion?.toJson();
    json['inlineValue'] = inlineValue?.toJson();
    json['linkedEditingRange'] = linkedEditingRange?.toJson();
    json['moniker'] = moniker?.toJson();
    json['onTypeFormatting'] = onTypeFormatting?.toJson();
    json['publishDiagnostics'] = publishDiagnostics?.toJson();
    json['rangeFormatting'] = rangeFormatting?.toJson();
    json['references'] = references?.toJson();
    json['rename'] = rename?.toJson();
    json['selectionRange'] = selectionRange?.toJson();
    json['semanticTokens'] = semanticTokens?.toJson();
    json['signatureHelp'] = signatureHelp?.toJson();
    json['synchronization'] = synchronization?.toJson();
    json['typeDefinition'] = typeDefinition?.toJson();
    json['typeHierarchy'] = typeHierarchy?.toJson();
    return json;
  }
}

/// Struct
/// Capabilities specific to the notebook document support.
/// @since 3.17.0
class NotebookDocumentClientCapabilities implements ToJson {
  NotebookDocumentClientCapabilities({required this.synchronization});

  factory NotebookDocumentClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final synchronizationJson = json['synchronization']!;
    final synchronization = NotebookDocumentSyncClientCapabilities.fromJson(
      (synchronizationJson as Map<String, Object?>),
    );

    return NotebookDocumentClientCapabilities(synchronization: synchronization);
  }

  /// Capabilities specific to notebook document synchronization
  /// @since 3.17.0
  final NotebookDocumentSyncClientCapabilities synchronization;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['synchronization'] = synchronization.toJson();
    return json;
  }
}

/// Struct
class WindowClientCapabilities implements ToJson {
  WindowClientCapabilities({
    required this.showDocument,
    required this.showMessage,
    required this.workDoneProgress,
  });

  factory WindowClientCapabilities.fromJson(Map<String, Object?> json) {
    final showDocumentJson = json['showDocument']!;
    final showDocument = ShowDocumentClientCapabilities.fromJson(
      (showDocumentJson as Map<String, Object?>),
    );
    final showMessageJson = json['showMessage']!;
    final showMessage = ShowMessageRequestClientCapabilities.fromJson(
      (showMessageJson as Map<String, Object?>),
    );
    final workDoneProgressJson = json['workDoneProgress']!;
    final workDoneProgress = (workDoneProgressJson as bool);

    return WindowClientCapabilities(
      showDocument: showDocument,
      showMessage: showMessage,
      workDoneProgress: workDoneProgress,
    );
  }

  /// Capabilities specific to the showDocument request.
  /// @since 3.16.0
  final ShowDocumentClientCapabilities? showDocument;

  /// Capabilities specific to the showMessage request.
  /// @since 3.16.0
  final ShowMessageRequestClientCapabilities? showMessage;

  /// It indicates whether the client supports server initiated progress
  /// using the `window/workDoneProgress/create` request.
  /// The capability also controls Whether client supports handling of
  /// progress notifications. If set servers are allowed to report a
  /// `workDoneProgress` property in the request specific server
  /// capabilities.
  /// @since 3.15.0
  final bool? workDoneProgress;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['showDocument'] = showDocument?.toJson();
    json['showMessage'] = showMessage?.toJson();
    json['workDoneProgress'] = workDoneProgress;
    return json;
  }
}

/// Struct
/// General client capabilities.
/// @since 3.16.0
class GeneralClientCapabilities implements ToJson {
  GeneralClientCapabilities({
    required this.markdown,
    required this.positionEncodings,
    required this.regularExpressions,
    required this.staleRequestSupport,
  });

  factory GeneralClientCapabilities.fromJson(Map<String, Object?> json) {
    final markdownJson = json['markdown']!;
    final markdown = MarkdownClientCapabilities.fromJson(
      (markdownJson as Map<String, Object?>),
    );
    final positionEncodingsJson = json['positionEncodings']!;
    final positionEncodings =
        (positionEncodingsJson as List<PositionEncodingKind>);
    final regularExpressionsJson = json['regularExpressions']!;
    final regularExpressions = RegularExpressionsClientCapabilities.fromJson(
      (regularExpressionsJson as Map<String, Object?>),
    );
    final staleRequestSupportJson = json['staleRequestSupport']!;
    final staleRequestSupport =
        (staleRequestSupportJson
            as GeneralClientCapabilitiesStaleRequestSupport);

    return GeneralClientCapabilities(
      markdown: markdown,
      positionEncodings: positionEncodings,
      regularExpressions: regularExpressions,
      staleRequestSupport: staleRequestSupport,
    );
  }

  /// Client capabilities specific to the client's markdown parser.
  /// @since 3.16.0
  final MarkdownClientCapabilities? markdown;

  /// The position encodings supported by the client. Client and server have
  /// to agree on the same position encoding to ensure that offsets (e.g.
  /// character position in a line) are interpreted the same on both sides.
  /// To keep the protocol backwards compatible the following applies: if the
  /// value 'utf-16' is missing from the array of position encodings servers
  /// can assume that the client supports UTF-16. UTF-16 is therefore a
  /// mandatory encoding.
  /// If omitted it defaults to ['utf-16'].
  /// Implementation considerations: since the conversion from one encoding
  /// into another requires the content of the file / line the conversion is
  /// best done where the file is read which is usually on the server side.
  /// @since 3.17.0
  final List<PositionEncodingKind>? positionEncodings;

  /// Client capabilities specific to regular expressions.
  /// @since 3.16.0
  final RegularExpressionsClientCapabilities? regularExpressions;

  /// Client capability that signals how the client handles stale requests
  /// (e.g. a request for which the client will not process the response
  /// anymore since the information is outdated).
  /// @since 3.17.0
  final GeneralClientCapabilitiesStaleRequestSupport? staleRequestSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['markdown'] = markdown?.toJson();
    json['positionEncodings'] = positionEncodings;
    json['regularExpressions'] = regularExpressions?.toJson();
    json['staleRequestSupport'] = staleRequestSupport;
    return json;
  }
}

/// Struct
/// A relative pattern is a helper to construct glob patterns that are matched
/// relatively to a base URI. The common value for a `baseUri` is a workspace
/// folder root, but it can be another absolute URI as well.
/// @since 3.17.0
class RelativePattern implements ToJson {
  RelativePattern({required this.baseUri, required this.pattern});

  factory RelativePattern.fromJson(Map<String, Object?> json) {
    final baseUriJson = json['baseUri']!;
    final baseUri = (baseUriJson as OrRefType);
    final patternJson = json['pattern']!;
    final pattern = (patternJson as Pattern);

    return RelativePattern(baseUri: baseUri, pattern: pattern);
  }

  /// A workspace folder or a base URI to which this pattern will be matched
  /// against relatively.
  final OrRefType baseUri;

  /// The actual glob pattern;
  final Pattern pattern;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['baseUri'] = baseUri;
    json['pattern'] = pattern;
    return json;
  }
}

/// Struct
class WorkspaceEditClientCapabilities implements ToJson {
  WorkspaceEditClientCapabilities({
    required this.changeAnnotationSupport,
    required this.documentChanges,
    required this.failureHandling,
    required this.normalizesLineEndings,
    required this.resourceOperations,
  });

  factory WorkspaceEditClientCapabilities.fromJson(Map<String, Object?> json) {
    final changeAnnotationSupportJson = json['changeAnnotationSupport']!;
    final changeAnnotationSupport =
        (changeAnnotationSupportJson
            as WorkspaceEditClientCapabilitiesChangeAnnotationSupport);
    final documentChangesJson = json['documentChanges']!;
    final documentChanges = (documentChangesJson as bool);
    final failureHandlingJson = json['failureHandling']!;
    // Handle enum type
    final failureHandling = _i1.$enumDecode(
      _$FailureHandlingKindEnumMap,
      failureHandlingJson,
    );
    final normalizesLineEndingsJson = json['normalizesLineEndings']!;
    final normalizesLineEndings = (normalizesLineEndingsJson as bool);
    final resourceOperationsJson = json['resourceOperations']!;
    final resourceOperations =
        (resourceOperationsJson as List<ResourceOperationKind>);

    return WorkspaceEditClientCapabilities(
      changeAnnotationSupport: changeAnnotationSupport,
      documentChanges: documentChanges,
      failureHandling: failureHandling,
      normalizesLineEndings: normalizesLineEndings,
      resourceOperations: resourceOperations,
    );
  }

  /// Whether the client in general supports change annotations on text
  /// edits, create file, rename file and delete file changes.
  /// @since 3.16.0
  final WorkspaceEditClientCapabilitiesChangeAnnotationSupport?
  changeAnnotationSupport;

  /// The client supports versioned document changes in `WorkspaceEdit`s
  final bool? documentChanges;

  /// The failure handling strategy of a client if applying the workspace
  /// edit fails.
  /// @since 3.13.0
  final FailureHandlingKind? failureHandling;

  /// Whether the client normalizes line endings to the client specific
  /// setting. If set to `true` the client will normalize line ending
  /// characters in a workspace edit to the client-specified new line
  /// character.
  /// @since 3.16.0
  final bool? normalizesLineEndings;

  /// The resource operations the client supports. Clients should at least
  /// support 'create', 'rename' and 'delete' files and folders.
  /// @since 3.13.0
  final List<ResourceOperationKind>? resourceOperations;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['changeAnnotationSupport'] = changeAnnotationSupport;
    json['documentChanges'] = documentChanges;
    json['failureHandling'] = failureHandling?.value;
    json['normalizesLineEndings'] = normalizesLineEndings;
    json['resourceOperations'] = resourceOperations;
    return json;
  }
}

/// Struct
class DidChangeConfigurationClientCapabilities implements ToJson {
  DidChangeConfigurationClientCapabilities({required this.dynamicRegistration});

  factory DidChangeConfigurationClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return DidChangeConfigurationClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Did change configuration notification supports dynamic registration.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
class DidChangeWatchedFilesClientCapabilities implements ToJson {
  DidChangeWatchedFilesClientCapabilities({
    required this.dynamicRegistration,
    required this.relativePatternSupport,
  });

  factory DidChangeWatchedFilesClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final relativePatternSupportJson = json['relativePatternSupport']!;
    final relativePatternSupport = (relativePatternSupportJson as bool);

    return DidChangeWatchedFilesClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      relativePatternSupport: relativePatternSupport,
    );
  }

  /// Did change watched files notification supports dynamic registration.
  /// Please note that the current protocol doesn't support static
  /// configuration for file changes from the server side.
  final bool? dynamicRegistration;

  /// Whether the client has support for {@link RelativePattern relative
  /// pattern} or not.
  /// @since 3.17.0
  final bool? relativePatternSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['relativePatternSupport'] = relativePatternSupport;
    return json;
  }
}

/// Struct
/// Client capabilities for a {@link WorkspaceSymbolRequest}.
class WorkspaceSymbolClientCapabilities implements ToJson {
  WorkspaceSymbolClientCapabilities({
    required this.dynamicRegistration,
    required this.resolveSupport,
    required this.symbolKind,
    required this.tagSupport,
  });

  factory WorkspaceSymbolClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final resolveSupportJson = json['resolveSupport']!;
    final resolveSupport =
        (resolveSupportJson as WorkspaceSymbolClientCapabilitiesResolveSupport);
    final symbolKindJson = json['symbolKind']!;
    final symbolKind =
        (symbolKindJson as WorkspaceSymbolClientCapabilitiesSymbolKind);
    final tagSupportJson = json['tagSupport']!;
    final tagSupport =
        (tagSupportJson as WorkspaceSymbolClientCapabilitiesTagSupport);

    return WorkspaceSymbolClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      resolveSupport: resolveSupport,
      symbolKind: symbolKind,
      tagSupport: tagSupport,
    );
  }

  /// Symbol request supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client support partial workspace symbols. The client will send the
  /// request `workspaceSymbol/resolve` to the server to resolve additional
  /// properties.
  /// @since 3.17.0
  final WorkspaceSymbolClientCapabilitiesResolveSupport? resolveSupport;

  /// Specific capabilities for the `SymbolKind` in the `workspace/symbol`
  /// request.
  final WorkspaceSymbolClientCapabilitiesSymbolKind? symbolKind;

  /// The client supports tags on `SymbolInformation`. Clients supporting
  /// tags have to handle unknown tags gracefully.
  /// @since 3.16.0
  final WorkspaceSymbolClientCapabilitiesTagSupport? tagSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['resolveSupport'] = resolveSupport;
    json['symbolKind'] = symbolKind;
    json['tagSupport'] = tagSupport;
    return json;
  }
}

/// Struct
/// The client capabilities of a {@link ExecuteCommandRequest}.
class ExecuteCommandClientCapabilities implements ToJson {
  ExecuteCommandClientCapabilities({required this.dynamicRegistration});

  factory ExecuteCommandClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return ExecuteCommandClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Execute command supports dynamic registration.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensWorkspaceClientCapabilities implements ToJson {
  SemanticTokensWorkspaceClientCapabilities({required this.refreshSupport});

  factory SemanticTokensWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final refreshSupportJson = json['refreshSupport']!;
    final refreshSupport = (refreshSupportJson as bool);

    return SemanticTokensWorkspaceClientCapabilities(
      refreshSupport: refreshSupport,
    );
  }

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// semantic tokens currently shown. It should be used with absolute care
  /// and is useful for situation where a server for example detects a
  /// project wide change that requires such a calculation.
  final bool? refreshSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['refreshSupport'] = refreshSupport;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class CodeLensWorkspaceClientCapabilities implements ToJson {
  CodeLensWorkspaceClientCapabilities({required this.refreshSupport});

  factory CodeLensWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final refreshSupportJson = json['refreshSupport']!;
    final refreshSupport = (refreshSupportJson as bool);

    return CodeLensWorkspaceClientCapabilities(refreshSupport: refreshSupport);
  }

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// code lenses currently shown. It should be used with absolute care and
  /// is useful for situation where a server for example detect a project
  /// wide change that requires such a calculation.
  final bool? refreshSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['refreshSupport'] = refreshSupport;
    return json;
  }
}

/// Struct
/// Capabilities relating to events from file operations by the user in the
/// client.
/// These events do not come from the file system, they come from user
/// operations like renaming a file in the UI.
/// @since 3.16.0
class FileOperationClientCapabilities implements ToJson {
  FileOperationClientCapabilities({
    required this.didCreate,
    required this.didDelete,
    required this.didRename,
    required this.dynamicRegistration,
    required this.willCreate,
    required this.willDelete,
    required this.willRename,
  });

  factory FileOperationClientCapabilities.fromJson(Map<String, Object?> json) {
    final didCreateJson = json['didCreate']!;
    final didCreate = (didCreateJson as bool);
    final didDeleteJson = json['didDelete']!;
    final didDelete = (didDeleteJson as bool);
    final didRenameJson = json['didRename']!;
    final didRename = (didRenameJson as bool);
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final willCreateJson = json['willCreate']!;
    final willCreate = (willCreateJson as bool);
    final willDeleteJson = json['willDelete']!;
    final willDelete = (willDeleteJson as bool);
    final willRenameJson = json['willRename']!;
    final willRename = (willRenameJson as bool);

    return FileOperationClientCapabilities(
      didCreate: didCreate,
      didDelete: didDelete,
      didRename: didRename,
      dynamicRegistration: dynamicRegistration,
      willCreate: willCreate,
      willDelete: willDelete,
      willRename: willRename,
    );
  }

  /// The client has support for sending didCreateFiles notifications.
  final bool? didCreate;

  /// The client has support for sending didDeleteFiles notifications.
  final bool? didDelete;

  /// The client has support for sending didRenameFiles notifications.
  final bool? didRename;

  /// Whether the client supports dynamic registration for file
  /// requests/notifications.
  final bool? dynamicRegistration;

  /// The client has support for sending willCreateFiles requests.
  final bool? willCreate;

  /// The client has support for sending willDeleteFiles requests.
  final bool? willDelete;

  /// The client has support for sending willRenameFiles requests.
  final bool? willRename;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['didCreate'] = didCreate;
    json['didDelete'] = didDelete;
    json['didRename'] = didRename;
    json['dynamicRegistration'] = dynamicRegistration;
    json['willCreate'] = willCreate;
    json['willDelete'] = willDelete;
    json['willRename'] = willRename;
    return json;
  }
}

/// Struct
/// Client workspace capabilities specific to inline values.
/// @since 3.17.0
class InlineValueWorkspaceClientCapabilities implements ToJson {
  InlineValueWorkspaceClientCapabilities({required this.refreshSupport});

  factory InlineValueWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final refreshSupportJson = json['refreshSupport']!;
    final refreshSupport = (refreshSupportJson as bool);

    return InlineValueWorkspaceClientCapabilities(
      refreshSupport: refreshSupport,
    );
  }

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// inline values currently shown. It should be used with absolute care and
  /// is useful for situation where a server for example detects a project
  /// wide change that requires such a calculation.
  final bool? refreshSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['refreshSupport'] = refreshSupport;
    return json;
  }
}

/// Struct
/// Client workspace capabilities specific to inlay hints.
/// @since 3.17.0
class InlayHintWorkspaceClientCapabilities implements ToJson {
  InlayHintWorkspaceClientCapabilities({required this.refreshSupport});

  factory InlayHintWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final refreshSupportJson = json['refreshSupport']!;
    final refreshSupport = (refreshSupportJson as bool);

    return InlayHintWorkspaceClientCapabilities(refreshSupport: refreshSupport);
  }

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// inlay hints currently shown. It should be used with absolute care and
  /// is useful for situation where a server for example detects a project
  /// wide change that requires such a calculation.
  final bool? refreshSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['refreshSupport'] = refreshSupport;
    return json;
  }
}

/// Struct
/// Workspace client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
class DiagnosticWorkspaceClientCapabilities implements ToJson {
  DiagnosticWorkspaceClientCapabilities({required this.refreshSupport});

  factory DiagnosticWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final refreshSupportJson = json['refreshSupport']!;
    final refreshSupport = (refreshSupportJson as bool);

    return DiagnosticWorkspaceClientCapabilities(
      refreshSupport: refreshSupport,
    );
  }

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// pulled diagnostics currently shown. It should be used with absolute
  /// care and is useful for situation where a server for example detects a
  /// project wide change that requires such a calculation.
  final bool? refreshSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['refreshSupport'] = refreshSupport;
    return json;
  }
}

/// Struct
/// Client workspace capabilities specific to folding ranges
/// @since 3.18.0 @proposed
class FoldingRangeWorkspaceClientCapabilities implements ToJson {
  FoldingRangeWorkspaceClientCapabilities({required this.refreshSupport});

  factory FoldingRangeWorkspaceClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final refreshSupportJson = json['refreshSupport']!;
    final refreshSupport = (refreshSupportJson as bool);

    return FoldingRangeWorkspaceClientCapabilities(
      refreshSupport: refreshSupport,
    );
  }

  /// Whether the client implementation supports a refresh request sent from
  /// the server to the client.
  /// Note that this event is global and will force the client to refresh all
  /// folding ranges currently shown. It should be used with absolute care
  /// and is useful for situation where a server for example detects a
  /// project wide change that requires such a calculation.
  /// @since 3.18.0 @proposed
  final bool? refreshSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['refreshSupport'] = refreshSupport;
    return json;
  }
}

/// Struct
class TextDocumentSyncClientCapabilities implements ToJson {
  TextDocumentSyncClientCapabilities({
    required this.didSave,
    required this.dynamicRegistration,
    required this.willSave,
    required this.willSaveWaitUntil,
  });

  factory TextDocumentSyncClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final didSaveJson = json['didSave']!;
    final didSave = (didSaveJson as bool);
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final willSaveJson = json['willSave']!;
    final willSave = (willSaveJson as bool);
    final willSaveWaitUntilJson = json['willSaveWaitUntil']!;
    final willSaveWaitUntil = (willSaveWaitUntilJson as bool);

    return TextDocumentSyncClientCapabilities(
      didSave: didSave,
      dynamicRegistration: dynamicRegistration,
      willSave: willSave,
      willSaveWaitUntil: willSaveWaitUntil,
    );
  }

  /// The client supports did save notifications.
  final bool? didSave;

  /// Whether text document synchronization supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client supports sending will save notifications.
  final bool? willSave;

  /// The client supports sending a will save request and waits for a
  /// response providing text edits which will be applied to the document
  /// before it is saved.
  final bool? willSaveWaitUntil;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['didSave'] = didSave;
    json['dynamicRegistration'] = dynamicRegistration;
    json['willSave'] = willSave;
    json['willSaveWaitUntil'] = willSaveWaitUntil;
    return json;
  }
}

/// Struct
/// Completion client capabilities
class CompletionClientCapabilities implements ToJson {
  CompletionClientCapabilities({
    required this.completionItem,
    required this.completionItemKind,
    required this.completionList,
    required this.contextSupport,
    required this.dynamicRegistration,
    required this.insertTextMode,
  });

  factory CompletionClientCapabilities.fromJson(Map<String, Object?> json) {
    final completionItemJson = json['completionItem']!;
    final completionItem =
        (completionItemJson as CompletionClientCapabilitiesCompletionItem);
    final completionItemKindJson = json['completionItemKind']!;
    final completionItemKind =
        (completionItemKindJson
            as CompletionClientCapabilitiesCompletionItemKind);
    final completionListJson = json['completionList']!;
    final completionList =
        (completionListJson as CompletionClientCapabilitiesCompletionList);
    final contextSupportJson = json['contextSupport']!;
    final contextSupport = (contextSupportJson as bool);
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final insertTextModeJson = json['insertTextMode']!;
    // Handle enum type
    final insertTextMode = _i1.$enumDecode(
      _$InsertTextModeEnumMap,
      insertTextModeJson,
    );

    return CompletionClientCapabilities(
      completionItem: completionItem,
      completionItemKind: completionItemKind,
      completionList: completionList,
      contextSupport: contextSupport,
      dynamicRegistration: dynamicRegistration,
      insertTextMode: insertTextMode,
    );
  }

  /// The client supports the following `CompletionItem` specific
  /// capabilities.
  final CompletionClientCapabilitiesCompletionItem? completionItem;

  final CompletionClientCapabilitiesCompletionItemKind? completionItemKind;

  /// The client supports the following `CompletionList` specific
  /// capabilities.
  /// @since 3.17.0
  final CompletionClientCapabilitiesCompletionList? completionList;

  /// The client supports to send additional context information for a
  /// `textDocument/completion` request.
  final bool? contextSupport;

  /// Whether completion supports dynamic registration.
  final bool? dynamicRegistration;

  /// Defines how the client handles whitespace and indentation when
  /// accepting a completion item that uses multi line text in either
  /// `insertText` or `textEdit`.
  /// @since 3.17.0
  final InsertTextMode? insertTextMode;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['completionItem'] = completionItem;
    json['completionItemKind'] = completionItemKind;
    json['completionList'] = completionList;
    json['contextSupport'] = contextSupport;
    json['dynamicRegistration'] = dynamicRegistration;
    json['insertTextMode'] = insertTextMode?.value;
    return json;
  }
}

/// Struct
class HoverClientCapabilities implements ToJson {
  HoverClientCapabilities({
    required this.contentFormat,
    required this.dynamicRegistration,
  });

  factory HoverClientCapabilities.fromJson(Map<String, Object?> json) {
    final contentFormatJson = json['contentFormat']!;
    final contentFormat = (contentFormatJson as List<MarkupKind>);
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return HoverClientCapabilities(
      contentFormat: contentFormat,
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Client supports the following content formats for the content property.
  /// The order describes the preferred format of the client.
  final List<MarkupKind>? contentFormat;

  /// Whether hover supports dynamic registration.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['contentFormat'] = contentFormat;
    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// Client Capabilities for a {@link SignatureHelpRequest}.
class SignatureHelpClientCapabilities implements ToJson {
  SignatureHelpClientCapabilities({
    required this.contextSupport,
    required this.dynamicRegistration,
    required this.signatureInformation,
  });

  factory SignatureHelpClientCapabilities.fromJson(Map<String, Object?> json) {
    final contextSupportJson = json['contextSupport']!;
    final contextSupport = (contextSupportJson as bool);
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final signatureInformationJson = json['signatureInformation']!;
    final signatureInformation =
        (signatureInformationJson
            as SignatureHelpClientCapabilitiesSignatureInformation);

    return SignatureHelpClientCapabilities(
      contextSupport: contextSupport,
      dynamicRegistration: dynamicRegistration,
      signatureInformation: signatureInformation,
    );
  }

  /// The client supports to send additional context information for a
  /// `textDocument/signatureHelp` request. A client that opts into
  /// contextSupport will also support the `retriggerCharacters` on
  /// `SignatureHelpOptions`.
  /// @since 3.15.0
  final bool? contextSupport;

  /// Whether signature help supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client supports the following `SignatureInformation` specific
  /// properties.
  final SignatureHelpClientCapabilitiesSignatureInformation?
  signatureInformation;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['contextSupport'] = contextSupport;
    json['dynamicRegistration'] = dynamicRegistration;
    json['signatureInformation'] = signatureInformation;
    return json;
  }
}

/// Struct
/// @since 3.14.0
class DeclarationClientCapabilities implements ToJson {
  DeclarationClientCapabilities({
    required this.dynamicRegistration,
    required this.linkSupport,
  });

  factory DeclarationClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final linkSupportJson = json['linkSupport']!;
    final linkSupport = (linkSupportJson as bool);

    return DeclarationClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      linkSupport: linkSupport,
    );
  }

  /// Whether declaration supports dynamic registration. If this is set to
  /// `true` the client supports the new `DeclarationRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool? dynamicRegistration;

  /// The client supports additional metadata in the form of declaration
  /// links.
  final bool? linkSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['linkSupport'] = linkSupport;
    return json;
  }
}

/// Struct
/// Client Capabilities for a {@link DefinitionRequest}.
class DefinitionClientCapabilities implements ToJson {
  DefinitionClientCapabilities({
    required this.dynamicRegistration,
    required this.linkSupport,
  });

  factory DefinitionClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final linkSupportJson = json['linkSupport']!;
    final linkSupport = (linkSupportJson as bool);

    return DefinitionClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      linkSupport: linkSupport,
    );
  }

  /// Whether definition supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  /// @since 3.14.0
  final bool? linkSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['linkSupport'] = linkSupport;
    return json;
  }
}

/// Struct
/// Since 3.6.0
class TypeDefinitionClientCapabilities implements ToJson {
  TypeDefinitionClientCapabilities({
    required this.dynamicRegistration,
    required this.linkSupport,
  });

  factory TypeDefinitionClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final linkSupportJson = json['linkSupport']!;
    final linkSupport = (linkSupportJson as bool);

    return TypeDefinitionClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      linkSupport: linkSupport,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `TypeDefinitionRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool? dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  /// Since 3.14.0
  final bool? linkSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['linkSupport'] = linkSupport;
    return json;
  }
}

/// Struct
/// @since 3.6.0
class ImplementationClientCapabilities implements ToJson {
  ImplementationClientCapabilities({
    required this.dynamicRegistration,
    required this.linkSupport,
  });

  factory ImplementationClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final linkSupportJson = json['linkSupport']!;
    final linkSupport = (linkSupportJson as bool);

    return ImplementationClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      linkSupport: linkSupport,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `ImplementationRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool? dynamicRegistration;

  /// The client supports additional metadata in the form of definition links.
  /// @since 3.14.0
  final bool? linkSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['linkSupport'] = linkSupport;
    return json;
  }
}

/// Struct
/// Client Capabilities for a {@link ReferencesRequest}.
class ReferenceClientCapabilities implements ToJson {
  ReferenceClientCapabilities({required this.dynamicRegistration});

  factory ReferenceClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return ReferenceClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether references supports dynamic registration.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// Client Capabilities for a {@link DocumentHighlightRequest}.
class DocumentHighlightClientCapabilities implements ToJson {
  DocumentHighlightClientCapabilities({required this.dynamicRegistration});

  factory DocumentHighlightClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return DocumentHighlightClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether document highlight supports dynamic registration.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// Client Capabilities for a {@link DocumentSymbolRequest}.
class DocumentSymbolClientCapabilities implements ToJson {
  DocumentSymbolClientCapabilities({
    required this.dynamicRegistration,
    required this.hierarchicalDocumentSymbolSupport,
    required this.labelSupport,
    required this.symbolKind,
    required this.tagSupport,
  });

  factory DocumentSymbolClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final hierarchicalDocumentSymbolSupportJson =
        json['hierarchicalDocumentSymbolSupport']!;
    final hierarchicalDocumentSymbolSupport =
        (hierarchicalDocumentSymbolSupportJson as bool);
    final labelSupportJson = json['labelSupport']!;
    final labelSupport = (labelSupportJson as bool);
    final symbolKindJson = json['symbolKind']!;
    final symbolKind =
        (symbolKindJson as WorkspaceSymbolClientCapabilitiesSymbolKind);
    final tagSupportJson = json['tagSupport']!;
    final tagSupport =
        (tagSupportJson as WorkspaceSymbolClientCapabilitiesTagSupport);

    return DocumentSymbolClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      hierarchicalDocumentSymbolSupport: hierarchicalDocumentSymbolSupport,
      labelSupport: labelSupport,
      symbolKind: symbolKind,
      tagSupport: tagSupport,
    );
  }

  /// Whether document symbol supports dynamic registration.
  final bool? dynamicRegistration;

  /// The client supports hierarchical document symbols.
  final bool? hierarchicalDocumentSymbolSupport;

  /// The client supports an additional label presented in the UI when
  /// registering a document symbol provider.
  /// @since 3.16.0
  final bool? labelSupport;

  /// Specific capabilities for the `SymbolKind` in the
  /// `textDocument/documentSymbol` request.
  final WorkspaceSymbolClientCapabilitiesSymbolKind? symbolKind;

  /// The client supports tags on `SymbolInformation`. Tags are supported on
  /// `DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
  /// Clients supporting tags have to handle unknown tags gracefully.
  /// @since 3.16.0
  final WorkspaceSymbolClientCapabilitiesTagSupport? tagSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['hierarchicalDocumentSymbolSupport'] =
        hierarchicalDocumentSymbolSupport;
    json['labelSupport'] = labelSupport;
    json['symbolKind'] = symbolKind;
    json['tagSupport'] = tagSupport;
    return json;
  }
}

/// Struct
/// The Client Capabilities of a {@link CodeActionRequest}.
class CodeActionClientCapabilities implements ToJson {
  CodeActionClientCapabilities({
    required this.codeActionLiteralSupport,
    required this.dataSupport,
    required this.disabledSupport,
    required this.dynamicRegistration,
    required this.honorsChangeAnnotations,
    required this.isPreferredSupport,
    required this.resolveSupport,
  });

  factory CodeActionClientCapabilities.fromJson(Map<String, Object?> json) {
    final codeActionLiteralSupportJson = json['codeActionLiteralSupport']!;
    final codeActionLiteralSupport =
        (codeActionLiteralSupportJson
            as CodeActionClientCapabilitiesCodeActionLiteralSupport);
    final dataSupportJson = json['dataSupport']!;
    final dataSupport = (dataSupportJson as bool);
    final disabledSupportJson = json['disabledSupport']!;
    final disabledSupport = (disabledSupportJson as bool);
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final honorsChangeAnnotationsJson = json['honorsChangeAnnotations']!;
    final honorsChangeAnnotations = (honorsChangeAnnotationsJson as bool);
    final isPreferredSupportJson = json['isPreferredSupport']!;
    final isPreferredSupport = (isPreferredSupportJson as bool);
    final resolveSupportJson = json['resolveSupport']!;
    final resolveSupport =
        (resolveSupportJson
            as CompletionClientCapabilitiesCompletionItemResolveSupport);

    return CodeActionClientCapabilities(
      codeActionLiteralSupport: codeActionLiteralSupport,
      dataSupport: dataSupport,
      disabledSupport: disabledSupport,
      dynamicRegistration: dynamicRegistration,
      honorsChangeAnnotations: honorsChangeAnnotations,
      isPreferredSupport: isPreferredSupport,
      resolveSupport: resolveSupport,
    );
  }

  /// The client support code action literals of type `CodeAction` as a valid
  /// response of the `textDocument/codeAction` request. If the property is
  /// not set the request can only return `Command` literals.
  /// @since 3.8.0
  final CodeActionClientCapabilitiesCodeActionLiteralSupport?
  codeActionLiteralSupport;

  /// Whether code action supports the `data` property which is preserved
  /// between a `textDocument/codeAction` and a `codeAction/resolve` request.
  /// @since 3.16.0
  final bool? dataSupport;

  /// Whether code action supports the `disabled` property.
  /// @since 3.16.0
  final bool? disabledSupport;

  /// Whether code action supports dynamic registration.
  final bool? dynamicRegistration;

  /// Whether the client honors the change annotations in text edits and
  /// resource operations returned via the `CodeAction#edit` property by for
  /// example presenting the workspace edit in the user interface and asking
  /// for confirmation.
  /// @since 3.16.0
  final bool? honorsChangeAnnotations;

  /// Whether code action supports the `isPreferred` property.
  /// @since 3.15.0
  final bool? isPreferredSupport;

  /// Whether the client supports resolving additional code action properties
  /// via a separate `codeAction/resolve` request.
  /// @since 3.16.0
  final CompletionClientCapabilitiesCompletionItemResolveSupport?
  resolveSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['codeActionLiteralSupport'] = codeActionLiteralSupport;
    json['dataSupport'] = dataSupport;
    json['disabledSupport'] = disabledSupport;
    json['dynamicRegistration'] = dynamicRegistration;
    json['honorsChangeAnnotations'] = honorsChangeAnnotations;
    json['isPreferredSupport'] = isPreferredSupport;
    json['resolveSupport'] = resolveSupport;
    return json;
  }
}

/// Struct
/// The client capabilities  of a {@link CodeLensRequest}.
class CodeLensClientCapabilities implements ToJson {
  CodeLensClientCapabilities({required this.dynamicRegistration});

  factory CodeLensClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return CodeLensClientCapabilities(dynamicRegistration: dynamicRegistration);
  }

  /// Whether code lens supports dynamic registration.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// The client capabilities of a {@link DocumentLinkRequest}.
class DocumentLinkClientCapabilities implements ToJson {
  DocumentLinkClientCapabilities({
    required this.dynamicRegistration,
    required this.tooltipSupport,
  });

  factory DocumentLinkClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final tooltipSupportJson = json['tooltipSupport']!;
    final tooltipSupport = (tooltipSupportJson as bool);

    return DocumentLinkClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      tooltipSupport: tooltipSupport,
    );
  }

  /// Whether document link supports dynamic registration.
  final bool? dynamicRegistration;

  /// Whether the client supports the `tooltip` property on `DocumentLink`.
  /// @since 3.15.0
  final bool? tooltipSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['tooltipSupport'] = tooltipSupport;
    return json;
  }
}

/// Struct
class DocumentColorClientCapabilities implements ToJson {
  DocumentColorClientCapabilities({required this.dynamicRegistration});

  factory DocumentColorClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return DocumentColorClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `DocumentColorRegistrationOptions`
  /// return value for the corresponding server capability as well.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// Client capabilities of a {@link DocumentFormattingRequest}.
class DocumentFormattingClientCapabilities implements ToJson {
  DocumentFormattingClientCapabilities({required this.dynamicRegistration});

  factory DocumentFormattingClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return DocumentFormattingClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether formatting supports dynamic registration.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// Client capabilities of a {@link DocumentRangeFormattingRequest}.
class DocumentRangeFormattingClientCapabilities implements ToJson {
  DocumentRangeFormattingClientCapabilities({
    required this.dynamicRegistration,
    required this.rangesSupport,
  });

  factory DocumentRangeFormattingClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final rangesSupportJson = json['rangesSupport']!;
    final rangesSupport = (rangesSupportJson as bool);

    return DocumentRangeFormattingClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      rangesSupport: rangesSupport,
    );
  }

  /// Whether range formatting supports dynamic registration.
  final bool? dynamicRegistration;

  /// Whether the client supports formatting multiple ranges at once.
  /// @since 3.18.0 @proposed
  final bool? rangesSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['rangesSupport'] = rangesSupport;
    return json;
  }
}

/// Struct
/// Client capabilities of a {@link DocumentOnTypeFormattingRequest}.
class DocumentOnTypeFormattingClientCapabilities implements ToJson {
  DocumentOnTypeFormattingClientCapabilities({
    required this.dynamicRegistration,
  });

  factory DocumentOnTypeFormattingClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return DocumentOnTypeFormattingClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether on type formatting supports dynamic registration.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
class RenameClientCapabilities implements ToJson {
  RenameClientCapabilities({
    required this.dynamicRegistration,
    required this.honorsChangeAnnotations,
    required this.prepareSupport,
    required this.prepareSupportDefaultBehavior,
  });

  factory RenameClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final honorsChangeAnnotationsJson = json['honorsChangeAnnotations']!;
    final honorsChangeAnnotations = (honorsChangeAnnotationsJson as bool);
    final prepareSupportJson = json['prepareSupport']!;
    final prepareSupport = (prepareSupportJson as bool);
    final prepareSupportDefaultBehaviorJson =
        json['prepareSupportDefaultBehavior']!;
    // Handle enum type
    final prepareSupportDefaultBehavior = _i1.$enumDecode(
      _$PrepareSupportDefaultBehaviorEnumMap,
      prepareSupportDefaultBehaviorJson,
    );

    return RenameClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      honorsChangeAnnotations: honorsChangeAnnotations,
      prepareSupport: prepareSupport,
      prepareSupportDefaultBehavior: prepareSupportDefaultBehavior,
    );
  }

  /// Whether rename supports dynamic registration.
  final bool? dynamicRegistration;

  /// Whether the client honors the change annotations in text edits and
  /// resource operations returned via the rename request's workspace edit by
  /// for example presenting the workspace edit in the user interface and
  /// asking for confirmation.
  /// @since 3.16.0
  final bool? honorsChangeAnnotations;

  /// Client supports testing for validity of rename operations before
  /// execution.
  /// @since 3.12.0
  final bool? prepareSupport;

  /// Client supports the default behavior result.
  /// The value indicates the default behavior used by the client.
  /// @since 3.16.0
  final PrepareSupportDefaultBehavior? prepareSupportDefaultBehavior;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['honorsChangeAnnotations'] = honorsChangeAnnotations;
    json['prepareSupport'] = prepareSupport;
    json['prepareSupportDefaultBehavior'] =
        prepareSupportDefaultBehavior?.value;
    return json;
  }
}

/// Struct
class FoldingRangeClientCapabilities implements ToJson {
  FoldingRangeClientCapabilities({
    required this.dynamicRegistration,
    required this.foldingRange,
    required this.foldingRangeKind,
    required this.lineFoldingOnly,
    required this.rangeLimit,
  });

  factory FoldingRangeClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final foldingRangeJson = json['foldingRange']!;
    final foldingRange =
        (foldingRangeJson as FoldingRangeClientCapabilitiesFoldingRange);
    final foldingRangeKindJson = json['foldingRangeKind']!;
    final foldingRangeKind =
        (foldingRangeKindJson
            as FoldingRangeClientCapabilitiesFoldingRangeKind);
    final lineFoldingOnlyJson = json['lineFoldingOnly']!;
    final lineFoldingOnly = (lineFoldingOnlyJson as bool);
    final rangeLimitJson = json['rangeLimit']!;
    final rangeLimit = (rangeLimitJson as int);

    return FoldingRangeClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      foldingRange: foldingRange,
      foldingRangeKind: foldingRangeKind,
      lineFoldingOnly: lineFoldingOnly,
      rangeLimit: rangeLimit,
    );
  }

  /// Whether implementation supports dynamic registration for folding range
  /// providers. If this is set to `true` the client supports the new
  /// `FoldingRangeRegistrationOptions` return value for the corresponding
  /// server capability as well.
  final bool? dynamicRegistration;

  /// Specific options for the folding range.
  /// @since 3.17.0
  final FoldingRangeClientCapabilitiesFoldingRange? foldingRange;

  /// Specific options for the folding range kind.
  /// @since 3.17.0
  final FoldingRangeClientCapabilitiesFoldingRangeKind? foldingRangeKind;

  /// If set, the client signals that it only supports folding complete
  /// lines. If set, client will ignore specified `startCharacter` and
  /// `endCharacter` properties in a FoldingRange.
  final bool? lineFoldingOnly;

  /// The maximum number of folding ranges that the client prefers to receive
  /// per document. The value serves as a hint, servers are free to follow
  /// the limit.
  final int? rangeLimit;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['foldingRange'] = foldingRange;
    json['foldingRangeKind'] = foldingRangeKind;
    json['lineFoldingOnly'] = lineFoldingOnly;
    json['rangeLimit'] = rangeLimit;
    return json;
  }
}

/// Struct
class SelectionRangeClientCapabilities implements ToJson {
  SelectionRangeClientCapabilities({required this.dynamicRegistration});

  factory SelectionRangeClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return SelectionRangeClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether implementation supports dynamic registration for selection
  /// range providers. If this is set to `true` the client supports the new
  /// `SelectionRangeRegistrationOptions` return value for the corresponding
  /// server capability as well.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// The publish diagnostic client capabilities.
class PublishDiagnosticsClientCapabilities implements ToJson {
  PublishDiagnosticsClientCapabilities({
    required this.codeDescriptionSupport,
    required this.dataSupport,
    required this.relatedInformation,
    required this.tagSupport,
    required this.versionSupport,
  });

  factory PublishDiagnosticsClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final codeDescriptionSupportJson = json['codeDescriptionSupport']!;
    final codeDescriptionSupport = (codeDescriptionSupportJson as bool);
    final dataSupportJson = json['dataSupport']!;
    final dataSupport = (dataSupportJson as bool);
    final relatedInformationJson = json['relatedInformation']!;
    final relatedInformation = (relatedInformationJson as bool);
    final tagSupportJson = json['tagSupport']!;
    final tagSupport =
        (tagSupportJson as PublishDiagnosticsClientCapabilitiesTagSupport);
    final versionSupportJson = json['versionSupport']!;
    final versionSupport = (versionSupportJson as bool);

    return PublishDiagnosticsClientCapabilities(
      codeDescriptionSupport: codeDescriptionSupport,
      dataSupport: dataSupport,
      relatedInformation: relatedInformation,
      tagSupport: tagSupport,
      versionSupport: versionSupport,
    );
  }

  /// Client supports a codeDescription property
  /// @since 3.16.0
  final bool? codeDescriptionSupport;

  /// Whether code action supports the `data` property which is preserved
  /// between a `textDocument/publishDiagnostics` and
  /// `textDocument/codeAction` request.
  /// @since 3.16.0
  final bool? dataSupport;

  /// Whether the clients accepts diagnostics with related information.
  final bool? relatedInformation;

  /// Client supports the tag property to provide meta data about a
  /// diagnostic. Clients supporting tags have to handle unknown tags
  /// gracefully.
  /// @since 3.15.0
  final PublishDiagnosticsClientCapabilitiesTagSupport? tagSupport;

  /// Whether the client interprets the version property of the
  /// `textDocument/publishDiagnostics` notification's parameter.
  /// @since 3.15.0
  final bool? versionSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['codeDescriptionSupport'] = codeDescriptionSupport;
    json['dataSupport'] = dataSupport;
    json['relatedInformation'] = relatedInformation;
    json['tagSupport'] = tagSupport;
    json['versionSupport'] = versionSupport;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class CallHierarchyClientCapabilities implements ToJson {
  CallHierarchyClientCapabilities({required this.dynamicRegistration});

  factory CallHierarchyClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return CallHierarchyClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// @since 3.16.0
class SemanticTokensClientCapabilities implements ToJson {
  SemanticTokensClientCapabilities({
    required this.augmentsSyntaxTokens,
    required this.dynamicRegistration,
    required this.formats,
    required this.multilineTokenSupport,
    required this.overlappingTokenSupport,
    required this.requests,
    required this.serverCancelSupport,
    required this.tokenModifiers,
    required this.tokenTypes,
  });

  factory SemanticTokensClientCapabilities.fromJson(Map<String, Object?> json) {
    final augmentsSyntaxTokensJson = json['augmentsSyntaxTokens']!;
    final augmentsSyntaxTokens = (augmentsSyntaxTokensJson as bool);
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final formatsJson = json['formats']!;
    final formats = (formatsJson as List<TokenFormat>);
    final multilineTokenSupportJson = json['multilineTokenSupport']!;
    final multilineTokenSupport = (multilineTokenSupportJson as bool);
    final overlappingTokenSupportJson = json['overlappingTokenSupport']!;
    final overlappingTokenSupport = (overlappingTokenSupportJson as bool);
    final requestsJson = json['requests']!;
    final requests = (requestsJson as SemanticTokensClientCapabilitiesRequests);
    final serverCancelSupportJson = json['serverCancelSupport']!;
    final serverCancelSupport = (serverCancelSupportJson as bool);
    final tokenModifiersJson = json['tokenModifiers']!;
    final tokenModifiers = (tokenModifiersJson as List<String>);
    final tokenTypesJson = json['tokenTypes']!;
    final tokenTypes = (tokenTypesJson as List<String>);

    return SemanticTokensClientCapabilities(
      augmentsSyntaxTokens: augmentsSyntaxTokens,
      dynamicRegistration: dynamicRegistration,
      formats: formats,
      multilineTokenSupport: multilineTokenSupport,
      overlappingTokenSupport: overlappingTokenSupport,
      requests: requests,
      serverCancelSupport: serverCancelSupport,
      tokenModifiers: tokenModifiers,
      tokenTypes: tokenTypes,
    );
  }

  /// Whether the client uses semantic tokens to augment existing syntax
  /// tokens. If set to `true` client side created syntax tokens and semantic
  /// tokens are both used for colorization. If set to `false` the client
  /// only uses the returned semantic tokens for colorization.
  /// If the value is `undefined` then the client behavior is not specified.
  /// @since 3.17.0
  final bool? augmentsSyntaxTokens;

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  /// The token formats the clients supports.
  final List<TokenFormat> formats;

  /// Whether the client supports tokens that can span multiple lines.
  final bool? multilineTokenSupport;

  /// Whether the client supports tokens that can overlap each other.
  final bool? overlappingTokenSupport;

  /// Which requests the client supports and might send to the server
  /// depending on the server's capability. Please note that clients might
  /// not show semantic tokens or degrade some of the user experience if a
  /// range or full request is advertised by the client but not provided by
  /// the server. If for example the client capability `requests.full` and
  /// `request.range` are both set to true but the server only provides a
  /// range provider the client might not render a minimap correctly or might
  /// even decide to not show any semantic tokens at all.
  final SemanticTokensClientCapabilitiesRequests requests;

  /// Whether the client allows the server to actively cancel a semantic
  /// token request, e.g. supports returning LSPErrorCodes.ServerCancelled.
  /// If a server does the client needs to retrigger the request.
  /// @since 3.17.0
  final bool? serverCancelSupport;

  /// The token modifiers that the client supports.
  final List<String> tokenModifiers;

  /// The token types that the client supports.
  final List<String> tokenTypes;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['augmentsSyntaxTokens'] = augmentsSyntaxTokens;
    json['dynamicRegistration'] = dynamicRegistration;
    json['formats'] = formats;
    json['multilineTokenSupport'] = multilineTokenSupport;
    json['overlappingTokenSupport'] = overlappingTokenSupport;
    json['requests'] = requests;
    json['serverCancelSupport'] = serverCancelSupport;
    json['tokenModifiers'] = tokenModifiers;
    json['tokenTypes'] = tokenTypes;
    return json;
  }
}

/// Struct
/// Client capabilities for the linked editing range request.
/// @since 3.16.0
class LinkedEditingRangeClientCapabilities implements ToJson {
  LinkedEditingRangeClientCapabilities({required this.dynamicRegistration});

  factory LinkedEditingRangeClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return LinkedEditingRangeClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// Client capabilities specific to the moniker request.
/// @since 3.16.0
class MonikerClientCapabilities implements ToJson {
  MonikerClientCapabilities({required this.dynamicRegistration});

  factory MonikerClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return MonikerClientCapabilities(dynamicRegistration: dynamicRegistration);
  }

  /// Whether moniker supports dynamic registration. If this is set to `true`
  /// the client supports the new `MonikerRegistrationOptions` return value
  /// for the corresponding server capability as well.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// @since 3.17.0
class TypeHierarchyClientCapabilities implements ToJson {
  TypeHierarchyClientCapabilities({required this.dynamicRegistration});

  factory TypeHierarchyClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return TypeHierarchyClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// Client capabilities specific to inline values.
/// @since 3.17.0
class InlineValueClientCapabilities implements ToJson {
  InlineValueClientCapabilities({required this.dynamicRegistration});

  factory InlineValueClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return InlineValueClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether implementation supports dynamic registration for inline value
  /// providers.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// Inlay hint client capabilities.
/// @since 3.17.0
class InlayHintClientCapabilities implements ToJson {
  InlayHintClientCapabilities({
    required this.dynamicRegistration,
    required this.resolveSupport,
  });

  factory InlayHintClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final resolveSupportJson = json['resolveSupport']!;
    final resolveSupport =
        (resolveSupportJson
            as CompletionClientCapabilitiesCompletionItemResolveSupport);

    return InlayHintClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      resolveSupport: resolveSupport,
    );
  }

  /// Whether inlay hints support dynamic registration.
  final bool? dynamicRegistration;

  /// Indicates which properties a client can resolve lazily on an inlay hint.
  final CompletionClientCapabilitiesCompletionItemResolveSupport?
  resolveSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['resolveSupport'] = resolveSupport;
    return json;
  }
}

/// Struct
/// Client capabilities specific to diagnostic pull requests.
/// @since 3.17.0
class DiagnosticClientCapabilities implements ToJson {
  DiagnosticClientCapabilities({
    required this.dynamicRegistration,
    required this.relatedDocumentSupport,
  });

  factory DiagnosticClientCapabilities.fromJson(Map<String, Object?> json) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final relatedDocumentSupportJson = json['relatedDocumentSupport']!;
    final relatedDocumentSupport = (relatedDocumentSupportJson as bool);

    return DiagnosticClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      relatedDocumentSupport: relatedDocumentSupport,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  /// Whether the clients supports related documents for document diagnostic
  /// pulls.
  final bool? relatedDocumentSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['relatedDocumentSupport'] = relatedDocumentSupport;
    return json;
  }
}

/// Struct
/// Client capabilities specific to inline completions.
/// @since 3.18.0 @proposed
class InlineCompletionClientCapabilities implements ToJson {
  InlineCompletionClientCapabilities({required this.dynamicRegistration});

  factory InlineCompletionClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);

    return InlineCompletionClientCapabilities(
      dynamicRegistration: dynamicRegistration,
    );
  }

  /// Whether implementation supports dynamic registration for inline
  /// completion providers.
  final bool? dynamicRegistration;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    return json;
  }
}

/// Struct
/// Notebook specific client capabilities.
/// @since 3.17.0
class NotebookDocumentSyncClientCapabilities implements ToJson {
  NotebookDocumentSyncClientCapabilities({
    required this.dynamicRegistration,
    required this.executionSummarySupport,
  });

  factory NotebookDocumentSyncClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final dynamicRegistrationJson = json['dynamicRegistration']!;
    final dynamicRegistration = (dynamicRegistrationJson as bool);
    final executionSummarySupportJson = json['executionSummarySupport']!;
    final executionSummarySupport = (executionSummarySupportJson as bool);

    return NotebookDocumentSyncClientCapabilities(
      dynamicRegistration: dynamicRegistration,
      executionSummarySupport: executionSummarySupport,
    );
  }

  /// Whether implementation supports dynamic registration. If this is set to
  /// `true` the client supports the new `(TextDocumentRegistrationOptions &
  /// StaticRegistrationOptions)` return value for the corresponding server
  /// capability as well.
  final bool? dynamicRegistration;

  /// The client supports sending execution summary data per cell.
  final bool? executionSummarySupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['dynamicRegistration'] = dynamicRegistration;
    json['executionSummarySupport'] = executionSummarySupport;
    return json;
  }
}

/// Struct
/// Show message request client capabilities
class ShowMessageRequestClientCapabilities implements ToJson {
  ShowMessageRequestClientCapabilities({required this.messageActionItem});

  factory ShowMessageRequestClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final messageActionItemJson = json['messageActionItem']!;
    final messageActionItem =
        (messageActionItemJson
            as ShowMessageRequestClientCapabilitiesMessageActionItem);

    return ShowMessageRequestClientCapabilities(
      messageActionItem: messageActionItem,
    );
  }

  /// Capabilities specific to the `MessageActionItem` type.
  final ShowMessageRequestClientCapabilitiesMessageActionItem?
  messageActionItem;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['messageActionItem'] = messageActionItem;
    return json;
  }
}

/// Struct
/// Client capabilities for the showDocument request.
/// @since 3.16.0
class ShowDocumentClientCapabilities implements ToJson {
  ShowDocumentClientCapabilities({required this.support});

  factory ShowDocumentClientCapabilities.fromJson(Map<String, Object?> json) {
    final supportJson = json['support']!;
    final support = (supportJson as bool);

    return ShowDocumentClientCapabilities(support: support);
  }

  /// The client has support for the showDocument request.
  final bool support;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['support'] = support;
    return json;
  }
}

/// Struct
/// Client capabilities specific to regular expressions.
/// @since 3.16.0
class RegularExpressionsClientCapabilities implements ToJson {
  RegularExpressionsClientCapabilities({
    required this.engine,
    required this.version,
  });

  factory RegularExpressionsClientCapabilities.fromJson(
    Map<String, Object?> json,
  ) {
    final engineJson = json['engine']!;
    final engine = (engineJson as String);
    final versionJson = json['version']!;
    final version = (versionJson as String);

    return RegularExpressionsClientCapabilities(
      engine: engine,
      version: version,
    );
  }

  /// The engine's name.
  final String engine;

  /// The engine's version.
  final String? version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['engine'] = engine;
    json['version'] = version;
    return json;
  }
}

/// Struct
/// Client capabilities specific to the used markdown parser.
/// @since 3.16.0
class MarkdownClientCapabilities implements ToJson {
  MarkdownClientCapabilities({
    required this.allowedTags,
    required this.parser,
    required this.version,
  });

  factory MarkdownClientCapabilities.fromJson(Map<String, Object?> json) {
    final allowedTagsJson = json['allowedTags']!;
    final allowedTags = (allowedTagsJson as List<String>);
    final parserJson = json['parser']!;
    final parser = (parserJson as String);
    final versionJson = json['version']!;
    final version = (versionJson as String);

    return MarkdownClientCapabilities(
      allowedTags: allowedTags,
      parser: parser,
      version: version,
    );
  }

  /// A list of HTML tags that the client allows / supports in Markdown.
  /// @since 3.17.0
  final List<String>? allowedTags;

  /// The name of the parser.
  final String parser;

  /// The version of the parser.
  final String? version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['allowedTags'] = allowedTags;
    json['parser'] = parser;
    json['version'] = version;
    return json;
  }
}

/// A set of predefined token types. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
/// @since 3.16.0
enum SemanticTokenTypes {
  namespaceValue('namespace'),
  typeValue('type'),
  classValue('class'),
  enumValue('enum'),
  interfaceValue('interface'),
  structValue('struct'),
  typeParameterValue('typeParameter'),
  parameterValue('parameter'),
  variableValue('variable'),
  propertyValue('property'),
  enumMemberValue('enumMember'),
  eventValue('event'),
  functionValue('function'),
  methodValue('method'),
  macroValue('macro'),
  keywordValue('keyword'),
  modifierValue('modifier'),
  commentValue('comment'),
  stringValue('string'),
  numberValue('number'),
  regexpValue('regexp'),
  operatorValue('operator'),
  decoratorValue('decorator');

  // The list of all values in this enumeration.
  const SemanticTokenTypes(this.value);

  // The type of this enumeration.
  final String value;
}

const _$SemanticTokenTypesEnumMap = {
  SemanticTokenTypes.namespaceValue: 'namespace',
  SemanticTokenTypes.typeValue: 'type',
  SemanticTokenTypes.classValue: 'class',
  SemanticTokenTypes.enumValue: 'enum',
  SemanticTokenTypes.interfaceValue: 'interface',
  SemanticTokenTypes.structValue: 'struct',
  SemanticTokenTypes.typeParameterValue: 'typeParameter',
  SemanticTokenTypes.parameterValue: 'parameter',
  SemanticTokenTypes.variableValue: 'variable',
  SemanticTokenTypes.propertyValue: 'property',
  SemanticTokenTypes.enumMemberValue: 'enumMember',
  SemanticTokenTypes.eventValue: 'event',
  SemanticTokenTypes.functionValue: 'function',
  SemanticTokenTypes.methodValue: 'method',
  SemanticTokenTypes.macroValue: 'macro',
  SemanticTokenTypes.keywordValue: 'keyword',
  SemanticTokenTypes.modifierValue: 'modifier',
  SemanticTokenTypes.commentValue: 'comment',
  SemanticTokenTypes.stringValue: 'string',
  SemanticTokenTypes.numberValue: 'number',
  SemanticTokenTypes.regexpValue: 'regexp',
  SemanticTokenTypes.operatorValue: 'operator',
  SemanticTokenTypes.decoratorValue: 'decorator',
};

/// A set of predefined token modifiers. This set is not fixed an clients can
/// specify additional token types via the corresponding client capabilities.
/// @since 3.16.0
enum SemanticTokenModifiers {
  declarationValue('declaration'),
  definitionValue('definition'),
  readonlyValue('readonly'),
  staticValue('static'),
  deprecatedValue('deprecated'),
  abstractValue('abstract'),
  asyncValue('async'),
  modificationValue('modification'),
  documentationValue('documentation'),
  defaultLibraryValue('defaultLibrary');

  // The list of all values in this enumeration.
  const SemanticTokenModifiers(this.value);

  // The type of this enumeration.
  final String value;
}

const _$SemanticTokenModifiersEnumMap = {
  SemanticTokenModifiers.declarationValue: 'declaration',
  SemanticTokenModifiers.definitionValue: 'definition',
  SemanticTokenModifiers.readonlyValue: 'readonly',
  SemanticTokenModifiers.staticValue: 'static',
  SemanticTokenModifiers.deprecatedValue: 'deprecated',
  SemanticTokenModifiers.abstractValue: 'abstract',
  SemanticTokenModifiers.asyncValue: 'async',
  SemanticTokenModifiers.modificationValue: 'modification',
  SemanticTokenModifiers.documentationValue: 'documentation',
  SemanticTokenModifiers.defaultLibraryValue: 'defaultLibrary',
};

/// The document diagnostic report kinds.
/// @since 3.17.0
enum DocumentDiagnosticReportKind {
  fullValue('full'),
  unchangedValue('unchanged');

  // The list of all values in this enumeration.
  const DocumentDiagnosticReportKind(this.value);

  // The type of this enumeration.
  final String value;
}

const _$DocumentDiagnosticReportKindEnumMap = {
  DocumentDiagnosticReportKind.fullValue: 'full',
  DocumentDiagnosticReportKind.unchangedValue: 'unchanged',
};

/// Predefined error codes.
enum ErrorCodes {
  parseErrorValue(-32700),
  invalidRequestValue(-32600),
  methodNotFoundValue(-32601),
  invalidParamsValue(-32602),
  internalErrorValue(-32603),
  serverNotInitializedValue(-32002),
  unknownErrorCodeValue(-32001);

  // The list of all values in this enumeration.
  const ErrorCodes(this.value);

  // The type of this enumeration.
  final int value;
}

const _$ErrorCodesEnumMap = {
  ErrorCodes.parseErrorValue: -32700,
  ErrorCodes.invalidRequestValue: -32600,
  ErrorCodes.methodNotFoundValue: -32601,
  ErrorCodes.invalidParamsValue: -32602,
  ErrorCodes.internalErrorValue: -32603,
  ErrorCodes.serverNotInitializedValue: -32002,
  ErrorCodes.unknownErrorCodeValue: -32001,
};

enum LSPErrorCodes {
  requestFailedValue(-32803),
  serverCancelledValue(-32802),
  contentModifiedValue(-32801),
  requestCancelledValue(-32800);

  // The list of all values in this enumeration.
  const LSPErrorCodes(this.value);

  // The type of this enumeration.
  final int value;
}

const _$LSPErrorCodesEnumMap = {
  LSPErrorCodes.requestFailedValue: -32803,
  LSPErrorCodes.serverCancelledValue: -32802,
  LSPErrorCodes.contentModifiedValue: -32801,
  LSPErrorCodes.requestCancelledValue: -32800,
};

/// A set of predefined range kinds.
enum FoldingRangeKind {
  commentValue('comment'),
  importsValue('imports'),
  regionValue('region');

  // The list of all values in this enumeration.
  const FoldingRangeKind(this.value);

  // The type of this enumeration.
  final String value;
}

const _$FoldingRangeKindEnumMap = {
  FoldingRangeKind.commentValue: 'comment',
  FoldingRangeKind.importsValue: 'imports',
  FoldingRangeKind.regionValue: 'region',
};

/// A symbol kind.
enum SymbolKind {
  fileValue(1),
  moduleValue(2),
  namespaceValue(3),
  packageValue(4),
  classValue(5),
  methodValue(6),
  propertyValue(7),
  fieldValue(8),
  constructorValue(9),
  enumValue(10),
  interfaceValue(11),
  functionValue(12),
  variableValue(13),
  constantValue(14),
  stringValue(15),
  numberValue(16),
  booleanValue(17),
  arrayValue(18),
  objectValue(19),
  keyValue(20),
  nullValue(21),
  enumMemberValue(22),
  structValue(23),
  eventValue(24),
  operatorValue(25),
  typeParameterValue(26);

  // The list of all values in this enumeration.
  const SymbolKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$SymbolKindEnumMap = {
  SymbolKind.fileValue: 1,
  SymbolKind.moduleValue: 2,
  SymbolKind.namespaceValue: 3,
  SymbolKind.packageValue: 4,
  SymbolKind.classValue: 5,
  SymbolKind.methodValue: 6,
  SymbolKind.propertyValue: 7,
  SymbolKind.fieldValue: 8,
  SymbolKind.constructorValue: 9,
  SymbolKind.enumValue: 10,
  SymbolKind.interfaceValue: 11,
  SymbolKind.functionValue: 12,
  SymbolKind.variableValue: 13,
  SymbolKind.constantValue: 14,
  SymbolKind.stringValue: 15,
  SymbolKind.numberValue: 16,
  SymbolKind.booleanValue: 17,
  SymbolKind.arrayValue: 18,
  SymbolKind.objectValue: 19,
  SymbolKind.keyValue: 20,
  SymbolKind.nullValue: 21,
  SymbolKind.enumMemberValue: 22,
  SymbolKind.structValue: 23,
  SymbolKind.eventValue: 24,
  SymbolKind.operatorValue: 25,
  SymbolKind.typeParameterValue: 26,
};

/// Symbol tags are extra annotations that tweak the rendering of a symbol.
/// @since 3.16
enum SymbolTag {
  deprecatedValue(1);

  // The list of all values in this enumeration.
  const SymbolTag(this.value);

  // The type of this enumeration.
  final int value;
}

const _$SymbolTagEnumMap = {SymbolTag.deprecatedValue: 1};

/// Moniker uniqueness level to define scope of the moniker.
/// @since 3.16.0
enum UniquenessLevel {
  documentValue('document'),
  projectValue('project'),
  groupValue('group'),
  schemeValue('scheme'),
  globalValue('global');

  // The list of all values in this enumeration.
  const UniquenessLevel(this.value);

  // The type of this enumeration.
  final String value;
}

const _$UniquenessLevelEnumMap = {
  UniquenessLevel.documentValue: 'document',
  UniquenessLevel.projectValue: 'project',
  UniquenessLevel.groupValue: 'group',
  UniquenessLevel.schemeValue: 'scheme',
  UniquenessLevel.globalValue: 'global',
};

/// The moniker kind.
/// @since 3.16.0
enum MonikerKind {
  importValue('import'),
  exportValue('export'),
  localValue('local');

  // The list of all values in this enumeration.
  const MonikerKind(this.value);

  // The type of this enumeration.
  final String value;
}

const _$MonikerKindEnumMap = {
  MonikerKind.importValue: 'import',
  MonikerKind.exportValue: 'export',
  MonikerKind.localValue: 'local',
};

/// Inlay hint kinds.
/// @since 3.17.0
enum InlayHintKind {
  typeValue(1),
  parameterValue(2);

  // The list of all values in this enumeration.
  const InlayHintKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$InlayHintKindEnumMap = {
  InlayHintKind.typeValue: 1,
  InlayHintKind.parameterValue: 2,
};

/// The message type
enum MessageType {
  errorValue(1),
  warningValue(2),
  infoValue(3),
  logValue(4),
  debugValue(5);

  // The list of all values in this enumeration.
  const MessageType(this.value);

  // The type of this enumeration.
  final int value;
}

const _$MessageTypeEnumMap = {
  MessageType.errorValue: 1,
  MessageType.warningValue: 2,
  MessageType.infoValue: 3,
  MessageType.logValue: 4,
  MessageType.debugValue: 5,
};

/// Defines how the host (editor) should sync document changes to the language
/// server.
enum TextDocumentSyncKind {
  noneValue(0),
  fullValue(1),
  incrementalValue(2);

  // The list of all values in this enumeration.
  const TextDocumentSyncKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$TextDocumentSyncKindEnumMap = {
  TextDocumentSyncKind.noneValue: 0,
  TextDocumentSyncKind.fullValue: 1,
  TextDocumentSyncKind.incrementalValue: 2,
};

/// Represents reasons why a text document is saved.
enum TextDocumentSaveReason {
  manualValue(1),
  afterDelayValue(2),
  focusOutValue(3);

  // The list of all values in this enumeration.
  const TextDocumentSaveReason(this.value);

  // The type of this enumeration.
  final int value;
}

const _$TextDocumentSaveReasonEnumMap = {
  TextDocumentSaveReason.manualValue: 1,
  TextDocumentSaveReason.afterDelayValue: 2,
  TextDocumentSaveReason.focusOutValue: 3,
};

/// The kind of a completion entry.
enum CompletionItemKind {
  textValue(1),
  methodValue(2),
  functionValue(3),
  constructorValue(4),
  fieldValue(5),
  variableValue(6),
  classValue(7),
  interfaceValue(8),
  moduleValue(9),
  propertyValue(10),
  unitValue(11),
  valueValue(12),
  enumValue(13),
  keywordValue(14),
  snippetValue(15),
  colorValue(16),
  fileValue(17),
  referenceValue(18),
  folderValue(19),
  enumMemberValue(20),
  constantValue(21),
  structValue(22),
  eventValue(23),
  operatorValue(24),
  typeParameterValue(25);

  // The list of all values in this enumeration.
  const CompletionItemKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$CompletionItemKindEnumMap = {
  CompletionItemKind.textValue: 1,
  CompletionItemKind.methodValue: 2,
  CompletionItemKind.functionValue: 3,
  CompletionItemKind.constructorValue: 4,
  CompletionItemKind.fieldValue: 5,
  CompletionItemKind.variableValue: 6,
  CompletionItemKind.classValue: 7,
  CompletionItemKind.interfaceValue: 8,
  CompletionItemKind.moduleValue: 9,
  CompletionItemKind.propertyValue: 10,
  CompletionItemKind.unitValue: 11,
  CompletionItemKind.valueValue: 12,
  CompletionItemKind.enumValue: 13,
  CompletionItemKind.keywordValue: 14,
  CompletionItemKind.snippetValue: 15,
  CompletionItemKind.colorValue: 16,
  CompletionItemKind.fileValue: 17,
  CompletionItemKind.referenceValue: 18,
  CompletionItemKind.folderValue: 19,
  CompletionItemKind.enumMemberValue: 20,
  CompletionItemKind.constantValue: 21,
  CompletionItemKind.structValue: 22,
  CompletionItemKind.eventValue: 23,
  CompletionItemKind.operatorValue: 24,
  CompletionItemKind.typeParameterValue: 25,
};

/// Completion item tags are extra annotations that tweak the rendering of a
/// completion item.
/// @since 3.15.0
enum CompletionItemTag {
  deprecatedValue(1);

  // The list of all values in this enumeration.
  const CompletionItemTag(this.value);

  // The type of this enumeration.
  final int value;
}

const _$CompletionItemTagEnumMap = {CompletionItemTag.deprecatedValue: 1};

/// Defines whether the insert text in a completion item should be interpreted
/// as plain text or a snippet.
enum InsertTextFormat {
  plainTextValue(1),
  snippetValue(2);

  // The list of all values in this enumeration.
  const InsertTextFormat(this.value);

  // The type of this enumeration.
  final int value;
}

const _$InsertTextFormatEnumMap = {
  InsertTextFormat.plainTextValue: 1,
  InsertTextFormat.snippetValue: 2,
};

/// How whitespace and indentation is handled during completion item insertion.
/// @since 3.16.0
enum InsertTextMode {
  asIsValue(1),
  adjustIndentationValue(2);

  // The list of all values in this enumeration.
  const InsertTextMode(this.value);

  // The type of this enumeration.
  final int value;
}

const _$InsertTextModeEnumMap = {
  InsertTextMode.asIsValue: 1,
  InsertTextMode.adjustIndentationValue: 2,
};

/// A document highlight kind.
enum DocumentHighlightKind {
  textValue(1),
  readValue(2),
  writeValue(3);

  // The list of all values in this enumeration.
  const DocumentHighlightKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$DocumentHighlightKindEnumMap = {
  DocumentHighlightKind.textValue: 1,
  DocumentHighlightKind.readValue: 2,
  DocumentHighlightKind.writeValue: 3,
};

/// A set of predefined code action kinds
enum CodeActionKind {
  emptyValue(''),
  quickFixValue('quickfix'),
  refactorValue('refactor'),
  refactorExtractValue('refactor.extract'),
  refactorInlineValue('refactor.inline'),
  refactorRewriteValue('refactor.rewrite'),
  sourceValue('source'),
  sourceOrganizeImportsValue('source.organizeImports'),
  sourceFixAllValue('source.fixAll');

  // The list of all values in this enumeration.
  const CodeActionKind(this.value);

  // The type of this enumeration.
  final String value;
}

const _$CodeActionKindEnumMap = {
  CodeActionKind.emptyValue: '',
  CodeActionKind.quickFixValue: 'quickfix',
  CodeActionKind.refactorValue: 'refactor',
  CodeActionKind.refactorExtractValue: 'refactor.extract',
  CodeActionKind.refactorInlineValue: 'refactor.inline',
  CodeActionKind.refactorRewriteValue: 'refactor.rewrite',
  CodeActionKind.sourceValue: 'source',
  CodeActionKind.sourceOrganizeImportsValue: 'source.organizeImports',
  CodeActionKind.sourceFixAllValue: 'source.fixAll',
};

enum TraceValues {
  offValue('off'),
  messagesValue('messages'),
  verboseValue('verbose');

  // The list of all values in this enumeration.
  const TraceValues(this.value);

  // The type of this enumeration.
  final String value;
}

const _$TraceValuesEnumMap = {
  TraceValues.offValue: 'off',
  TraceValues.messagesValue: 'messages',
  TraceValues.verboseValue: 'verbose',
};

/// Describes the content type that a client supports in various result
/// literals like `Hover`, `ParameterInfo` or `CompletionItem`.
/// Please note that `MarkupKinds` must not start with a `$`. This kinds are
/// reserved for internal usage.
enum MarkupKind {
  plainTextValue('plaintext'),
  markdownValue('markdown');

  // The list of all values in this enumeration.
  const MarkupKind(this.value);

  // The type of this enumeration.
  final String value;
}

const _$MarkupKindEnumMap = {
  MarkupKind.plainTextValue: 'plaintext',
  MarkupKind.markdownValue: 'markdown',
};

/// Describes how an {@link InlineCompletionItemProvider inline completion
/// provider} was triggered.
/// @since 3.18.0 @proposed
enum InlineCompletionTriggerKind {
  invokedValue(0),
  automaticValue(1);

  // The list of all values in this enumeration.
  const InlineCompletionTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$InlineCompletionTriggerKindEnumMap = {
  InlineCompletionTriggerKind.invokedValue: 0,
  InlineCompletionTriggerKind.automaticValue: 1,
};

/// A set of predefined position encoding kinds.
/// @since 3.17.0
enum PositionEncodingKind {
  uTF8Value('utf-8'),
  uTF16Value('utf-16'),
  uTF32Value('utf-32');

  // The list of all values in this enumeration.
  const PositionEncodingKind(this.value);

  // The type of this enumeration.
  final String value;
}

const _$PositionEncodingKindEnumMap = {
  PositionEncodingKind.uTF8Value: 'utf-8',
  PositionEncodingKind.uTF16Value: 'utf-16',
  PositionEncodingKind.uTF32Value: 'utf-32',
};

/// The file event type
enum FileChangeType {
  createdValue(1),
  changedValue(2),
  deletedValue(3);

  // The list of all values in this enumeration.
  const FileChangeType(this.value);

  // The type of this enumeration.
  final int value;
}

const _$FileChangeTypeEnumMap = {
  FileChangeType.createdValue: 1,
  FileChangeType.changedValue: 2,
  FileChangeType.deletedValue: 3,
};

enum WatchKind {
  createValue(1),
  changeValue(2),
  deleteValue(4);

  // The list of all values in this enumeration.
  const WatchKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$WatchKindEnumMap = {
  WatchKind.createValue: 1,
  WatchKind.changeValue: 2,
  WatchKind.deleteValue: 4,
};

/// The diagnostic's severity.
enum DiagnosticSeverity {
  errorValue(1),
  warningValue(2),
  informationValue(3),
  hintValue(4);

  // The list of all values in this enumeration.
  const DiagnosticSeverity(this.value);

  // The type of this enumeration.
  final int value;
}

const _$DiagnosticSeverityEnumMap = {
  DiagnosticSeverity.errorValue: 1,
  DiagnosticSeverity.warningValue: 2,
  DiagnosticSeverity.informationValue: 3,
  DiagnosticSeverity.hintValue: 4,
};

/// The diagnostic tags.
/// @since 3.15.0
enum DiagnosticTag {
  unnecessaryValue(1),
  deprecatedValue(2);

  // The list of all values in this enumeration.
  const DiagnosticTag(this.value);

  // The type of this enumeration.
  final int value;
}

const _$DiagnosticTagEnumMap = {
  DiagnosticTag.unnecessaryValue: 1,
  DiagnosticTag.deprecatedValue: 2,
};

/// How a completion was triggered
enum CompletionTriggerKind {
  invokedValue(1),
  triggerCharacterValue(2),
  triggerForIncompleteCompletionsValue(3);

  // The list of all values in this enumeration.
  const CompletionTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$CompletionTriggerKindEnumMap = {
  CompletionTriggerKind.invokedValue: 1,
  CompletionTriggerKind.triggerCharacterValue: 2,
  CompletionTriggerKind.triggerForIncompleteCompletionsValue: 3,
};

/// How a signature help was triggered.
/// @since 3.15.0
enum SignatureHelpTriggerKind {
  invokedValue(1),
  triggerCharacterValue(2),
  contentChangeValue(3);

  // The list of all values in this enumeration.
  const SignatureHelpTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$SignatureHelpTriggerKindEnumMap = {
  SignatureHelpTriggerKind.invokedValue: 1,
  SignatureHelpTriggerKind.triggerCharacterValue: 2,
  SignatureHelpTriggerKind.contentChangeValue: 3,
};

/// The reason why code actions were requested.
/// @since 3.17.0
enum CodeActionTriggerKind {
  invokedValue(1),
  automaticValue(2);

  // The list of all values in this enumeration.
  const CodeActionTriggerKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$CodeActionTriggerKindEnumMap = {
  CodeActionTriggerKind.invokedValue: 1,
  CodeActionTriggerKind.automaticValue: 2,
};

/// A pattern kind describing if a glob pattern matches a file a folder or both.
/// @since 3.16.0
enum FileOperationPatternKind {
  fileValue('file'),
  folderValue('folder');

  // The list of all values in this enumeration.
  const FileOperationPatternKind(this.value);

  // The type of this enumeration.
  final String value;
}

const _$FileOperationPatternKindEnumMap = {
  FileOperationPatternKind.fileValue: 'file',
  FileOperationPatternKind.folderValue: 'folder',
};

/// A notebook cell kind.
/// @since 3.17.0
enum NotebookCellKind {
  markupValue(1),
  codeValue(2);

  // The list of all values in this enumeration.
  const NotebookCellKind(this.value);

  // The type of this enumeration.
  final int value;
}

const _$NotebookCellKindEnumMap = {
  NotebookCellKind.markupValue: 1,
  NotebookCellKind.codeValue: 2,
};

enum ResourceOperationKind {
  createValue('create'),
  renameValue('rename'),
  deleteValue('delete');

  // The list of all values in this enumeration.
  const ResourceOperationKind(this.value);

  // The type of this enumeration.
  final String value;
}

const _$ResourceOperationKindEnumMap = {
  ResourceOperationKind.createValue: 'create',
  ResourceOperationKind.renameValue: 'rename',
  ResourceOperationKind.deleteValue: 'delete',
};

enum FailureHandlingKind {
  abortValue('abort'),
  transactionalValue('transactional'),
  textOnlyTransactionalValue('textOnlyTransactional'),
  undoValue('undo');

  // The list of all values in this enumeration.
  const FailureHandlingKind(this.value);

  // The type of this enumeration.
  final String value;
}

const _$FailureHandlingKindEnumMap = {
  FailureHandlingKind.abortValue: 'abort',
  FailureHandlingKind.transactionalValue: 'transactional',
  FailureHandlingKind.textOnlyTransactionalValue: 'textOnlyTransactional',
  FailureHandlingKind.undoValue: 'undo',
};

enum PrepareSupportDefaultBehavior {
  identifierValue(1);

  // The list of all values in this enumeration.
  const PrepareSupportDefaultBehavior(this.value);

  // The type of this enumeration.
  final int value;
}

const _$PrepareSupportDefaultBehaviorEnumMap = {
  PrepareSupportDefaultBehavior.identifierValue: 1,
};

enum TokenFormat {
  relativeValue('relative');

  // The list of all values in this enumeration.
  const TokenFormat(this.value);

  // The type of this enumeration.
  final String value;
}

const _$TokenFormatEnumMap = {TokenFormat.relativeValue: 'relative'};

/// Literal
/// Information about the server.
/// @since 3.15.0
class InitializeResultServerInfo implements ToJson {
  InitializeResultServerInfo({required this.name, required this.version});

  factory InitializeResultServerInfo.fromJson(Map<String, Object?> json) {
    final nameJson = json['name']!;
    final name = (nameJson as String);
    final versionJson = json['version']!;
    final version = (versionJson as String);

    return InitializeResultServerInfo(name: name, version: version);
  }

  /// The name of the server as defined by the server.
  final String name;

  /// The server's version as defined by the server.
  final String? version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['name'] = name;
    json['version'] = version;
    return json;
  }
}

/// Literal
/// In many cases the items of an actual completion result share the same value
/// for properties like `commitCharacters` or the range of a text edit. A
/// completion list can therefore define item defaults which will be used if a
/// completion item itself doesn't specify the value.
/// If a completion list specifies a default value and a completion item also
/// specifies a corresponding value the one from the item is used.
/// Servers are only allowed to return default values if the client signals
/// support for this via the `completionList.itemDefaults` capability.
/// @since 3.17.0
class CompletionListItemDefaults implements ToJson {
  CompletionListItemDefaults({
    required this.commitCharacters,
    required this.editRange,
    required this.insertTextFormat,
    required this.insertTextMode,
    required this.data,
  });

  factory CompletionListItemDefaults.fromJson(Map<String, Object?> json) {
    final commitCharactersJson = json['commitCharacters']!;
    final commitCharacters = (commitCharactersJson as List<String>);
    final editRangeJson = json['editRange']!;
    final editRange = (editRangeJson as OrRefType);
    final insertTextFormatJson = json['insertTextFormat']!;
    // Handle enum type
    final insertTextFormat = _i1.$enumDecode(
      _$InsertTextFormatEnumMap,
      insertTextFormatJson,
    );
    final insertTextModeJson = json['insertTextMode']!;
    // Handle enum type
    final insertTextMode = _i1.$enumDecode(
      _$InsertTextModeEnumMap,
      insertTextModeJson,
    );
    final dataJson = json['data']!;
    final data = (dataJson as LSPAny);

    return CompletionListItemDefaults(
      commitCharacters: commitCharacters,
      editRange: editRange,
      insertTextFormat: insertTextFormat,
      insertTextMode: insertTextMode,
      data: data,
    );
  }

  /// A default commit character set.
  /// @since 3.17.0
  final List<String>? commitCharacters;

  /// A default edit range.
  /// @since 3.17.0
  final OrRefType? editRange;

  /// A default insert text format.
  /// @since 3.17.0
  final InsertTextFormat? insertTextFormat;

  /// A default insert text mode.
  /// @since 3.17.0
  final InsertTextMode? insertTextMode;

  /// A default data value.
  /// @since 3.17.0
  final LSPAny? data;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['commitCharacters'] = commitCharacters;
    json['editRange'] = editRange;
    json['insertTextFormat'] = insertTextFormat?.value;
    json['insertTextMode'] = insertTextMode?.value;
    json['data'] = data;
    return json;
  }
}

/// Literal
/// Marks that the code action cannot currently be applied.
/// Clients should follow the following guidelines regarding disabled code
/// actions:
/// - Disabled code actions are not shown in automatic
/// [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
/// code action menus.
/// - Disabled actions are shown as faded out in the code action menu when the
/// user requests a more specific type of code action, such as refactorings.
/// - If the user has a
/// [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
/// that auto applies a code action and only disabled code actions are
/// returned, the client should show the user an error message with `reason` in
/// the editor.
/// @since 3.16.0
class CodeActionDisabled implements ToJson {
  CodeActionDisabled({required this.reason});

  factory CodeActionDisabled.fromJson(Map<String, Object?> json) {
    final reasonJson = json['reason']!;
    final reason = (reasonJson as String);

    return CodeActionDisabled(reason: reason);
  }

  /// Human readable description of why the code action is currently disabled.
  /// This is displayed in the code actions UI.
  final String reason;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['reason'] = reason;
    return json;
  }
}

/// Literal
/// Changes to cells
class NotebookDocumentChangeEventCells implements ToJson {
  NotebookDocumentChangeEventCells({
    required this.structure,
    required this.data,
    required this.textContent,
  });

  factory NotebookDocumentChangeEventCells.fromJson(Map<String, Object?> json) {
    final structureJson = json['structure']!;
    final structure =
        (structureJson as NotebookDocumentChangeEventCellsStructure);
    final dataJson = json['data']!;
    final data = (dataJson as List<NotebookCell>);
    final textContentJson = json['textContent']!;
    final textContent =
        (textContentJson as List<NotebookDocumentChangeEventCellsTextContent>);

    return NotebookDocumentChangeEventCells(
      structure: structure,
      data: data,
      textContent: textContent,
    );
  }

  /// Changes to the cell structure to add or remove cells.
  final NotebookDocumentChangeEventCellsStructure? structure;

  /// Changes to notebook cells properties like its kind, execution summary
  /// or metadata.
  final List<NotebookCell>? data;

  /// Changes to the text content of notebook cells.
  final List<NotebookDocumentChangeEventCellsTextContent>? textContent;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['structure'] = structure;
    json['data'] = data;
    json['textContent'] = textContent;
    return json;
  }
}

/// Literal
/// Changes to the cell structure to add or remove cells.
class NotebookDocumentChangeEventCellsStructure implements ToJson {
  NotebookDocumentChangeEventCellsStructure({
    required this.array,
    required this.didOpen,
    required this.didClose,
  });

  factory NotebookDocumentChangeEventCellsStructure.fromJson(
    Map<String, Object?> json,
  ) {
    final arrayJson = json['array']!;
    final array = NotebookCellArrayChange.fromJson(
      (arrayJson as Map<String, Object?>),
    );
    final didOpenJson = json['didOpen']!;
    final didOpen = (didOpenJson as List<TextDocumentItem>);
    final didCloseJson = json['didClose']!;
    final didClose = (didCloseJson as List<TextDocumentIdentifier>);

    return NotebookDocumentChangeEventCellsStructure(
      array: array,
      didOpen: didOpen,
      didClose: didClose,
    );
  }

  /// The change to the cell array.
  final NotebookCellArrayChange array;

  /// Additional opened cell text documents.
  final List<TextDocumentItem>? didOpen;

  /// Additional closed cell text documents.
  final List<TextDocumentIdentifier>? didClose;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['array'] = array.toJson();
    json['didOpen'] = didOpen;
    json['didClose'] = didClose;
    return json;
  }
}

/// Literal
/// Changes to the text content of notebook cells.
class NotebookDocumentChangeEventCellsTextContent implements ToJson {
  NotebookDocumentChangeEventCellsTextContent({
    required this.document,
    required this.changes,
  });

  factory NotebookDocumentChangeEventCellsTextContent.fromJson(
    Map<String, Object?> json,
  ) {
    final documentJson = json['document']!;
    final document = VersionedTextDocumentIdentifier.fromJson(
      (documentJson as Map<String, Object?>),
    );
    final changesJson = json['changes']!;
    final changes = (changesJson as List<TextDocumentContentChangeEvent>);

    return NotebookDocumentChangeEventCellsTextContent(
      document: document,
      changes: changes,
    );
  }

  final VersionedTextDocumentIdentifier document;

  final List<TextDocumentContentChangeEvent> changes;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['document'] = document.toJson();
    json['changes'] = changes;
    return json;
  }
}

/// Literal
/// Information about the client
/// @since 3.15.0
class InitializeParamsClientInfo implements ToJson {
  InitializeParamsClientInfo({required this.name, required this.version});

  factory InitializeParamsClientInfo.fromJson(Map<String, Object?> json) {
    final nameJson = json['name']!;
    final name = (nameJson as String);
    final versionJson = json['version']!;
    final version = (versionJson as String);

    return InitializeParamsClientInfo(name: name, version: version);
  }

  /// The name of the client as defined by the client.
  final String name;

  /// The client's version as defined by the client.
  final String? version;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['name'] = name;
    json['version'] = version;
    return json;
  }
}

/// Literal
/// Workspace specific server capabilities.
class ServerCapabilitiesWorkspace implements ToJson {
  ServerCapabilitiesWorkspace({
    required this.workspaceFolders,
    required this.fileOperations,
  });

  factory ServerCapabilitiesWorkspace.fromJson(Map<String, Object?> json) {
    final workspaceFoldersJson = json['workspaceFolders']!;
    final workspaceFolders = WorkspaceFoldersServerCapabilities.fromJson(
      (workspaceFoldersJson as Map<String, Object?>),
    );
    final fileOperationsJson = json['fileOperations']!;
    final fileOperations = FileOperationOptions.fromJson(
      (fileOperationsJson as Map<String, Object?>),
    );

    return ServerCapabilitiesWorkspace(
      workspaceFolders: workspaceFolders,
      fileOperations: fileOperations,
    );
  }

  /// The server supports workspace folder.
  /// @since 3.6.0
  final WorkspaceFoldersServerCapabilities? workspaceFolders;

  /// The server is interested in notifications/requests for operations on
  /// files.
  /// @since 3.16.0
  final FileOperationOptions? fileOperations;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['workspaceFolders'] = workspaceFolders?.toJson();
    json['fileOperations'] = fileOperations?.toJson();
    return json;
  }
}

/// Literal
/// The server supports the following `CompletionItem` specific capabilities.
/// @since 3.17.0
class CompletionOptionsCompletionItem implements ToJson {
  CompletionOptionsCompletionItem({required this.labelDetailsSupport});

  factory CompletionOptionsCompletionItem.fromJson(Map<String, Object?> json) {
    final labelDetailsSupportJson = json['labelDetailsSupport']!;
    final labelDetailsSupport = (labelDetailsSupportJson as bool);

    return CompletionOptionsCompletionItem(
      labelDetailsSupport: labelDetailsSupport,
    );
  }

  /// The server has support for completion item label details (see also
  /// `CompletionItemLabelDetails`) when receiving a completion item in a
  /// resolve call.
  /// @since 3.17.0
  final bool? labelDetailsSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['labelDetailsSupport'] = labelDetailsSupport;
    return json;
  }
}

/// Literal
/// Client capability that signals how the client handles stale requests (e.g.
/// a request for which the client will not process the response anymore since
/// the information is outdated).
/// @since 3.17.0
class GeneralClientCapabilitiesStaleRequestSupport implements ToJson {
  GeneralClientCapabilitiesStaleRequestSupport({
    required this.cancel,
    required this.retryOnContentModified,
  });

  factory GeneralClientCapabilitiesStaleRequestSupport.fromJson(
    Map<String, Object?> json,
  ) {
    final cancelJson = json['cancel']!;
    final cancel = (cancelJson as bool);
    final retryOnContentModifiedJson = json['retryOnContentModified']!;
    final retryOnContentModified = (retryOnContentModifiedJson as List<String>);

    return GeneralClientCapabilitiesStaleRequestSupport(
      cancel: cancel,
      retryOnContentModified: retryOnContentModified,
    );
  }

  /// The client will actively cancel the request.
  final bool cancel;

  /// The list of requests for which the client will retry the request if it
  /// receives a response with error code `ContentModified`
  final List<String> retryOnContentModified;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['cancel'] = cancel;
    json['retryOnContentModified'] = retryOnContentModified;
    return json;
  }
}

/// Literal
/// Whether the client in general supports change annotations on text edits,
/// create file, rename file and delete file changes.
/// @since 3.16.0
class WorkspaceEditClientCapabilitiesChangeAnnotationSupport implements ToJson {
  WorkspaceEditClientCapabilitiesChangeAnnotationSupport({
    required this.groupsOnLabel,
  });

  factory WorkspaceEditClientCapabilitiesChangeAnnotationSupport.fromJson(
    Map<String, Object?> json,
  ) {
    final groupsOnLabelJson = json['groupsOnLabel']!;
    final groupsOnLabel = (groupsOnLabelJson as bool);

    return WorkspaceEditClientCapabilitiesChangeAnnotationSupport(
      groupsOnLabel: groupsOnLabel,
    );
  }

  /// Whether the client groups edits with equal labels into tree nodes, for
  /// instance all edits labelled with "Changes in Strings" would be a tree
  /// node.
  final bool? groupsOnLabel;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['groupsOnLabel'] = groupsOnLabel;
    return json;
  }
}

/// Literal
/// Specific capabilities for the `SymbolKind` in the `workspace/symbol`
/// request.
class WorkspaceSymbolClientCapabilitiesSymbolKind implements ToJson {
  WorkspaceSymbolClientCapabilitiesSymbolKind({required this.valueSet});

  factory WorkspaceSymbolClientCapabilitiesSymbolKind.fromJson(
    Map<String, Object?> json,
  ) {
    final valueSetJson = json['valueSet']!;
    final valueSet = (valueSetJson as List<SymbolKind>);

    return WorkspaceSymbolClientCapabilitiesSymbolKind(valueSet: valueSet);
  }

  /// The symbol kind values the client supports. When this property exists
  /// the client also guarantees that it will handle values outside its set
  /// gracefully and falls back to a default value when unknown.
  /// If this property is not present the client only supports the symbol
  /// kinds from `File` to `Array` as defined in the initial version of the
  /// protocol.
  final List<SymbolKind>? valueSet;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['valueSet'] = valueSet;
    return json;
  }
}

/// Literal
/// The client supports tags on `SymbolInformation`. Clients supporting tags
/// have to handle unknown tags gracefully.
/// @since 3.16.0
class WorkspaceSymbolClientCapabilitiesTagSupport implements ToJson {
  WorkspaceSymbolClientCapabilitiesTagSupport({required this.valueSet});

  factory WorkspaceSymbolClientCapabilitiesTagSupport.fromJson(
    Map<String, Object?> json,
  ) {
    final valueSetJson = json['valueSet']!;
    final valueSet = (valueSetJson as List<SymbolTag>);

    return WorkspaceSymbolClientCapabilitiesTagSupport(valueSet: valueSet);
  }

  /// The tags supported by the client.
  final List<SymbolTag> valueSet;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['valueSet'] = valueSet;
    return json;
  }
}

/// Literal
/// The client support partial workspace symbols. The client will send the
/// request `workspaceSymbol/resolve` to the server to resolve additional
/// properties.
/// @since 3.17.0
class WorkspaceSymbolClientCapabilitiesResolveSupport implements ToJson {
  WorkspaceSymbolClientCapabilitiesResolveSupport({required this.properties});

  factory WorkspaceSymbolClientCapabilitiesResolveSupport.fromJson(
    Map<String, Object?> json,
  ) {
    final propertiesJson = json['properties']!;
    final properties = (propertiesJson as List<String>);

    return WorkspaceSymbolClientCapabilitiesResolveSupport(
      properties: properties,
    );
  }

  /// The properties that a client can resolve lazily. Usually
  /// `location.range`
  final List<String> properties;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['properties'] = properties;
    return json;
  }
}

/// Literal
/// The client supports the following `CompletionItem` specific capabilities.
class CompletionClientCapabilitiesCompletionItem implements ToJson {
  CompletionClientCapabilitiesCompletionItem({
    required this.snippetSupport,
    required this.commitCharactersSupport,
    required this.documentationFormat,
    required this.deprecatedSupport,
    required this.preselectSupport,
    required this.tagSupport,
    required this.insertReplaceSupport,
    required this.resolveSupport,
    required this.insertTextModeSupport,
    required this.labelDetailsSupport,
  });

  factory CompletionClientCapabilitiesCompletionItem.fromJson(
    Map<String, Object?> json,
  ) {
    final snippetSupportJson = json['snippetSupport']!;
    final snippetSupport = (snippetSupportJson as bool);
    final commitCharactersSupportJson = json['commitCharactersSupport']!;
    final commitCharactersSupport = (commitCharactersSupportJson as bool);
    final documentationFormatJson = json['documentationFormat']!;
    final documentationFormat = (documentationFormatJson as List<MarkupKind>);
    final deprecatedSupportJson = json['deprecatedSupport']!;
    final deprecatedSupport = (deprecatedSupportJson as bool);
    final preselectSupportJson = json['preselectSupport']!;
    final preselectSupport = (preselectSupportJson as bool);
    final tagSupportJson = json['tagSupport']!;
    final tagSupport =
        (tagSupportJson
            as CompletionClientCapabilitiesCompletionItemTagSupport);
    final insertReplaceSupportJson = json['insertReplaceSupport']!;
    final insertReplaceSupport = (insertReplaceSupportJson as bool);
    final resolveSupportJson = json['resolveSupport']!;
    final resolveSupport =
        (resolveSupportJson
            as CompletionClientCapabilitiesCompletionItemResolveSupport);
    final insertTextModeSupportJson = json['insertTextModeSupport']!;
    final insertTextModeSupport =
        (insertTextModeSupportJson
            as CompletionClientCapabilitiesCompletionItemInsertTextModeSupport);
    final labelDetailsSupportJson = json['labelDetailsSupport']!;
    final labelDetailsSupport = (labelDetailsSupportJson as bool);

    return CompletionClientCapabilitiesCompletionItem(
      snippetSupport: snippetSupport,
      commitCharactersSupport: commitCharactersSupport,
      documentationFormat: documentationFormat,
      deprecatedSupport: deprecatedSupport,
      preselectSupport: preselectSupport,
      tagSupport: tagSupport,
      insertReplaceSupport: insertReplaceSupport,
      resolveSupport: resolveSupport,
      insertTextModeSupport: insertTextModeSupport,
      labelDetailsSupport: labelDetailsSupport,
    );
  }

  /// Client supports snippets as insert text.
  /// A snippet can define tab stops and placeholders with `$1`, `$2` and
  /// `${3:foo}`. `$0` defines the final tab stop, it defaults to the end of
  /// the snippet. Placeholders with equal identifiers are linked, that is
  /// typing in one will update others too.
  final bool? snippetSupport;

  /// Client supports commit characters on a completion item.
  final bool? commitCharactersSupport;

  /// Client supports the following content formats for the documentation
  /// property. The order describes the preferred format of the client.
  final List<MarkupKind>? documentationFormat;

  /// Client supports the deprecated property on a completion item.
  final bool? deprecatedSupport;

  /// Client supports the preselect property on a completion item.
  final bool? preselectSupport;

  /// Client supports the tag property on a completion item. Clients
  /// supporting tags have to handle unknown tags gracefully. Clients
  /// especially need to preserve unknown tags when sending a completion item
  /// back to the server in a resolve call.
  /// @since 3.15.0
  final CompletionClientCapabilitiesCompletionItemTagSupport? tagSupport;

  /// Client support insert replace edit to control different behavior if a
  /// completion item is inserted in the text or should replace text.
  /// @since 3.16.0
  final bool? insertReplaceSupport;

  /// Indicates which properties a client can resolve lazily on a completion
  /// item. Before version 3.16.0 only the predefined properties
  /// `documentation` and `details` could be resolved lazily.
  /// @since 3.16.0
  final CompletionClientCapabilitiesCompletionItemResolveSupport?
  resolveSupport;

  /// The client supports the `insertTextMode` property on a completion item
  /// to override the whitespace handling mode as defined by the client (see
  /// `insertTextMode`).
  /// @since 3.16.0
  final CompletionClientCapabilitiesCompletionItemInsertTextModeSupport?
  insertTextModeSupport;

  /// The client has support for completion item label details (see also
  /// `CompletionItemLabelDetails`).
  /// @since 3.17.0
  final bool? labelDetailsSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['snippetSupport'] = snippetSupport;
    json['commitCharactersSupport'] = commitCharactersSupport;
    json['documentationFormat'] = documentationFormat;
    json['deprecatedSupport'] = deprecatedSupport;
    json['preselectSupport'] = preselectSupport;
    json['tagSupport'] = tagSupport;
    json['insertReplaceSupport'] = insertReplaceSupport;
    json['resolveSupport'] = resolveSupport;
    json['insertTextModeSupport'] = insertTextModeSupport;
    json['labelDetailsSupport'] = labelDetailsSupport;
    return json;
  }
}

/// Literal
/// Client supports the tag property on a completion item. Clients supporting
/// tags have to handle unknown tags gracefully. Clients especially need to
/// preserve unknown tags when sending a completion item back to the server in
/// a resolve call.
/// @since 3.15.0
class CompletionClientCapabilitiesCompletionItemTagSupport implements ToJson {
  CompletionClientCapabilitiesCompletionItemTagSupport({
    required this.valueSet,
  });

  factory CompletionClientCapabilitiesCompletionItemTagSupport.fromJson(
    Map<String, Object?> json,
  ) {
    final valueSetJson = json['valueSet']!;
    final valueSet = (valueSetJson as List<CompletionItemTag>);

    return CompletionClientCapabilitiesCompletionItemTagSupport(
      valueSet: valueSet,
    );
  }

  /// The tags supported by the client.
  final List<CompletionItemTag> valueSet;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['valueSet'] = valueSet;
    return json;
  }
}

/// Literal
/// Indicates which properties a client can resolve lazily on a completion
/// item. Before version 3.16.0 only the predefined properties `documentation`
/// and `details` could be resolved lazily.
/// @since 3.16.0
class CompletionClientCapabilitiesCompletionItemResolveSupport
    implements ToJson {
  CompletionClientCapabilitiesCompletionItemResolveSupport({
    required this.properties,
  });

  factory CompletionClientCapabilitiesCompletionItemResolveSupport.fromJson(
    Map<String, Object?> json,
  ) {
    final propertiesJson = json['properties']!;
    final properties = (propertiesJson as List<String>);

    return CompletionClientCapabilitiesCompletionItemResolveSupport(
      properties: properties,
    );
  }

  /// The properties that a client can resolve lazily.
  final List<String> properties;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['properties'] = properties;
    return json;
  }
}

/// Literal
/// The client supports the `insertTextMode` property on a completion item to
/// override the whitespace handling mode as defined by the client (see
/// `insertTextMode`).
/// @since 3.16.0
class CompletionClientCapabilitiesCompletionItemInsertTextModeSupport
    implements ToJson {
  CompletionClientCapabilitiesCompletionItemInsertTextModeSupport({
    required this.valueSet,
  });

  factory CompletionClientCapabilitiesCompletionItemInsertTextModeSupport.fromJson(
    Map<String, Object?> json,
  ) {
    final valueSetJson = json['valueSet']!;
    final valueSet = (valueSetJson as List<InsertTextMode>);

    return CompletionClientCapabilitiesCompletionItemInsertTextModeSupport(
      valueSet: valueSet,
    );
  }

  final List<InsertTextMode> valueSet;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['valueSet'] = valueSet;
    return json;
  }
}

/// Literal
class CompletionClientCapabilitiesCompletionItemKind implements ToJson {
  CompletionClientCapabilitiesCompletionItemKind({required this.valueSet});

  factory CompletionClientCapabilitiesCompletionItemKind.fromJson(
    Map<String, Object?> json,
  ) {
    final valueSetJson = json['valueSet']!;
    final valueSet = (valueSetJson as List<CompletionItemKind>);

    return CompletionClientCapabilitiesCompletionItemKind(valueSet: valueSet);
  }

  /// The completion item kind values the client supports. When this property
  /// exists the client also guarantees that it will handle values outside
  /// its set gracefully and falls back to a default value when unknown.
  /// If this property is not present the client only supports the completion
  /// items kinds from `Text` to `Reference` as defined in the initial
  /// version of the protocol.
  final List<CompletionItemKind>? valueSet;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['valueSet'] = valueSet;
    return json;
  }
}

/// Literal
/// The client supports the following `CompletionList` specific capabilities.
/// @since 3.17.0
class CompletionClientCapabilitiesCompletionList implements ToJson {
  CompletionClientCapabilitiesCompletionList({required this.itemDefaults});

  factory CompletionClientCapabilitiesCompletionList.fromJson(
    Map<String, Object?> json,
  ) {
    final itemDefaultsJson = json['itemDefaults']!;
    final itemDefaults = (itemDefaultsJson as List<String>);

    return CompletionClientCapabilitiesCompletionList(
      itemDefaults: itemDefaults,
    );
  }

  /// The client supports the following itemDefaults on a completion list.
  /// The value lists the supported property names of the
  /// `CompletionList.itemDefaults` object. If omitted no properties are
  /// supported.
  /// @since 3.17.0
  final List<String>? itemDefaults;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['itemDefaults'] = itemDefaults;
    return json;
  }
}

/// Literal
/// The client supports the following `SignatureInformation` specific
/// properties.
class SignatureHelpClientCapabilitiesSignatureInformation implements ToJson {
  SignatureHelpClientCapabilitiesSignatureInformation({
    required this.documentationFormat,
    required this.parameterInformation,
    required this.activeParameterSupport,
  });

  factory SignatureHelpClientCapabilitiesSignatureInformation.fromJson(
    Map<String, Object?> json,
  ) {
    final documentationFormatJson = json['documentationFormat']!;
    final documentationFormat = (documentationFormatJson as List<MarkupKind>);
    final parameterInformationJson = json['parameterInformation']!;
    final parameterInformation =
        (parameterInformationJson
            as SignatureHelpClientCapabilitiesSignatureInformationParameterInformation);
    final activeParameterSupportJson = json['activeParameterSupport']!;
    final activeParameterSupport = (activeParameterSupportJson as bool);

    return SignatureHelpClientCapabilitiesSignatureInformation(
      documentationFormat: documentationFormat,
      parameterInformation: parameterInformation,
      activeParameterSupport: activeParameterSupport,
    );
  }

  /// Client supports the following content formats for the documentation
  /// property. The order describes the preferred format of the client.
  final List<MarkupKind>? documentationFormat;

  /// Client capabilities specific to parameter information.
  final SignatureHelpClientCapabilitiesSignatureInformationParameterInformation?
  parameterInformation;

  /// The client supports the `activeParameter` property on
  /// `SignatureInformation` literal.
  /// @since 3.16.0
  final bool? activeParameterSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['documentationFormat'] = documentationFormat;
    json['parameterInformation'] = parameterInformation;
    json['activeParameterSupport'] = activeParameterSupport;
    return json;
  }
}

/// Literal
/// Client capabilities specific to parameter information.
class SignatureHelpClientCapabilitiesSignatureInformationParameterInformation
    implements ToJson {
  SignatureHelpClientCapabilitiesSignatureInformationParameterInformation({
    required this.labelOffsetSupport,
  });

  factory SignatureHelpClientCapabilitiesSignatureInformationParameterInformation.fromJson(
    Map<String, Object?> json,
  ) {
    final labelOffsetSupportJson = json['labelOffsetSupport']!;
    final labelOffsetSupport = (labelOffsetSupportJson as bool);

    return SignatureHelpClientCapabilitiesSignatureInformationParameterInformation(
      labelOffsetSupport: labelOffsetSupport,
    );
  }

  /// The client supports processing label offsets instead of a simple label
  /// string.
  /// @since 3.14.0
  final bool? labelOffsetSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['labelOffsetSupport'] = labelOffsetSupport;
    return json;
  }
}

/// Literal
/// The client support code action literals of type `CodeAction` as a valid
/// response of the `textDocument/codeAction` request. If the property is not
/// set the request can only return `Command` literals.
/// @since 3.8.0
class CodeActionClientCapabilitiesCodeActionLiteralSupport implements ToJson {
  CodeActionClientCapabilitiesCodeActionLiteralSupport({
    required this.codeActionKind,
  });

  factory CodeActionClientCapabilitiesCodeActionLiteralSupport.fromJson(
    Map<String, Object?> json,
  ) {
    final codeActionKindJson = json['codeActionKind']!;
    final codeActionKind =
        (codeActionKindJson
            as CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind);

    return CodeActionClientCapabilitiesCodeActionLiteralSupport(
      codeActionKind: codeActionKind,
    );
  }

  /// The code action kind is support with the following value set.
  final CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind
  codeActionKind;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['codeActionKind'] = codeActionKind;
    return json;
  }
}

/// Literal
/// The code action kind is support with the following value set.
class CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind
    implements ToJson {
  CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind({
    required this.valueSet,
  });

  factory CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind.fromJson(
    Map<String, Object?> json,
  ) {
    final valueSetJson = json['valueSet']!;
    final valueSet = (valueSetJson as List<CodeActionKind>);

    return CodeActionClientCapabilitiesCodeActionLiteralSupportCodeActionKind(
      valueSet: valueSet,
    );
  }

  /// The code action kind values the client supports. When this property
  /// exists the client also guarantees that it will handle values outside
  /// its set gracefully and falls back to a default value when unknown.
  final List<CodeActionKind> valueSet;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['valueSet'] = valueSet;
    return json;
  }
}

/// Literal
/// Specific options for the folding range kind.
/// @since 3.17.0
class FoldingRangeClientCapabilitiesFoldingRangeKind implements ToJson {
  FoldingRangeClientCapabilitiesFoldingRangeKind({required this.valueSet});

  factory FoldingRangeClientCapabilitiesFoldingRangeKind.fromJson(
    Map<String, Object?> json,
  ) {
    final valueSetJson = json['valueSet']!;
    final valueSet = (valueSetJson as List<FoldingRangeKind>);

    return FoldingRangeClientCapabilitiesFoldingRangeKind(valueSet: valueSet);
  }

  /// The folding range kind values the client supports. When this property
  /// exists the client also guarantees that it will handle values outside
  /// its set gracefully and falls back to a default value when unknown.
  final List<FoldingRangeKind>? valueSet;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['valueSet'] = valueSet;
    return json;
  }
}

/// Literal
/// Specific options for the folding range.
/// @since 3.17.0
class FoldingRangeClientCapabilitiesFoldingRange implements ToJson {
  FoldingRangeClientCapabilitiesFoldingRange({required this.collapsedText});

  factory FoldingRangeClientCapabilitiesFoldingRange.fromJson(
    Map<String, Object?> json,
  ) {
    final collapsedTextJson = json['collapsedText']!;
    final collapsedText = (collapsedTextJson as bool);

    return FoldingRangeClientCapabilitiesFoldingRange(
      collapsedText: collapsedText,
    );
  }

  /// If set, the client signals that it supports setting collapsedText on
  /// folding ranges to display custom labels instead of the default text.
  /// @since 3.17.0
  final bool? collapsedText;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['collapsedText'] = collapsedText;
    return json;
  }
}

/// Literal
/// Client supports the tag property to provide meta data about a diagnostic.
/// Clients supporting tags have to handle unknown tags gracefully.
/// @since 3.15.0
class PublishDiagnosticsClientCapabilitiesTagSupport implements ToJson {
  PublishDiagnosticsClientCapabilitiesTagSupport({required this.valueSet});

  factory PublishDiagnosticsClientCapabilitiesTagSupport.fromJson(
    Map<String, Object?> json,
  ) {
    final valueSetJson = json['valueSet']!;
    final valueSet = (valueSetJson as List<DiagnosticTag>);

    return PublishDiagnosticsClientCapabilitiesTagSupport(valueSet: valueSet);
  }

  /// The tags supported by the client.
  final List<DiagnosticTag> valueSet;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['valueSet'] = valueSet;
    return json;
  }
}

/// Literal
/// Which requests the client supports and might send to the server depending
/// on the server's capability. Please note that clients might not show
/// semantic tokens or degrade some of the user experience if a range or full
/// request is advertised by the client but not provided by the server. If for
/// example the client capability `requests.full` and `request.range` are both
/// set to true but the server only provides a range provider the client might
/// not render a minimap correctly or might even decide to not show any
/// semantic tokens at all.
class SemanticTokensClientCapabilitiesRequests implements ToJson {
  SemanticTokensClientCapabilitiesRequests({
    required this.range,
    required this.full,
  });

  factory SemanticTokensClientCapabilitiesRequests.fromJson(
    Map<String, Object?> json,
  ) {
    final rangeJson = json['range']!;
    final range = (rangeJson as OrRefType);
    final fullJson = json['full']!;
    final full = (fullJson as OrRefType);

    return SemanticTokensClientCapabilitiesRequests(range: range, full: full);
  }

  /// The client will send the `textDocument/semanticTokens/range` request if
  /// the server provides a corresponding handler.
  final OrRefType? range;

  /// The client will send the `textDocument/semanticTokens/full` request if
  /// the server provides a corresponding handler.
  final OrRefType? full;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['range'] = range;
    json['full'] = full;
    return json;
  }
}

/// Literal
/// Capabilities specific to the `MessageActionItem` type.
class ShowMessageRequestClientCapabilitiesMessageActionItem implements ToJson {
  ShowMessageRequestClientCapabilitiesMessageActionItem({
    required this.additionalPropertiesSupport,
  });

  factory ShowMessageRequestClientCapabilitiesMessageActionItem.fromJson(
    Map<String, Object?> json,
  ) {
    final additionalPropertiesSupportJson =
        json['additionalPropertiesSupport']!;
    final additionalPropertiesSupport =
        (additionalPropertiesSupportJson as bool);

    return ShowMessageRequestClientCapabilitiesMessageActionItem(
      additionalPropertiesSupport: additionalPropertiesSupport,
    );
  }

  /// Whether the client supports additional attributes which are preserved
  /// and send back to the server in the request's response.
  final bool? additionalPropertiesSupport;

  @override
  Map<String, Object?> toJson() {
    final json = <String, Object?>{};

    json['additionalPropertiesSupport'] = additionalPropertiesSupport;
    return json;
  }
}

// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
// MetaNotification visitor not implemented for generation
