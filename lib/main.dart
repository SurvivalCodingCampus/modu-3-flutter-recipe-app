import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen.dart';

import 'recipe_app/data/repository/recipe_repository.dart';
import 'recipe_app/data/repository/recipe_repository_impl.dart';
import 'recipe_app/data_source/mock/mock_recipe_data_impl.dart';

void main() {
  MockRecipeDataImpl mockRecipeDataImpl = MockRecipeDataImpl();
  RecipeRepository repository = RecipeRepositoryImpl(
    recipeDataSource: mockRecipeDataImpl,
  );
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final RecipeRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(repository: repository),
    );
  }
}
