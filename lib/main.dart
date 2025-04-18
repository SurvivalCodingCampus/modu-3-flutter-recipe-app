import 'package:flutter/material.dart';
import 'package:recipe_app/core/di/di_set.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/ui/color_styles.dart';

void main() {
  di();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorStyle.primary60),
      ),
    );
  }
}
