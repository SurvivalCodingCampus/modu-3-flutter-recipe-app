import 'package:flutter/material.dart';
import 'package:recipe_app/model/ingredient.dart';
import 'package:recipe_app/model/ingredients.dart';
import 'package:recipe_app/model/pictures.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/presentation/home/home_view.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
