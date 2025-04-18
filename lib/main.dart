import 'package:flutter/material.dart';
import 'package:recipe_app/core/routing/router.dart';

import 'core/di/di_setup.dart';

void main() {
  diSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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

// @immutable
// class Person {
//   final String name;
//
//   const Person(this.name);
// }
