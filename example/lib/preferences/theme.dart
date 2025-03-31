import 'package:reactive_preferences/reactive_preferences.dart';

class AppTheme {
  static final key = 'theme';

  static init() {
    RP.initValue(
      init: () => RP.prefs.setBool(key, true),
      current: () => RP.prefs.getBool(key),
    );
  }

  static get value => RP.prefs.getBool(key)!;

  static toggleTheme() {
    RP.action((prefs) {
      var theme = prefs.getBool(key)!;
      prefs.setBool(key, !theme);
    });
  }
}
