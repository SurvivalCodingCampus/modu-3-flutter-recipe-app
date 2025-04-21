import 'package:flutter/material.dart';
import 'package:recipe_app/app/routing/router_path.dart';
import 'package:recipe_app/app/di/di.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
