import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/pages/auth/sign_up_screen.dart';
import 'package:recipe_app/presentation/pages/auth/sing_in_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/search/screen/search_screen.dart';
import 'package:recipe_app/presentation/pages/splash/splash_screen.dart';

final router = GoRouter(initialLocation: AppRoutes.splash, routes: routes);

final routes = [
  GoRoute(
    path: AppRoutes.splash,
    builder: (context, state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.signIn,
    builder: (context, state) {
      return const SingInScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.signUp,
    builder: (context, state) {
      return const SingUpScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.savedRecipes,
    builder: (context, state) {
      return const SavedRecipesScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.search,
    builder: (context, state) {
      return const SearchScreen();
    },
  ),
];

abstract class AppRoutes {
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';
  static const String savedRecipes = '/saved-recipes';

  static const String search = '/search';
}
