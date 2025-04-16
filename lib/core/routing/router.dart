import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/bottom_navigation_bar_scaffold.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:recipe_app/presentation/login/login_screen.dart';
import 'package:recipe_app/presentation/register/register_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: Routes.splash,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: Routes.ingredient,
      builder:
          (context, state) => IngredientScreen(
            viewModel: ingredientScreenViewModel,
            recipeId: int.parse(state.pathParameters['id']!),
          ),
    ),
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, child) => BottomNavigationBarScaffold(child: child),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => const HomeScreen(),
            ),
            GoRoute(
              path: Routes.bookmarks,
              builder:
                  (context, state) => SavedRecipesScreen(
                    viewModel: SavedRecipesViewModel(
                      getSavedRecipesUseCase,
                      removeSavedRecipesUseCase,
                    ),
                  ),
            ),
          ],
        ),
      ],
    ),
  ],
);
