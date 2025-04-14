import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen.dart';

import 'recipe_app/data/repository/recipe_repository.dart';
import 'recipe_app/data/repository/recipe_repository_impl.dart';
import 'recipe_app/data_source/mock/mock_recipe_data_impl.dart';
import 'recipe_app/presentation/filter_search/filter_search_view_model.dart';

void main() {
  MockRecipeDataImpl mockRecipeDataImpl = MockRecipeDataImpl();
  RecipeRepository repository = RecipeRepositoryImpl(
    recipeDataSource: mockRecipeDataImpl,
  );
  FilterSearchViewModel filterSearchViewModel = FilterSearchViewModel(
    repository,
  );
  runApp(
    MyApp(repository: repository, filterSearchViewModel: filterSearchViewModel),
  );
}

class MyApp extends StatelessWidget {
  final RecipeRepository repository;
  final FilterSearchViewModel filterSearchViewModel;

  const MyApp({
    super.key,
    required this.repository,
    required this.filterSearchViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        repository: repository,
        filterSearchViewModel: filterSearchViewModel,
      ),
    );
  }
}
