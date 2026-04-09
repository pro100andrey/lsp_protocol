// GENERATED — do not edit.

import 'package:json_annotation/json_annotation.dart';

part 'methods.g.dart';

@JsonEnum(valueField: 'value', alwaysCreate: true)
enum NotificationMethod {
  /// The `workspace/didChangeWorkspaceFolders` notification is sent from the client to the server when the workspace
  /// folder configuration changes.
  didChangeWorkspaceFolders(r'workspace/didChangeWorkspaceFolders'),

  /// The `window/workDoneProgress/cancel` notification is sent from  the client to the server to cancel a progress
  /// initiated on the server side.
  cancel(r'window/workDoneProgress/cancel'),

  /// The did create files notification is sent from the client to the server when
  /// files were created from within the client.
  ///
  /// @since 3.16.0
  didCreateFiles(r'workspace/didCreateFiles'),

  /// The did rename files notification is sent from the client to the server when
  /// files were renamed from within the client.
  ///
  /// @since 3.16.0
  didRenameFiles(r'workspace/didRenameFiles'),

  /// The will delete files request is sent from the client to the server before files are actually
  /// deleted as long as the deletion is triggered from within the client.
  ///
  /// @since 3.16.0
  didDeleteFiles(r'workspace/didDeleteFiles'),

  /// A notification sent when a notebook opens.
  ///
  /// @since 3.17.0
  notebookDocumentDidOpen(r'notebookDocument/didOpen'),

  /// LSP notification `notebookDocument/didChange` (client to server).
  notebookDocumentDidChange(r'notebookDocument/didChange'),

  /// A notification sent when a notebook document is saved.
  ///
  /// @since 3.17.0
  notebookDocumentDidSave(r'notebookDocument/didSave'),

  /// A notification sent when a notebook closes.
  ///
  /// @since 3.17.0
  notebookDocumentDidClose(r'notebookDocument/didClose'),

  /// The initialized notification is sent from the client to the
  /// server after the client is fully initialized and the server
  /// is allowed to send requests from the server to the client.
  initialized(r'initialized'),

  /// The exit event is sent from the client to the server to
  /// ask the server to exit its process.
  exit(r'exit'),

  /// The configuration change notification is sent from the client to the server
  /// when the client's configuration has changed. The notification contains
  /// the changed configuration as defined by the language client.
  didChangeConfiguration(r'workspace/didChangeConfiguration'),

  /// The show message notification is sent from a server to a client to ask
  /// the client to display a particular message in the user interface.
  showMessage(r'window/showMessage'),

  /// The log message notification is sent from the server to the client to ask
  /// the client to log a particular message.
  logMessage(r'window/logMessage'),

  /// The telemetry event notification is sent from the server to the client to ask
  /// the client to log telemetry data.
  event(r'telemetry/event'),

  /// The document open notification is sent from the client to the server to signal
  /// newly opened text documents. The document's truth is now managed by the client
  /// and the server must not try to read the document's truth using the document's
  /// uri. Open in this sense means it is managed by the client. It doesn't necessarily
  /// mean that its content is presented in an editor. An open notification must not
  /// be sent more than once without a corresponding close notification send before.
  /// This means open and close notification must be balanced and the max open count
  /// is one.
  textDocumentDidOpen(r'textDocument/didOpen'),

  /// The document change notification is sent from the client to the server to signal
  /// changes to a text document.
  textDocumentDidChange(r'textDocument/didChange'),

  /// The document close notification is sent from the client to the server when
  /// the document got closed in the client. The document's truth now exists where
  /// the document's uri points to (e.g. if the document's uri is a file uri the
  /// truth now exists on disk). As with the open notification the close notification
  /// is about managing the document's content. Receiving a close notification
  /// doesn't mean that the document was open in an editor before. A close
  /// notification requires a previous open notification to be sent.
  textDocumentDidClose(r'textDocument/didClose'),

  /// The document save notification is sent from the client to the server when
  /// the document got saved in the client.
  textDocumentDidSave(r'textDocument/didSave'),

  /// A document will save notification is sent from the client to the server before
  /// the document is actually saved.
  willSave(r'textDocument/willSave'),

  /// The watched files notification is sent from the client to the server when
  /// the client detects changes to file watched by the language client.
  didChangeWatchedFiles(r'workspace/didChangeWatchedFiles'),

  /// Diagnostics notification are sent from the server to the client to signal
  /// results of validation runs.
  publishDiagnostics(r'textDocument/publishDiagnostics'),

  /// LSP notification `$/setTrace` (client to server).
  setTrace(r'$/setTrace'),

  /// LSP notification `$/logTrace` (server to client).
  logTrace(r'$/logTrace'),

  /// LSP notification `$/cancelRequest` (both directions).
  cancelRequest(r'$/cancelRequest'),

  /// LSP notification `$/progress` (both directions).
  progress(r'$/progress');

  const NotificationMethod(this.value);

  final String value;

  static NotificationMethod? decode(String json) =>
      $enumDecodeNullable(_$NotificationMethodEnumMap, json);
}
