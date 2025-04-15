import 'package:flutter/widgets.dart';
import 'package:recipe_app/presentation/search_recipes/screen/search_recipes_root.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/test/component_test_screen.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'package:recipe_app/presentation/test/test_screen.dart';

abstract class DefaultRoute {
  static const String splash = '/splash';
  static const String test = '/test';
  static const String components = '/components';
  static const String savedRecipes = '/savedRecipes';
  static const String searchRecipes = '/searchRecipes';

  static Map<String, WidgetBuilder> routes = {
    splash:
        (context) => SplashScreen(
          onStartCooking: () {
            Navigator.of(context).pushReplacementNamed(test);
          },
        ),
    test:
        (context) => TestScreen(
          onComponentButton: () {
            Navigator.of(context).pushNamed(components);
          },
          onSavedRecipeButton: () {
            Navigator.of(context).pushNamed(savedRecipes);
          },
          onSearchRecipeButton: () {
            Navigator.of(context).pushNamed(searchRecipes);
          },
        ),
    components: (context) => const ComponentTestScreen(),
    savedRecipes:
        (context) => SavedRecipeRoot(
          viewModel: SavedRecipesViewModel(
            RecipeRepositoryImpl(RecipeDataSourceImpl()),
          ),
        ),

    searchRecipes:
        (context) => SearchRecipeRoot(
          viewModel: SearchRecipesViewModel(
            RecipeRepositoryImpl(RecipeDataSourceImpl()),
          ),
        ),
  };
}
