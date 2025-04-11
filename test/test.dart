import 'package:flutter/material.dart';

class TestClass extends StatelessWidget {
  final Widget child;

  const TestClass({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Column(children: [child])));
  }
}
