import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';

import 'package:recipe_app/presentation/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/home/home_screen_root.dart';

import 'package:recipe_app/presentation/ingredient/ingredient_screen_root.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';

import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen_root.dart';

import 'package:recipe_app/presentation/search_recipes/search_recipes_screen_root.dart';

import 'package:recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'package:recipe_app/test_screen/component_test_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  routes: [
    GoRoute(
      path: Routes.ingredient,
      builder: (context, state) {
        final recipeId = int.parse(state.pathParameters["recipeId"]!);
        final IngredientViewModel viewModel = getIt();

        viewModel.loadRecipe(recipeId);
        viewModel.getUserModel(4);
        return IngredientScreenRoot(viewModel: viewModel);
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder:
          (context, state, child) => BottomNavigationBarScreen(child: child),
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) => HomeScreenRoot(viewModel: getIt()),
        ),
        GoRoute(
          path: Routes.savedRecipes,
          builder:
              (context, state) => SavedRecipesScreenRoot(viewModel: getIt()),
        ),
      ],
    ),

    GoRoute(path: "/", builder: (context, state) => ComponentTestScreen()),

    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(viewModel: getIt()),
    ),
    GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpScreen()),

    GoRoute(
      path: Routes.search,
      builder: (context, state) => SearchRecipesScreenRoot(viewModel: getIt()),
    ),
  ],
);
