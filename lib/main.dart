import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/data_source.dart';
import 'package:recipe_app/data/repository/repository.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: SavedRecipesScreen(
        viewModel: SavedRecipesViewModel(
          recipeRepository: RecipeRepositoryImpl(
            recipeDataSource: MockRecipeDataSourceImpl(),
          ),
        )..fetchSavedRecipes(),
      ),
    );
  }
}
