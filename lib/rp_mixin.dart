import 'package:flutter/material.dart';
import 'rp_container.dart';

mixin RPMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    RP.addListener(action);
  }

  @override
  void dispose() {
    super.dispose();
    RP.removeListener(action);
  }

  void action() {
    setState(() {});
  }
}
