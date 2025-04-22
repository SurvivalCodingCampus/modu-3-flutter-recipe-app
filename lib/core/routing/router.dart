import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/dev_components.dart';
import 'package:recipe_app/presentation/login/login_screen.dart';
import 'package:recipe_app/presentation/main_tab/home/home_screen_root.dart';
import 'package:recipe_app/presentation/main_tab/home/home_view_model.dart';
import 'package:recipe_app/presentation/main_tab/tab_screen/main_tab_screen_root.dart';
import 'package:recipe_app/presentation/main_tab/tab_screen/main_tab_view_model.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_screen_root.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen_root.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen_root.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';

final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _searchNavigatorKey = GlobalKey<NavigatorState>();

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
      path: Routes.recipeDetail,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return RecipeDetailScreenRoot(recipeId: id, viewModel: getIt());
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
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.mainHome,
              builder:
                  (context, state) =>
                      HomeScreenRoot(viewModel: getIt<HomeViewModel>()),
              routes: [
                GoRoute(
                  path: Routes.search,
                  builder:
                      (context, state) =>
                          SearchRecipesScreenRoot(viewModel: getIt()),
                ),
              ],
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
        // StatefulShellBranch(
        //   navigatorKey: _searchNavigatorKey,
        //   routes: [
        //     GoRoute(
        //       path: Routes.search,
        //       builder:
        //           (context, state) =>
        //               SearchRecipesScreenRoot(viewModel: getIt()),
        //     ),
        //   ],
        // ),
      ],
    ),
  ],
);
