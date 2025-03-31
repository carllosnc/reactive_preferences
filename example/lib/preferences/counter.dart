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
