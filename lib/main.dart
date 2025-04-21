import 'package:flutter/material.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/router.dart';

void main() {
  diSetUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
