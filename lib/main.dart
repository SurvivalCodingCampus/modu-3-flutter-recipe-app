import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/mock/mock_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/presentation/home/saved_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/home/saved_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/repository/recipe_repository_impl.dart';

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
      home: SavedRecipesScreen(
        viewModel: SavedRecipesViewModel(repository)..loadRecipesData(),
      ),
    );
  }
}
