import 'package:flutter/material.dart';
import 'package:recipe_app/core/di.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/ui/ui.dart';

void main() {
  diSetUp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorStyles.white,
        appBarTheme: const AppBarTheme(backgroundColor: ColorStyles.white),
      ),
      routerConfig: router,
    );
  }
}
