import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/routing/routes.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_screen_root.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen_root.dart';
import 'package:recipe_app/recipe_app/presentation/ingredient_screen/ingredient_screen.dart';
import 'package:recipe_app/recipe_app/presentation/main_screen/bottom_navigation_bar_scaffold.dart';
import 'package:recipe_app/recipe_app/presentation/my_page/my_page_screen.dart';
import 'package:recipe_app/recipe_app/presentation/notification/notification_screen.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_screen_root.dart';
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
    // Splash 화면
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreen(viewModel: getIt()),
    ),

    // 로그인 화면
    GoRoute(
      path: Routes.signIn,
      name: 'SignIn',
      builder: (context, state) => const SignInScreen(),
    ),

    // 회원가입 화면
    GoRoute(
      path: Routes.signUp,
      name: 'SignUp',
      builder: (context, state) => const SignUpScreen(),
    ),

    // 재료 화면 (필요 시)
    GoRoute(
      path: Routes.ingredientScreen,
      name: 'IngredientScreen',
      builder: (context, state) => const IngredientScreen(),
    ),

    // 디테일 화면
    GoRoute(
      path: Routes.detailScreenRoot,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return DetailScreenRoot(viewModel: getIt(), recipeId: id);
      },
    ),

    // 검색 화면
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

    // ✅ 로그인 성공하면 들어올 메인화면 (BottomNavigationBar)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BottomNavigationBarScaffold(child: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.homeScreen,
              builder: (context, state) => HomeScreenRoot(viewModel: getIt()),
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
              path: Routes.searchRecipes,
              builder:
                  (context, state) => SearchRecipesScreen(
                    searchRecipesViewModel: getIt(),
                    filterSearchViewModel: getIt(),
                    savedRecipesViewModel: getIt(),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notificationScreen,
              builder: (context, state) => NotificationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.myPageScreen,
              builder: (context, state) => MyPageScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
