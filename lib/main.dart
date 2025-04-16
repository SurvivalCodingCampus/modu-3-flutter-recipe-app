import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/app_dependencies.dart';
import 'package:recipe_app/core/routing/router.dart'; // appRouter
import 'package:recipe_app/core/ui/color_style.dart';

void main() {
  final AppDependencies di = AppDependencies();
  final GoRouter router = appRouter(di);

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorStyle.primary100),
      ),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
