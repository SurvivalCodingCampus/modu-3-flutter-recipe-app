import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data_source/recipes/recipe_data_source.dart';
import 'package:recipe_app/data_source/recipes/recipe_data_source_impl.dart';
import 'package:recipe_app/presentation/page/home/home_screen.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/page/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/page/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/page/splash/splash_screen.dart';
import 'package:recipe_app/presentation/page/splash/splash_view_model.dart';
import 'package:recipe_app/repository/recipes/recipe_repository_impl.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder:
          (context, state) =>
              SplashScreen(splashViewModel: SplashViewModel()..stateChange()),
    ),

    GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpScreen()),
    GoRoute(
      path: Routes.search,
      builder:
          (context, state) => SearchRecipesScreen(
            viewModel: SearchRecipesViewModel(
              recipeRepository: RecipeRepositoryImpl(
                dataSource: RecipeDataSourceImpl(),
              ),
            ),
          ),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(body: child);
      },
      routes: [
        GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),

        GoRoute(
          path: Routes.savedRecipes,
          builder:
              (context, state) =>
                  SavedRecipesScreen(model: SavedRecipesViewModel()),
        ),
      ],
    ),
  ],
);
