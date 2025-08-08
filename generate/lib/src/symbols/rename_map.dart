// ignore_for_file: lines_longer_than_80_chars

String? renameType(String type) {
  final literalsKeys = _renameLiteralMap.keys.toSet();
  final sealedKeys = _renameSealedMap.keys.toSet();

  // Check for duplicates

  final duplicates = literalsKeys.intersection(sealedKeys);
  if (duplicates.isNotEmpty) {
    throw ArgumentError(
      'Duplicate keys found in rename maps: ${duplicates.join(', ')}',
    );
  }

  if (_renameLiteralMap.containsKey(type)) {
    return _renameLiteralMap[type];
  }

  if (_renameSealedMap.containsKey(type)) {
    return _renameSealedMap[type];
  }

  return null;
}



const _renameLiteralMap = {
  'RangeRangeStringPlaceholder': 'Literal1',
  'BoolDefaultBehavior': 'Literal2',
  'IntRangeLengthRangeRangeStringText': 'Literal3',
  'StringText': 'Literal4',
  'StringLanguageStringValue': 'Literal5',
  'StringLanguageStringPatternStringScheme': 'Literal6',
  'StringNotebookTypeStringPatternStringScheme': 'Literal7',
  'StringNameStringVersion': 'Literal8',
  'InsertTextFormatInsertTextFormatInsertTextModeInsertTextModeLSPAnyDataRangeOrRangeInsertRangeReplaceEditRangeStringsCommitCharacters':
      'Literal9',
  'StringReason': 'Literal10',
  'NotebookCellArrayChangeArrayTextDocumentIdentifiersDidCloseTextDocumentItemsDidOpen':
      'Literal11',
  'TextDocumentContentChangeEventsChangesVersionedTextDocumentIdentifierDocument':
      'TextContentLiteral',
  'NotebookCellArrayChangeArrayTextDocumentIdentifiersDidCloseTextDocumentItemsDidOpenStructureNotebookCellsDataTextDocumentContentChangeEventsChangesVersionedTextDocumentIdentifierDocumentsTextContent':
      'Literal13',
  'FileOperationOptionsFileOperationsWorkspaceFoldersServerCapabilitiesWorkspaceFolders':
      'Literal14',
  'BoolLabelDetailsSupport': 'Literal15',
  'BoolCancelStringsRetryOnContentModified': 'Literal16',
  'BoolGroupsOnLabel': 'Literal17',
  'SymbolKindsValueSet': 'SymbolKindsLiteral',
  'SymbolTagsValueSet': 'Literal19',
  'StringsProperties': 'Literal20',
  'CompletionItemTagsValueSet': 'CompletionItemTagsLiteral',
  'InsertTextModesValueSet': 'InsertTextModesLiteral',
  'BoolCommitCharactersSupportBoolDeprecatedSupportBoolInsertReplaceSupportBoolLabelDetailsSupportBoolPreselectSupportBoolSnippetSupportCompletionItemTagsValueSetTagSupportInsertTextModesValueSetInsertTextModeSupportMarkupKindsDocumentationFormatStringsPropertiesResolveSupport':
      'Literal23',
  'CompletionItemKindsValueSet': 'Literal24',
  'StringsItemDefaults': 'Literal25',
  'BoolLabelOffsetSupport': 'Literal26',
  'BoolActiveParameterSupportBoolLabelOffsetSupportParameterInformationMarkupKindsDocumentationFormat':
      'Literal27',
  'CodeActionKindsValueSet': 'Literal28',
  'CodeActionKindsValueSetCodeActionKind': 'Literal29',
  'FoldingRangeKindsValueSet': 'Literal30',
  'BoolCollapsedText': 'Literal31',
  'DiagnosticTagsValueSet': 'Literal32',
  'BoolOrBoolDeltaFullOrBoolRange': 'Literal33',
  'BoolAdditionalPropertiesSupport': 'Literal34',
};

const _renameSealedMap = {
  'LocationOrLocations': 'LocationSealed',
  'BoolOrDoubleOrIntOrIntOrLSPArrayOrLSPObjectOrNullOrString': 'ObjectSealed',
  'InlineValueEvaluatableExpressionOrInlineValueTextOrInlineValueVariableLookup':
      'InlineSealed',
  'RelatedFullDocumentDiagnosticReportOrRelatedUnchangedDocumentDiagnosticReport':
      'DocumentDiagnosticReportSealed',
  'BoolDefaultBehaviorOrRangeOrRangeRangeStringPlaceholder': 'RenameSealed',
  'IntOrString': 'IdentifierSealed',
  'WorkspaceFullDocumentDiagnosticReportOrWorkspaceUnchangedDocumentDiagnosticReport':
      'WorkspaceDocumentDiagnosticReportSealed',
  'IntRangeLengthRangeRangeStringTextOrStringText': 'ContentChangeEventSealed',
  'StringOrStringLanguageStringValue': 'MarkedStringSealed',
  'NotebookCellTextDocumentFilterOrTextDocumentFilter': 'DocumentFilterSealed',
  'PatternOrRelativePattern': 'GlobPatternSealed',
  'StringLanguageStringPatternStringSchemeOrStringLanguageStringPatternStringSchemeOrStringLanguageStringPatternStringScheme':
      'TextDocumentFilterSealed',
  'StringNotebookTypeStringPatternStringSchemeOrStringNotebookTypeStringPatternStringSchemeOrStringNotebookTypeStringPatternStringScheme':
      'NotebookDocumentFilterSealed',
  'DocumentSelectorOrNull': 'DocumentSelectorSealed',
  'CreateFileOrDeleteFileOrRenameFileOrTextDocumentEdit':
      'DocumentChangeSealed',
  'InlayHintLabelPartsOrString': 'HintLabelSealed',
  'MarkupContentOrString': 'TooltipSealed',
  'FullDocumentDiagnosticReportOrUnchangedDocumentDiagnosticReport':
      'RelatedDocumentSealed',
  'StringOrStringValue': 'InsertTextSealed',
  'StringOrStrings': 'StringsSealed',
  'InsertReplaceEditOrTextEdit': 'TextEditSealed',
  'RangeOrRangeInsertRangeReplace': 'EditRangeSealed',
  'MarkedStringOrMarkedStringsOrMarkupContent': 'HoversContentSealed',
  'LocationOrStringUri': 'SymbolLocationSealed',
  'OrBool': 'SemanticTokensRangeSealed',
  'BoolOrBoolDelta': 'SemanticTokensSealed',
  'AnnotatedTextEditOrTextEdit': 'EditsSealed',
  'IntOrNull': 'IntOrNullSealed',
  'NullOrString': 'StringOrNullSealed',
  'NullOrWorkspaceFolders': 'NullOrWorkspaceFoldersSealed',
  'TextDocumentSyncKindOrTextDocumentSyncOptions': 'TextDocumentSyncSealed',
  'NotebookDocumentSyncOptionsOrNotebookDocumentSyncRegistrationOptions':
      'NotebookDocumentSyncSealed',
  'BoolOrHoverOptions': 'HoverProviderSealed',
  'BoolOrDeclarationOptionsOrDeclarationRegistrationOptions':
      'DeclarationProviderSealed',
  'BoolOrDefinitionOptions': 'DefinitionProviderSealed',
  'BoolOrTypeDefinitionOptionsOrTypeDefinitionRegistrationOptions':
      'TypeDefinitionProviderSealed',
  'BoolOrImplementationOptionsOrImplementationRegistrationOptions':
      'ImplementationProviderSealed',
  'BoolOrReferenceOptions': 'ReferencesProviderSealed',
  'BoolOrDocumentHighlightOptions': 'DocumentHighlightProviderSealed',
  'BoolOrDocumentSymbolOptions': 'DocumentSymbolProviderSealed',
  'BoolOrCodeActionOptions': 'CodeActionProviderSealed',
  'BoolOrDocumentColorOptionsOrDocumentColorRegistrationOptions':
      'ColorProviderSealed',
  'BoolOrWorkspaceSymbolOptions': 'WorkspaceSymbolProviderSealed',
  'BoolOrDocumentFormattingOptions': 'DocumentFormattingProviderSealed',
  'BoolOrDocumentRangeFormattingOptions':
      'DocumentRangeFormattingProviderSealed',
  'BoolOrRenameOptions': 'RenameProviderSealed',
  'BoolOrFoldingRangeOptionsOrFoldingRangeRegistrationOptions':
      'FoldingRangeProviderSealed',
  'BoolOrSelectionRangeOptionsOrSelectionRangeRegistrationOptions':
      'SelectionRangeProviderSealed',
  'BoolOrCallHierarchyOptionsOrCallHierarchyRegistrationOptions':
      'CallHierarchyProviderSealed',
  'BoolOrLinkedEditingRangeOptionsOrLinkedEditingRangeRegistrationOptions':
      'LinkedEditingRangeProviderSealed',
  'SemanticTokensOptionsOrSemanticTokensRegistrationOptions':
      'SemanticTokensProviderSealed',
  'BoolOrMonikerOptionsOrMonikerRegistrationOptions': 'MonikerProviderSealed',
  'BoolOrTypeHierarchyOptionsOrTypeHierarchyRegistrationOptions':
      'TypeHierarchyProviderSealed',
  'BoolOrInlineValueOptionsOrInlineValueRegistrationOptions':
      'InlineValueProviderSealed',
  'BoolOrInlayHintOptionsOrInlayHintRegistrationOptions':
      'InlayHintProviderSealed',
  'DiagnosticOptionsOrDiagnosticRegistrationOptions':
      'DiagnosticProviderSealed',
  'BoolOrInlineCompletionOptions': 'InlineCompletionProviderSealed',
  'BoolOrSaveOptions': 'SaveSealed',
  'NotebookDocumentFilterOrStringNotebookStringLanguagesCellsOrNotebookDocumentFilterOrStringNotebookStringLanguagesCells':
      'NotebookSelectorSealed',
  'BoolOrString': 'ChangeNotificationsSealed',
  'StringOrTupleRef': 'SignatureInformationSealed',
  'NotebookDocumentFilterOrString': 'NotebookFilterSealed',
  'StringOrWorkspaceFolder': 'WorkspaceFolderSealed',
};
