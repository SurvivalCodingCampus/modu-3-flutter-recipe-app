import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/filter_screen/filter_screen_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import 'core/di/get_it.dart';

void main() {
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  final FilterScreenViewModel filterScreenViewModel = FilterScreenViewModel();
  final SearchRecipesViewModel viewModel = SearchRecipesViewModel(getIt());
  final SearchRecipesState state = SearchRecipesState();

  MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SearchRecipesScreen(
        viewModel: viewModel,
        filterScreenViewModel: getIt(),
      ),
    );
  }
}
