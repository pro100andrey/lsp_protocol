// ignore_for_file: lines_longer_than_80_chars

const renameLiteralMap = {
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
  'ObjectFullObjectRange': 'Literal33',
  'BoolAdditionalPropertiesSupport': 'Literal34',
};

const renameSealedMap = {
  'LocationOrLocations': 'Sealed1',
  'BoolOrDoubleOrIntOrIntOrLSPArrayOrLSPObjectOrNullOrString': 'Sealed2',
  'InlineValueEvaluatableExpressionOrInlineValueTextOrInlineValueVariableLookup':
      'Sealed3',
  'RelatedFullDocumentDiagnosticReportOrRelatedUnchangedDocumentDiagnosticReport':
      'Sealed4',
  'BoolDefaultBehaviorOrRangeOrRangeRangeStringPlaceholder': 'Sealed5',
  'IntOrString': 'Sealed6',
  'WorkspaceFullDocumentDiagnosticReportOrWorkspaceUnchangedDocumentDiagnosticReport':
      'Sealed7',
  'IntRangeLengthRangeRangeStringTextOrStringText': 'Sealed8',
  'StringOrStringLanguageStringValue': 'Sealed9',
  'NotebookCellTextDocumentFilterOrTextDocumentFilter': 'Sealed10',
  'PatternOrRelativePattern': 'Sealed11',
  'StringLanguageStringPatternStringSchemeOrStringLanguageStringPatternStringSchemeOrStringLanguageStringPatternStringScheme':
      'Sealed12',
  'StringNotebookTypeStringPatternStringSchemeOrStringNotebookTypeStringPatternStringSchemeOrStringNotebookTypeStringPatternStringScheme':
      'Sealed13',
  'DocumentSelectorOrNull': 'Sealed14',
  'CreateFileOrDeleteFileOrRenameFileOrTextDocumentEdit': 'Sealed15',
  'InlayHintLabelPartsOrString': 'Sealed16',
  'MarkupContentOrString': 'Sealed17',
  'FullDocumentDiagnosticReportOrUnchangedDocumentDiagnosticReport': 'Sealed18',
  'StringOrStringValue': 'Sealed19',
  'StringOrStrings': 'Sealed20',
  'InsertReplaceEditOrTextEdit': 'Sealed21',
  'RangeOrRangeInsertRangeReplace': 'Sealed22',
  'MarkedStringOrMarkedStringsOrMarkupContent': 'Sealed23',
  'LocationOrStringUri': 'Sealed24',
  'OrBool': 'Sealed25',
  'BoolOrBoolDelta': 'Sealed26',
  'AnnotatedTextEditOrTextEdit': 'Sealed27',
  'IntOrNull': 'Sealed28',
  'NullOrString': 'Sealed29',
  'NullOrWorkspaceFolders': 'Sealed30',
  'TextDocumentSyncKindOrTextDocumentSyncOptions': 'Sealed31',
  'NotebookDocumentSyncOptionsOrNotebookDocumentSyncRegistrationOptions':
      'Sealed32',
  'BoolOrHoverOptions': 'Sealed33',
  'BoolOrDeclarationOptionsOrDeclarationRegistrationOptions': 'Sealed34',
  'BoolOrDefinitionOptions': 'Sealed35',
  'BoolOrTypeDefinitionOptionsOrTypeDefinitionRegistrationOptions': 'Sealed36',
  'BoolOrImplementationOptionsOrImplementationRegistrationOptions': 'Sealed37',
  'BoolOrReferenceOptions': 'Sealed38',
  'BoolOrDocumentHighlightOptions': 'Sealed39',
  'BoolOrDocumentSymbolOptions': 'Sealed40',
  'BoolOrCodeActionOptions': 'Sealed41',
  'BoolOrDocumentColorOptionsOrDocumentColorRegistrationOptions': 'Sealed42',
  'BoolOrWorkspaceSymbolOptions': 'Sealed43',
  'BoolOrDocumentFormattingOptions': 'Sealed44',
  'BoolOrDocumentRangeFormattingOptions': 'Sealed45',
  'BoolOrRenameOptions': 'Sealed46',
  'BoolOrFoldingRangeOptionsOrFoldingRangeRegistrationOptions': 'Sealed47',
  'BoolOrSelectionRangeOptionsOrSelectionRangeRegistrationOptions': 'Sealed48',
  'BoolOrCallHierarchyOptionsOrCallHierarchyRegistrationOptions': 'Sealed49',
  'BoolOrLinkedEditingRangeOptionsOrLinkedEditingRangeRegistrationOptions':
      'Sealed50',
  'SemanticTokensOptionsOrSemanticTokensRegistrationOptions': 'Sealed51',
  'BoolOrMonikerOptionsOrMonikerRegistrationOptions': 'Sealed52',
  'BoolOrTypeHierarchyOptionsOrTypeHierarchyRegistrationOptions': 'Sealed53',
  'BoolOrInlineValueOptionsOrInlineValueRegistrationOptions': 'Sealed54',
  'BoolOrInlayHintOptionsOrInlayHintRegistrationOptions': 'Sealed55',
  'DiagnosticOptionsOrDiagnosticRegistrationOptions': 'Sealed56',
  'BoolOrInlineCompletionOptions': 'Sealed57',
  'BoolOrSaveOptions': 'Sealed58',
  'NotebookDocumentFilterOrStringNotebookStringLanguagesCellsOrNotebookDocumentFilterOrStringNotebookStringLanguagesCells':
      'Sealed59',
  'BoolOrString': 'Sealed60',
  'StringOrTupleRef': 'Sealed61',
  'NotebookDocumentFilterOrString': 'Sealed62',
  'StringOrWorkspaceFolder': 'Sealed63',
};


// Added sealed symbol: InlayHintLabelPartsOrString
// Added sealed symbol: MarkupContentOrString
// Added sealed symbol: FullDocumentDiagnosticReportOrUnchangedDocumentDiagnosticReport
// Added sealed symbol: StringOrStringValue
// Added sealed symbol: StringOrStrings
// Added sealed symbol: InsertReplaceEditOrTextEdit
// Added sealed symbol: RangeOrRangeInsertRangeReplace
// Added sealed symbol: MarkedStringOrMarkedStringsOrMarkupContent
// Added sealed symbol: LocationOrStringUri
// Added sealed symbol: OrBool
// Added sealed symbol: BoolOrBoolDelta
// Added sealed symbol: AnnotatedTextEditOrTextEdit
// Added sealed symbol: IntOrNull
// Added sealed symbol: NullOrString
// Added sealed symbol: NullOrWorkspaceFolders
// Added sealed symbol: TextDocumentSyncKindOrTextDocumentSyncOptions
// Added sealed symbol: NotebookDocumentSyncOptionsOrNotebookDocumentSyncRegistrationOptions
// Added sealed symbol: BoolOrHoverOptions
// Added sealed symbol: BoolOrDeclarationOptionsOrDeclarationRegistrationOptions
// Added sealed symbol: BoolOrDefinitionOptions
// Added sealed symbol: BoolOrTypeDefinitionOptionsOrTypeDefinitionRegistrationOptions
// Added sealed symbol: BoolOrImplementationOptionsOrImplementationRegistrationOptions
// Added sealed symbol: BoolOrReferenceOptions
// Added sealed symbol: BoolOrDocumentHighlightOptions
// Added sealed symbol: BoolOrDocumentSymbolOptions
// Added sealed symbol: BoolOrCodeActionOptions
// Added sealed symbol: BoolOrDocumentColorOptionsOrDocumentColorRegistrationOptions
// Added sealed symbol: BoolOrWorkspaceSymbolOptions
// Added sealed symbol: BoolOrDocumentFormattingOptions
// Added sealed symbol: BoolOrDocumentRangeFormattingOptions
// Added sealed symbol: BoolOrRenameOptions
// Added sealed symbol: BoolOrFoldingRangeOptionsOrFoldingRangeRegistrationOptions
// Added sealed symbol: BoolOrSelectionRangeOptionsOrSelectionRangeRegistrationOptions
// Added sealed symbol: BoolOrCallHierarchyOptionsOrCallHierarchyRegistrationOptions
// Added sealed symbol: BoolOrLinkedEditingRangeOptionsOrLinkedEditingRangeRegistrationOptions
// Added sealed symbol: SemanticTokensOptionsOrSemanticTokensRegistrationOptions
// Added sealed symbol: BoolOrMonikerOptionsOrMonikerRegistrationOptions
// Added sealed symbol: BoolOrTypeHierarchyOptionsOrTypeHierarchyRegistrationOptions
// Added sealed symbol: BoolOrInlineValueOptionsOrInlineValueRegistrationOptions
// Added sealed symbol: BoolOrInlayHintOptionsOrInlayHintRegistrationOptions
// Added sealed symbol: DiagnosticOptionsOrDiagnosticRegistrationOptions
// Added sealed symbol: BoolOrInlineCompletionOptions
// Added sealed symbol: BoolOrSaveOptions
// Added sealed symbol: NotebookDocumentFilterOrStringNotebookStringLanguagesCellsOrNotebookDocumentFilterOrStringNotebookStringLanguagesCells
// Added sealed symbol: BoolOrString
// Added sealed symbol: StringOrTupleRef
// Added sealed symbol: NotebookDocumentFilterOrString
// Added sealed symbol: StringOrWorkspaceFolder