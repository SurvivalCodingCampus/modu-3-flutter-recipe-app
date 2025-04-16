import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ingredient/splash/splash_screen.dart';
import 'core/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
