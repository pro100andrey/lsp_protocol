import 'dart:async';

import 'package:stream_channel/stream_channel.dart';

import '../connection/lsp_connection.dart';
import '../generated/models/enumerations.dart';
import '../generated/models/methods.dart';
import '../generated/models/structures.dart';
import '../generated/models/unions.dart';
import '../generated/server/server_api.dart';
import '../transport/lsp_byte_stream_channel.dart';
import 'capabilities.dart';
import 'config.dart';
import 'diagnostics.dart';
import 'documents.dart';
import 'lsp_feature.dart';
import 'lsp_state.dart';
import 'middleware.dart';
import 'progress_manager.dart';

export '../generated/server/server_api.dart';
export 'cancellation_token.dart';
export 'capabilities.dart';
export 'config.dart';
export 'diagnostics.dart';
export 'documents.dart';
export 'lsp_state.dart';
export 'middleware.dart';
export 'progress_manager.dart';

/// Top-level LSP server.
///
/// Provides namespace-grouped handler registration (incoming) and a
/// [client] proxy for outgoing messages.
///
/// **Quick start (stdio transport):**
/// ```dart
/// void main() async {
///   final server = LspServer();
///
///   server.general.onInitialize((params) async {
///     return InitializeResult(
///       capabilities: ServerCapabilities(
///         hoverProvider: true,
///       ),
///     );
///   });
///
///   server.textDocument.onHover((params) async => Hover(
///         contents: MarkupContent(
///           kind: MarkupKind.markdown,
///           value: '**Hi**',
///         ),
///       ));
///
///   await server.listen();
/// }
/// ```
///
/// **Sending messages to the client:**
/// ```dart
/// server.client.window.logMessage(
///   LogMessageParams(type: MessageType.info, message: 'Ready'),
/// );
/// ```
final class LspServer {
  /// Creates a server using stdin/stdout as the byte transport (the
  /// standard LSP process communication model).
  LspServer() : _connection = LspConnection(LspByteStreamChannel.fromStdio()) {
    _init();
  }

  /// Creates a server from an arbitrary byte [StreamChannel].
  ///
  /// Useful for testing or alternative transports (TCP, pipes, etc.).
  LspServer.fromChannel(StreamChannel<List<int>> channel)
    : _connection = LspConnection(
        LspByteStreamChannel.fromByteChannel(channel),
      ) {
    _init();
  }

  void _init() {
    documents.bind(this);
    config.bind();
  }

  final LspConnection _connection;

  // -------------------------------------------------------------------------
  // Incoming handler namespaces
  // -------------------------------------------------------------------------

  /// Handlers for `initialize`, `shutdown`, `initialized`, `exit`, and
  /// protocol-level (`$/`) methods.
  late final general = GeneralHandlers(_connection);

  /// Handlers for `textDocument/*` requests and notifications.
  late final textDocument = TextDocumentHandlers(_connection);

  /// Handlers for `workspace/*` requests and notifications.
  late final workspace = WorkspaceHandlers(_connection);

  /// Handlers for `callHierarchy/*` requests.
  late final callHierarchy = CallHierarchyHandlers(_connection);

  /// Handlers for `typeHierarchy/*` requests.
  late final typeHierarchy = TypeHierarchyHandlers(_connection);

  /// Handlers for `notebookDocument/*` notifications.
  late final notebookDocument = NotebookDocumentHandlers(_connection);

  /// Handlers for `completionItem/resolve`.
  late final completionItem = CompletionItemHandlers(_connection);

  /// Handlers for `codeAction/resolve`.
  late final codeAction = CodeActionHandlers(_connection);

  /// Handlers for `codeLens/resolve`.
  late final codeLens = CodeLensHandlers(_connection);

  /// Handlers for `documentLink/resolve`.
  late final documentLink = DocumentLinkHandlers(_connection);

  /// Handlers for `inlayHint/resolve`.
  late final inlayHint = InlayHintHandlers(_connection);

  /// Handlers for `workspaceSymbol/resolve`.
  late final workspaceSymbol = WorkspaceSymbolHandlers(_connection);

  /// Handlers for `window/*` client→server notifications.
  late final window = WindowHandlers(_connection);

  // -------------------------------------------------------------------------
  // Outgoing (server → client)
  // -------------------------------------------------------------------------

  /// Proxy for all outgoing (server → client) messages.
  late final client = ServerToClientProxy(_connection);

  // -------------------------------------------------------------------------
  // Additional capabilities
  // -------------------------------------------------------------------------

  /// High-level manager for active open document synchronization.
  final documents = TextDocumentManager();

  /// High-level manager for publishing diagnostics with built-in debouncing.
  late final diagnostics = DiagnosticsManager(this);

  /// High-level manager for caching and query workspace config settings.
  late final config = LspConfigurationManager(this);

  /// High-level manager for dynamic capability registrations.
  late final capabilities = CapabilityManager(this);

  /// High-level manager for creating work done progress sessions.
  late final progress = WorkDoneProgressManager(_connection);

  /// Registered middleware list for request/notification interception.
  List<LspMiddleware> get middlewares => _connection.middlewares;

  /// Gets the current lifecycle state of the LSP server.
  LspState get state => _connection.state;

  /// Gets the error callback triggered on unhandled exceptions in handlers.
  void Function(Object error, StackTrace stackTrace)? get onError =>
      _connection.onError;

  /// Sets the error callback triggered on unhandled exceptions in handlers.
  set onError(void Function(Object error, StackTrace stackTrace)? value) =>
      _connection.onError = value;

  // -------------------------------------------------------------------------
  // High-level API
  // -------------------------------------------------------------------------

  /// Registers multiple [features] at once.
  void registerFeatures(List<LspFeature> features) {
    for (final feature in features) {
      feature.register(this);
    }
  }

  /// Infers [ServerCapabilities] based on the handlers currently registered
  /// on the server.
  ///
  /// This is useful during `initialize` to automatically announce supported
  /// features to the client without manual synchronization of capabilities.
  ///
  /// [completionTriggerCharacters] controls which characters automatically
  /// trigger completion requests. Defaults to `['.', ':', ' ']`.
  /// [interFileDependencies] tells the client whether diagnostics in one file
  /// can affect diagnostics in other files. Defaults to `true`.
  /// [workspaceDiagnostics] tells the client the server supports workspace-wide
  /// diagnostics. Defaults to `false`.
  ServerCapabilities inferCapabilities({
    List<String> completionTriggerCharacters = const ['.', ':', ' '],
    bool interFileDependencies = true,
    bool workspaceDiagnostics = false,
  }) {
    final methods = _connection.registeredMethods;
    final hasWorkspaceMethods = methods.any(
      (m) =>
          (m is NotificationMethod && m.value.startsWith('workspace/')) ||
          (m is RequestMethod && m.value.startsWith('workspace/')),
    );
    final hasFileOps = methods.any(
      (m) =>
          m == NotificationMethod.didCreateFiles ||
          m == NotificationMethod.didRenameFiles ||
          m == NotificationMethod.didDeleteFiles,
    );

    return ServerCapabilities(
      positionEncoding: PositionEncodingKind.uTF16,
      hoverProvider: methods.contains(RequestMethod.hover)
          ? const ServerCapabilitiesHoverProvider(true)
          : null,
      completionProvider: methods.contains(RequestMethod.completion)
          ? CompletionOptions(
              triggerCharacters: completionTriggerCharacters,
            )
          : null,
      definitionProvider: methods.contains(RequestMethod.definition)
          ? const ServerCapabilitiesDefinitionProvider(true)
          : null,
      typeDefinitionProvider:
          methods.contains(RequestMethod.typeDefinition)
          ? const ServerCapabilitiesTypeDefinitionProvider(true)
          : null,
      implementationProvider:
          methods.contains(RequestMethod.implementation)
          ? const ServerCapabilitiesImplementationProvider(true)
          : null,
      referencesProvider: methods.contains(RequestMethod.references)
          ? const ServerCapabilitiesReferencesProvider(true)
          : null,
      documentHighlightProvider:
          methods.contains(RequestMethod.documentHighlight)
          ? const ServerCapabilitiesDocumentHighlightProvider(true)
          : null,
      documentSymbolProvider:
          methods.contains(RequestMethod.documentSymbol)
          ? const ServerCapabilitiesDocumentSymbolProvider(true)
          : null,
      codeActionProvider: methods.contains(RequestMethod.codeAction)
          ? const ServerCapabilitiesCodeActionProvider(
              CodeActionOptions(codeActionKinds: []),
            )
          : null,
      documentFormattingProvider:
          methods.contains(RequestMethod.formatting)
          ? const ServerCapabilitiesDocumentFormattingProvider(true)
          : null,
      documentRangeFormattingProvider:
          methods.contains(RequestMethod.rangeFormatting)
          ? const ServerCapabilitiesDocumentRangeFormattingProvider(true)
          : null,
      renameProvider: methods.contains(RequestMethod.rename)
          ? const ServerCapabilitiesRenameProvider(true)
          : null,
      foldingRangeProvider: methods.contains(RequestMethod.foldingRange)
          ? const ServerCapabilitiesFoldingRangeProvider(true)
          : null,
      selectionRangeProvider:
          methods.contains(RequestMethod.selectionRange)
          ? const ServerCapabilitiesSelectionRangeProvider(true)
          : null,
      callHierarchyProvider:
          methods.contains(RequestMethod.prepareCallHierarchy)
          ? const ServerCapabilitiesCallHierarchyProvider(true)
          : null,
      typeHierarchyProvider:
          methods.contains(RequestMethod.prepareTypeHierarchy)
          ? const ServerCapabilitiesTypeHierarchyProvider(true)
          : null,
      inlineValueProvider: methods.contains(RequestMethod.inlineValue)
          ? const ServerCapabilitiesInlineValueProvider(true)
          : null,
      inlayHintProvider: methods.contains(RequestMethod.inlayHint)
          ? const ServerCapabilitiesInlayHintProvider(true)
          : null,
      diagnosticProvider:
          methods.contains(RequestMethod.textDocumentDiagnostic)
          ? ServerCapabilitiesDiagnosticProvider(
              DiagnosticOptions(
                interFileDependencies: interFileDependencies,
                workspaceDiagnostics: workspaceDiagnostics,
              ),
            )
          : null,

      workspace: hasWorkspaceMethods
          ? (
              workspaceFolders: const WorkspaceFoldersServerCapabilities(
                supported: true,
              ),
              fileOperations: hasFileOps
                  ? FileOperationOptions(
                      didCreate: _fileOpRegistration('**/*'),
                      didRename: _fileOpRegistration('**/*'),
                      didDelete: _fileOpRegistration('**/*'),
                    )
                  : null,
            )
          : null,
    );
  }

  FileOperationRegistrationOptions _fileOpRegistration(String glob) =>
      FileOperationRegistrationOptions(
        filters: [
          FileOperationFilter(
            pattern: FileOperationPattern(
              glob: glob,
              matches: FileOperationPatternKind.file,
            ),
          ),
        ],
      );

  // -------------------------------------------------------------------------
  // Lifecycle
  // -------------------------------------------------------------------------

  /// Starts processing incoming messages.
  ///
  /// Returns when the underlying channel closes (e.g. the client exits).
  Future<void> listen() => _connection.listen();

  /// Closes the connection and stops processing.
  Future<void> close() async {
    diagnostics.close();
    config.close();
    await _connection.close();
  }
}
