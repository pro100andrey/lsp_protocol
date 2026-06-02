import 'package:dar/dar.dart';
import 'package:lsp_server/lsp_server.dart';

import '../app_state.dart';

export '../app_state.dart';

abstract class BaseAction extends ReduxAction<AppState> {
  /// The LSP server instance stored as a store prop.
  LspServer get lspServer => store.prop<LspServer>();
}
