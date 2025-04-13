import 'package:flutter/material.dart';
import 'package:recipe_app/data_source/recipe/recipe_data_source_impl.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/repository/recipe/recipe_repository_impl.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SavedRecipesScreen(
        savedRecipesViewModel: SavedRecipesViewModel(
          (RecipeRepositoryImpl(RecipeDataSourceImpl())),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
