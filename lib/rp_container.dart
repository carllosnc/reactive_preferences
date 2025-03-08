import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef Action = void Function(SharedPreferences);

class _RPContainer extends ChangeNotifier {
  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void initValue({
    required dynamic Function() current,
    required dynamic Function() init,
  }) {
    var currentValue = current();
    if (currentValue == null) {
      init();
    }
  }

  void action(Action callback) {
    callback(prefs);
    notifyListeners();
  }
}

// ignore: non_constant_identifier_names
var RP = _RPContainer();
