import 'package:example/components/decrement.dart';
import 'package:example/components/increment.dart';
import 'package:flutter/material.dart';
import 'package:reactive_preferences/reactive_preferences.dart';
import 'data/reactive_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RP.init();
  Counter.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reactive Preferences'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IncrementButton(),
              DecrementButton(),
            ],
          ),
        ),
      ),
    );
  }
}
