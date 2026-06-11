// ignore_for_file: type=lint

// GENERATED — do not edit.

import 'structures.dart';

/// Information about where a symbol is defined.
///
/// Provides additional metadata over normal `location` definitions, including
/// the range of the defining symbol
typedef DefinitionLink = LocationLink;

/// LSP arrays.
///
/// @since 3.17.0
typedef LSPArray = List<LSPAny>;

/// The LSP any type. Please note that strictly speaking a property with the
/// value `undefined` can't be converted into JSON preserving the property name.
/// However for convenience it is allowed and assumed that all these properties
/// are optional as well.
///
/// @since 3.17.0
typedef LSPAny = Object;

/// Information about where a symbol is declared.
///
/// Provides additional metadata over normal `location` declarations, including
/// the range of the declaring symbol.
///
/// Servers should prefer returning `DeclarationLink` over `Declaration` if
/// supported by the client.
typedef DeclarationLink = LocationLink;

/// A document selector is the combination of one or many document filters.
///
/// @sample `let sel:DocumentSelector = [{ language: 'typescript' }, { language:
/// 'json', pattern: '**∕tsconfig.json' }]`;
///
/// The use of a string as a document filter is deprecated
///
/// @since 3.16.0.
typedef DocumentSelector = List<DocumentFilter>;

/// An identifier to refer to a change annotation stored with a workspace edit.
typedef ChangeAnnotationIdentifier = String;

/// A document filter describes a top level text document or a notebook cell
/// document.
///
/// - proposed support for NotebookCellTextDocumentFilter.
///
/// @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
typedef DocumentFilter = Object;

/// LSP object definition.
///
/// @since 3.17.0
typedef LSPObject = Map<String, LSPAny>;

/// The glob pattern. Either a string pattern or a relative pattern.
///
/// @since 3.17.0
typedef GlobPattern = Object;

/// A document filter denotes a document by different properties like the
/// `language`, the `scheme` of its resource, or a glob-pattern that is applied
/// to the `path`.
///
/// Glob patterns can have the following syntax: - `*` to match zero or more
/// characters in a path segment - `?` to match on one character in a path
/// segment - `**` to match any number of path segments, including none - `{}`
/// to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}` matches
/// all TypeScript and JavaScript files) - `[]` to declare a range of characters
/// to match in a path segment (e.g., `example.[0-9]` to match on `example.0`,
/// `example.1`, …) - `[!...]` to negate a range of characters to match in a
/// path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`,
/// but not `example.0`)
///
/// @sample A language filter that applies to typescript files on disk: `{
/// language: 'typescript', scheme: 'file' }` @sample A language filter that
/// applies to all package.json paths: `{ language: 'json', pattern:
/// '**package.json' }`
///
/// @since 3.17.0
typedef TextDocumentFilter = Object;

/// A notebook document filter denotes a notebook document by different
/// properties. The properties will be match against the notebook's URI (same as
/// with documents)
///
/// @since 3.17.0
typedef NotebookDocumentFilter = Object;

/// The glob pattern to watch relative to the base path. Glob patterns can have
/// the following syntax: - `*` to match zero or more characters in a path
/// segment - `?` to match on one character in a path segment - `**` to match
/// any number of path segments, including none - `{}` to group conditions (e.g.
/// `**​/*.{ts,js}` matches all TypeScript and JavaScript files) - `[]` to
/// declare a range of characters to match in a path segment (e.g.,
/// `example.[0-9]` to match on `example.0`, `example.1`, …) - `[!...]` to
/// negate a range of characters to match in a path segment (e.g.,
/// `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
///
/// @since 3.17.0
typedef Pattern = String;
