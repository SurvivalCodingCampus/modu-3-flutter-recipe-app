import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final Widget bottomNavigationBar;

  const MainScreen({
    super.key,
    required this.body,
    required this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main')),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
