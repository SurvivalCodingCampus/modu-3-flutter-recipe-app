import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/my/my_screen.dart';
import 'package:recipe_app/presentation/notification/notification_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen_root.dart';
import 'package:recipe_app/presentation/search/search_screen_root.dart';
import 'package:recipe_app/presentation/sign-in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign-up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen_root.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => SplashScreenRoot(viewModel: getIt()),
    ),
    GoRoute(
      path: Routes.signIn,
      builder:
          (context, state) => SignInScreen(
            onTapSignIn: () => context.go(Routes.home),
            onTapSignUp: () => context.go(Routes.signUp),
          ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder:
          (context, state) =>
              SignUpScreen(onTapSignIn: () => context.go(Routes.signIn)),
    ),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => SearchScreenRoot(viewModel: getIt()),
    ),
    GoRoute(
      path: Routes.recipeIngredient,
      builder: (context, state) {
        final id = state.pathParameters['recipeId'];
        return RecipeIngredientScreen(recipeId: id!, viewModel: getIt());
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          body: navigationShell,
          currentPageIndex: navigationShell.currentIndex,
          onChangeIndex: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder:
                  (context, state) => HomeScreen(
                    onTapSearch: () => context.push(Routes.search),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.save,
              builder:
                  (context, state) =>
                      SavedRecipesScreenRoot(viewModel: getIt()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notification,
              builder: (context, state) => const NotificationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.my,
              builder: (context, state) => const MyScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
