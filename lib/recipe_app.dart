import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/home_view.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView());
  }
}
