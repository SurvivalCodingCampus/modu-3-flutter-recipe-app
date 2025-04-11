import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component_test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ComponentTestScreen(),
    );
  }
}
