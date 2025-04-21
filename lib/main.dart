import 'package:flutter/material.dart';
import 'package:recipe_app/core/di/di.dart';
import 'package:recipe_app/router/router.dart';

// import 'presentation/component/component.dart';


void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
