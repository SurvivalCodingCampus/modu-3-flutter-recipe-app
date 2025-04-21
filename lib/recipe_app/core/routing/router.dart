import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/routing/routes.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen.dart';
import 'package:recipe_app/recipe_app/presentation/ingredient_screen/ingredient_screen.dart';
import 'package:recipe_app/recipe_app/presentation/main_screen/bottom_navigation_bar_scaffold.dart';
import 'package:recipe_app/recipe_app/presentation/my_page/my_page_screen.dart';
import 'package:recipe_app/recipe_app/presentation/notification/notification_screen.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen.dart';

import '../di/di_setup.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(viewModel: getIt()),
    ),
    GoRoute(
      path: Routes.signIn,
      name: 'SignIn',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: Routes.signUp,
      name: 'SignUp',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: Routes.ingredientScreen,
      name: 'IngredientScreen',
      builder: (context, state) => const IngredientScreen(),
    ),
    GoRoute(
      path: Routes.searchRecipes,
      name: 'SearchRecipesScreen',
      builder:
          (context, state) => SearchRecipesScreen(
            searchRecipesViewModel: getIt(),
            filterSearchViewModel: getIt(),
            savedRecipesViewModel: getIt(),
          ),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder:
          (context, state, child) => BottomNavigationBarScaffold(child: child),
      routes: [
        GoRoute(
          path: Routes.homeScreen,
          pageBuilder:
              (context, state) => NoTransitionPage(
                child: HomeScreen(filterSearchViewModel: getIt()),
              ),
        ),
        GoRoute(
          path: Routes.savedRecipes,
          pageBuilder:
              (context, state) => NoTransitionPage(
                child: SavedRecipesScreen(savedRecipesViewModel: getIt()),
              ),
        ),
        GoRoute(
          path: Routes.notificationScreen,
          pageBuilder:
              (context, state) => NoTransitionPage(child: NotificationScreen()),
        ),
        GoRoute(
          path: Routes.myPageScreen,
          pageBuilder:
              (context, state) => NoTransitionPage(child: MyPageScreen()),
        ),
      ],
    ),
  ],
);
