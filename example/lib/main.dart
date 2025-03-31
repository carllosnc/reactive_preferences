import 'package:example/components/decrement.dart';
import 'package:example/components/increment.dart';
import 'package:flutter/material.dart';
import 'package:reactive_preferences/reactive_preferences.dart';
import 'preferences/counter.dart';
import 'preferences/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RP.init();
  Counter.init();
  AppTheme.init();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with RPMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: AppTheme.value ? Brightness.light : Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reactive Preferences'),
          actions: [
            IconButton(
              onPressed: () {
                AppTheme.toggleTheme();
              },
              icon: Icon(AppTheme.value ? Icons.dark_mode : Icons.light_mode),
            ),
          ],
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
