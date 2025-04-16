import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/app_dependencies.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/dev_components.dart';
import 'package:recipe_app/presentation/dev_home_screen.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:recipe_app/presentation/login/login_screen.dart';
import 'package:recipe_app/presentation/main_tab/main_tab_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';

GoRouter appRouter(AppDependencies dependencies) {
  return GoRouter(
    initialLocation: Routes.splash,
    routes: [
      // 스플래시 화면
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // 로그인 화면
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: Routes.devComponents,
        builder: (context, state) => const DevComponents(),
      ),

      GoRoute(
        path: Routes.search,
        builder:
            (context, state) => SearchRecipesScreen(
              viewModel: dependencies.searchRecipesViewModel,
            ),
      ),

      GoRoute(
        path: Routes.savedRecipes,
        builder:
            (context, state) => SavedRecipesScreen(
              viewModel: dependencies.savedRecipesViewModel,
            ),
      ),

      GoRoute(
        path: Routes.ingredient,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return IngredientScreen.withMock(id);
        },
      ),

      // 로그인 이후의 메인 탭 구조
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) {
          return MainTabScreen(navigationShell: shell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.devHome,
                builder: (context, state) => const DevHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.mainBookmark,
                builder:
                    (context, state) =>
                        const Scaffold(body: Center(child: Text('bookmark'))),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.mainCreate,
                builder:
                    (context, state) => const Scaffold(
                      body: Center(child: Text('Create Placeholder')),
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.mainNotifications,
                builder:
                    (context, state) => const Scaffold(
                      body: Center(child: Text('notifications')),
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.mainProfile,
                builder:
                    (context, state) =>
                        const Scaffold(body: Center(child: Text('profile'))),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
