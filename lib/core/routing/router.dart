import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/dev_components.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:recipe_app/presentation/login/login_screen.dart';
import 'package:recipe_app/presentation/main_tab/home/home_screen_root.dart';
import 'package:recipe_app/presentation/main_tab/home/home_view_model.dart';
import 'package:recipe_app/presentation/main_tab/tab_screen/main_tab_screen_root.dart';
import 'package:recipe_app/presentation/main_tab/tab_screen/main_tab_view_model.dart';
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

    GoRoute(
      path: Routes.ingredient,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return IngredientScreen(recipeId: id, viewModel: getIt());
      },
    ),

    // 로그인 이후의 메인 탭 구조
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, shell) => MainTabScreenRoot(
            viewModel: getIt<MainTabViewModel>(),
            navigationShell: shell,
          ),
      branches: [
        // 홈 탭
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.mainHome,
              builder:
                  (context, state) =>
                      HomeScreenRoot(viewModel: getIt<HomeViewModel>()),
            ),
          ],
        ),

        // 북마크 탭
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

        // 생성 탭
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

        // 알림 탭
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

        // 프로필 탭
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
