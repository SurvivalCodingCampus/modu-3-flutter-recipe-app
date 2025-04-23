import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/presentation/ingredient/auth/sign_in_screen.dart';
import 'package:recipe_app/presentation/ingredient/auth/sign_up_screen.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/ingredient/splash/splash_screen.dart';
import 'package:recipe_app/presentation/main/home/home_screen_root.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/main/notification/notification_screen.dart';
import 'package:recipe_app/presentation/main/profile/profile_screen.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_screen_root.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen(viewModel: getIt(),)),
    GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpScreen()),
    GoRoute(
      path: Routes.search,
      builder: (context, state) => SearchRecipesScreen(viewModel: getIt()),
    ),
    GoRoute(
      path: Routes.ingredient,
      builder: (context, state) {
        final recipeId = int.parse(state.pathParameters['recipeId'] ?? '-1');
        return RecipeIngredientScreen(
          viewModel: RecipeIngredientViewModel(
            recipeId: recipeId,
            recipeRepository: getIt(),
            userRepository: getIt(),
            procedureRepository: getIt(),
            searchChefByRecipeChef: getIt(),
            toggleBookmarkUseCase: getIt(),
          ),
        );
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => HomeScreenRoot(viewModel: getIt()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder:
                  (context, state) => SavedRecipesScreenRoot(viewModel: getIt()),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notifications,
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
  ],
);
