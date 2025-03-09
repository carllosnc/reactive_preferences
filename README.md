# Reactive Preferences

>TLDR: Use shared_preferences as a reactive state management.

## Install

This is a unpublished package, so you need to add it to your pubspec.yaml file.

```yml
dependencies:
  localize:
    git:
      url: https://github.com/carllosnc/reactive_preferences.git
```

To more information about unplublished packages, see: https://dart.dev/tools/pub/package-layout#unpublished-packages

## 1️⃣ - Create a class for your value

```dart
import 'package:reactive_preferences/reactive_preferences.dart';

class Counter {
  static final key = 'counter';

  static init() {
    RP.initValue(
      init: () => RP.prefs.setInt(key, 0),
      current: () => RP.prefs.getInt(key),
    );
  }

  static get value => RP.prefs.getInt(key)!;

  static increment() {
    RP.action((prefs) {
      var counter = prefs.getInt(key)!;
      prefs.setInt(key, counter + 1);
    });
  }

  static decrement() {
    RP.action((prefs) {
      var counter = prefs.getInt(key)!;
      prefs.setInt(key, counter - 1);
    });
  }
}
```

> [!TIP]
> Create a class for any value specifing the key, default value and transform function.

## 2️⃣ - Initialize RP object and all values on app start

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize RP object
  await RP.init();

  // Initialize counter value
  Counter.init();

  runApp(const MainApp());
}
```

## 3️⃣ - Use the class in your widget with `RPMixin`

```dart
class IncrementButton extends StatefulWidget {
  const IncrementButton({super.key});

  @override
  State<IncrementButton> createState() => _IncrementButtonState();
}

class _IncrementButtonState extends State<IncrementButton> with RPMixin {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Counter.increment();
      },
      child: Text("Increment: ${Counter.value}"),
    );
  }
}
```

That's it! Now, whenever the value of `Counter` changes, the button will automatically update.

## RPMixin

`RPMixin` is a Flutter mixin designed to be used with StatefulWidget classes. It automatically connects a widget's state to the reactive preferences system, causing the widget to rebuild whenever reactive preferences change.

This mixin simplifies the implementation of widgets that need to react to changes in shared preferences by:

- Automatically registering a listener when the widget is initialized
- Properly cleaning up the listener when the widget is disposed
- Triggering a state rebuild when preference changes occurd

## RP Object

`RP` is a global object that provides a reactive interface to Flutter's SharedPreferences. It allows application data to be both persistent and reactive, automatically notifying UI components when values change.

**Properties:**

### `RP.prefs`

A SharedPreferences instance that provides direct access to the device's persistent storage.

- **type**: `SharedPreferences`
- **usage**: `RP.prefs.getString('key') or RP.prefs.setString('key', 'value')`

To more information about SharedPreferences, see: https://pub.dev/packages/shared_preferences

### `RP.init()`

Initializes the shared preferences instance. This methos should be called before on app start.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RP.init(); 👈

  runApp(const MainApp());
}
```

### `RP.initValue()`

Initializes a preference value if it doesn't already exist.

**Signature:** `void initValue({required dynamic Function() current, required dynamic Function() init})`

**Parameters:**
- current: Function that retrieves the current value
- init: Function that sets the initial value if none exists

**Example:**
```dart
  RP.initValue(
    current: () => RP.prefs.getString('username'),
    init: () => RP.prefs.setString('username', 'Guest'),
  );
```

### `RP.action()`

Executes a preference modification and notifies listeners of the change.

**Signature:** `void action(Action callback)`

**Example:**
```dart
RP.action((prefs) {
  prefs.setString('username', 'NewUser');
});
```
---

License: MIT
Carlos Costa @ 2025

