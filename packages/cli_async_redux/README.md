# cli_async_redux

A lightweight Redux implementation for CLI applications with async action support.

## Features

- Async and sync action support
- Action observers for lifecycle monitoring
- State observers for state change tracking
- Error handling with UserException
- Action status tracking
- Conditional waiting for state or actions

## Usage

```dart
import 'package:cli_async_redux/cli_async_redux.dart';

// Define your state
class AppState {
  final String data;
  AppState(this.data);
}

// Define your actions
class MyAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    // Your async logic here
    return AppState('new data');
  }
}

// Create a store
final store = Store<AppState>(initialState: AppState('initial'));

// Dispatch actions
await store.dispatchAndWait(MyAction());
```
