import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import 'data/data_source/recipe/recipe_data_source_impl.dart';
import 'data/repository/recipe_repository/recipe_repository_impl.dart';

void main() {
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  final SearchRecipesViewModel viewModel = SearchRecipesViewModel(
    RecipeRepositoryImpl(RecipeDataSourceImpl()),
  );
  final SearchRecipesState state = SearchRecipesState();

  MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SearchRecipesScreen(viewModel: viewModel),
    );
  }
}
