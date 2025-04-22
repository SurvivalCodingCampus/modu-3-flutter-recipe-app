import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/dev_components.dart';
import 'package:recipe_app/presentation/dev_home_screen.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:recipe_app/presentation/login/login_screen.dart';
import 'package:recipe_app/presentation/main_tab/main_tab_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen_root.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';

final appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    // 스플래시 화면
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(viewModel: getIt()),
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

    // StatefulShellRoute.indexedStack(
    //   builder: (context, state, StatefulNavigationShell shell) {
    //     return shell;
    //   },
    //   branches: [
    //     StatefulShellBranch(
    //       routes: [
    //
    //       ],
    //     ),
    //   ],
    // ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => SavedRecipesScreenRoot(viewModel: getIt()),
    ),

    GoRoute(
      path: Routes.ingredient,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return IngredientScreen(recipeId: id, viewModel: getIt());
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
              path: Routes.savedRecipes,
              builder:
                  (context, state) =>
                      SavedRecipesScreenRoot(viewModel: getIt()),
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
