import 'package:flutter/material.dart';
import 'package:reactive_preferences/reactive_preferences.dart';
import '../preferences/counter.dart';

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
