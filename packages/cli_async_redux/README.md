# cli_async_redux

A lightweight Redux implementation for CLI applications with async action support.

## Features

- Async and sync action support
- Action observers for lifecycle monitoring
- State observers for state change tracking
- Error handling with `ReduxException` and structured Unix exit codes
- Action status tracking
- Conditional waiting for state or actions
- Property injection on the store (`setProp` / `prop`)
- Global reducer middleware via `WrapReduce`

## Usage

### Basic setup

```dart
import 'package:cli_async_redux/cli_async_redux.dart';

// 1. Define your state
class AppState {
  final String data;
  AppState(this.data);
}

// 2. Define an action
class LoadDataAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final result = await fetchData();
    return AppState(result);
  }
}

// 3. Create the store
final store = Store<AppState>(initialState: AppState(''));

// 4. Dispatch actions
await store.dispatchAndWait(LoadDataAction());
print(store.state.data);
```

### Sync actions

```dart
class SetDataAction extends ReduxAction<AppState> {
  SetDataAction(this.value);
  final String value;

  @override
  AppState? reduce() => AppState(value); // sync — no Future
}

store.dispatchSync(SetDataAction('hello'));
```

### Error handling

Use `ReduxException` for structured CLI errors with Unix exit codes:

```dart
class FetchAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final response = await http.get(uri);
    if (response.statusCode != 200) {
      throw ReduxException.fromHttpStatus(
        response.statusCode,
        message: 'Failed to fetch data',
      );
    }
    return AppState(response.body);
  }

  @override
  Object? wrapError(Object error, StackTrace st) {
    if (error is SocketException) {
      throw ReduxException.noHost(message: 'Server unreachable');
    }
    return error; // rethrow others unchanged
  }
}
```

Named constructors map to standard Unix `sysexits.h` codes:

| Constructor | Exit code |
| --- | --- |
| `ReduxException.usage(...)` | 64 |
| `ReduxException.noInput(...)` | 66 |
| `ReduxException.unavailable(...)` | 69 |
| `ReduxException.software(...)` | 70 |
| `ReduxException.io(...)` | 74 |
| `ReduxException.temp(...)` | 75 |
| `ReduxException.permission(...)` | 77 |
| `ReduxException.config(...)` | 78 |

### Observers

```dart
class MyActionObserver extends ActionObserver<AppState> {
  @override
  void observe(ReduxAction action, int dispatchCount, {required bool ini}) {
    if (ini) {
      print('→ ${action.runtimeType}');
    } else {
      print('← ${action.runtimeType} [${action.status}]');
    }
  }
}

class MyStateObserver extends StateObserver<AppState> {
  @override
  void observe(ReduxAction action, AppState prev, AppState next,
      Object? error, int dispatchCount) {
    if (error == null) print('state changed: ${prev.data} → ${next.data}');
  }
}

final store = Store<AppState>(
  initialState: AppState(''),
  actionObservers: [MyActionObserver()],
  stateObservers: [MyStateObserver()],
);
```

### Waiting for state

```dart
// Wait until the state satisfies a condition
await store.waitCondition((state) => state.data.isNotEmpty);

// Dispatch and wait for the action AND any actions it triggers
await store.dispatchAndWaitAllActions(LoadDataAction());
```

### Property injection

Attach arbitrary values to the store (e.g. services, configs):

```dart
store.setProp<HttpClient>(HttpClient());
store.setProp<HttpClient>(mockClient, key: 'test'); // keyed

// Retrieve inside an action
final client = store.prop<HttpClient>();

// Clean up
store.disposeProp(client, null);
// or dispose all Timers/Futures/Streams at once:
store.disposeProps();
```

### Global reducer middleware (`WrapReduce`)

```dart
class LoggingWrap extends WrapReduce<AppState> {
  @override
  AppState process({
    required AppState oldState,
    required AppState newState,
    required ReduxAction<AppState> action,
  }) {
    print('${action.runtimeType}: ${oldState.data} → ${newState.data}');
    return newState;
  }
}

final store = Store<AppState>(
  initialState: AppState(''),
  wrapReduce: LoggingWrap(),
);
```
