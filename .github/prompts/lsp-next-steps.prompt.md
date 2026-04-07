---
description: "Составить детальный план реализации следующих шагов LSP генератора: visitor, IR (ResolvedState), resolver, emitter"
agent: "agent"
argument-hint: "Уточнение или фокус (например: только visitor, или только IR-типы)"
---

## Контекст проекта

Это Dart CLI-инструмент для генерации LSP-биндингов из официальной мета-модели Microsoft.

Архитектура:

- `cli_async_redux` — кастомный Redux-движок: `Store`, `BaseAction`, observers
- `AppState` содержит `MetaState` (сырой `MetaProtocol?` + `outputDir`)
- `MetaProtocol` — freezed-модель распарсенного `metaModel.json`; содержит `structures`, `enumerations`, `typeAliases`, `requests`, `notifications`
- Ключевой тип — `MetaReference` (sealed, 8 вариантов: `TypeRef`, `BaseRef`, `ArrayRef`, `MapRef`, `OrRef`, `AndRef`, `LiteralRef`, `StringLiteralRef`, `TupleRef`)
- Текущий `GenerateCommand` уже диспатчит `FetchLSPModelAction` + `FetchLSPLicenseAction`
- `packages/lsp_generator/lib/src/visiter/` — пустая директория, задел для обхода

Прочитай ключевые файлы перед планированием:

- [app_state.dart](../../packages/lsp_generator/lib/src/redux/app_state.dart)
- [meta_state.dart](../../packages/lsp_generator/lib/src/redux/meta/meta_state.dart)
- [protocol.dart](../../packages/lsp_generator/lib/src/redux/models/protocol.dart)
- [generate.dart](../../packages/lsp_generator/lib/src/runner/commands/generate.dart)
- [base_action.dart](../../packages/lsp_generator/lib/src/redux/common/base_action.dart)
- [selectors.dart](../../packages/lsp_generator/lib/src/redux/common/selectors.dart)

## Задача

Составь детальный план реализации трёх слоёв:

### Слой 1 — Базовый Visitor

Механизм обхода дерева `MetaProtocol`. Не генерирует код — только даёт структуру для traverse.

План должен включать:

- Сигнатуры методов visitor-интерфейса (что принимает, что возвращает)
- Как обрабатывать рекурсивный `MetaReference` (8 вариантов через `when`/`map`)
- Где разместить файлы (`visiter/`)

### Слой 2 — IR (Intermediate Representation / ResolvedState)

Промежуточное представление: все ссылки разрешены, анонимные типы выдернуты, nullability определена.

План должен включать:

- Полный набор IR-типов (`ResolvedType`, `ResolvedDecl` и их наследников)
- Как разместить `ResolvedState` в `AppState` (новый slice рядом с `MetaState`)
- Правила преобразования `MetaReference` → `ResolvedType`:
  - `OrRef([T, null])` → `NullableType(T)`
  - `OrRef([A, B, C])` → `UnionType` / inline sealed class
  - `LiteralRef` → анонимный `ResolvedClass` с синтетическим именем
  - `BaseRef(name)` → маппинг на Dart-примитивы (`string`→`String`, `integer`→`int`, `null`→`Null`, `URI`→`Uri`, ...)
- Как разрешать `extends$` / `mixins$` (flatten vs. сохранить иерархию)
- `ResolveModelAction`: где диспатчится, что читает из state, что пишет

### Слой 3 — EmitterVisitor

Обходит IR и генерирует `.dart`-файлы.

План должен включать:

- Какие файлы генерируются (один на структуру? один на namespace? один общий?)
- Нужен ли `@freezed` в выходных файлах или plain Dart
- Как используется `cli_utils` для записи файлов
- `GenerateCodeAction`: как диспатчится после `ResolveModelAction`

## Формат ответа

Для каждого слоя:

1. **Файловая структура** — конкретные пути и имена файлов
2. **Ключевые типы/классы** — сигнатуры (не реализация)
3. **Порядок реализации** — что сделать первым, что зависит от чего
4. **Открытые вопросы** — неоднозначные решения, которые нужно принять до старта

Если переданы аргументы (уточнение фокуса) — углубись именно в этот слой.
