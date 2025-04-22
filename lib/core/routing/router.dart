import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_scene.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/not_found_screen.dart';
import 'package:recipe_app/presentation/notifications/notifications_screen.dart';
import 'package:recipe_app/presentation/profile/profile_screen.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash_screen/splash_screen.dart';
import 'package:recipe_app/presentation/splash_screen/splash_view_model.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder:
            (context, state) =>
                SplashScreen(splashViewModel: getIt<SplashViewModel>()),
      ),

      GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),

      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),

      GoRoute(
        path: Routes.ingredient,
        builder: (context, state) {
          try {
            final id = state.pathParameters[RoutesParameters.ingredientRecipeIdParameter]!;
            return IngredientScreen(
              viewModel: getIt<IngredientViewModel>(param1: id),
            );
          } catch (e) {
            // 404
            return const NotFoundScreen();
          }
        },
      ),

      GoRoute(
        path: Routes.search,
        builder:
            (context, state) =>
                SearchRecipesScreen(viewModel: getIt<SearchRecipesViewModel>()),
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
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.favorites,
                builder:
                    (context, state) => SavedRecipesScreen(
                      savedRecipesViewModel: getIt<SavedRecipesViewModel>(),
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.notifications,
                builder: (context, state) => const NotificationsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
