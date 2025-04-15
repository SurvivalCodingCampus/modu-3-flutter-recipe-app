import 'package:flutter/material.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:recipe_app/data/repository/interface/recipe_repository.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/ui/ui.dart';

final RecipeDataSource recipeDataSource = MockRecipeDataSource();
final RecipeRepository recipeRepository = RecipeRepositoryImpl(
  recipeDataSource,
);
final SavedRecipesViewModel savedRecipesViewModel = SavedRecipesViewModel(
  recipeRepository,
);
final SearchRecipesViewModel searchRecipesViewModel = SearchRecipesViewModel(
  recipeRepository,
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorStyles.white,
        appBarTheme: const AppBarTheme(backgroundColor: ColorStyles.white),
      ),
      routerConfig: router,
    );
  }
}
