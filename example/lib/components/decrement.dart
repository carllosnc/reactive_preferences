import 'package:flutter/material.dart';
import 'package:reactive_preferences/reactive_preferences.dart';
import '../data/reactive_preferences.dart';

class DecrementButton extends StatefulWidget {
  const DecrementButton({super.key});

  @override
  State<DecrementButton> createState() => _DecrementButtonState();
}

class _DecrementButtonState extends State<DecrementButton> with RPMixin {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        Counter.decrement();
      },
      child: Text("Decrement: ${Counter.value}"),
    );
  }
}
