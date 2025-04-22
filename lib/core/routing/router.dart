import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/example_screen/preview_main.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/home_screen.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/main_navigation_bar.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/profile/profile_screen.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/recipe_detail_screen.dart';
import 'package:recipe_app/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/screen/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/screen/splash/splash_screen.dart';

import '../../presentation/screen/main_naivation_bar/notification/notification_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    // 인증관련 화면
    GoRoute(
      path: Routes.splash,
      builder: (conttext, state) => SplashScreen(viewModel: getIt()),
    ),
    GoRoute(path: Routes.signIn, builder: (conttext, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (conttext, state) => SignUpScreen()),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainNavigationBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) {
                return HomeScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipe,
              builder: (context, state) {
                return SavedRecipesScreen(viewModel: getIt());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notification,
              builder: (context, state) => NotificationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    // 상태 유지
    StatefulShellRoute.indexedStack(
      builder: (
        context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return navigationShell;
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.search,
              builder:
                  (context, state) => SearchRecipesScreen(viewModel: getIt()),
            ),
          ],
        ),
      ],
    ),

    // 레시피 상세화면
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) {
        final recipeId = state.pathParameters['recipeId'];
        return RecipeDetailScreen(
          recipeId: int.parse(recipeId!),
          viewModel: getIt(),
        );
      },
    ),
    // 예시화면
    GoRoute(path: Routes.example, builder: (conttext, state) => PreviewMain()),
  ],
);
