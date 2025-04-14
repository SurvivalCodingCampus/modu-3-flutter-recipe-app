import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'package:recipe_app/data/repository/recipe/recipe_repository_impl.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchRecipesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
