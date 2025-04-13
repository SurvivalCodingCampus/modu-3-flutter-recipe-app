import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/first/splash_screen.dart';
import 'package:recipe_app/presentation/first/splash_screen_view_model.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';

import 'data/data_source/recipe/recipe_data_source_impl.dart';
import 'data/repository/recipe_repository/recipe_repository_impl.dart';

void main() {
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  MyRecipeApp({super.key});
  final SplashScreenViewModel viewModel = SplashScreenViewModel();
  final SavedRecipeViewModel viewModel2 = SavedRecipeViewModel(
    RecipeRepositoryImpl(RecipeDataSourceImpl()),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(viewModel: viewModel, viewModel2: viewModel2),
    );
  }
}

// This widget is the root of your application.
