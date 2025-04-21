// lib/core/router.dart
import 'package:go_router/go_router.dart';
import 'package:recipe_app/domain/entity/recipe_model.dart';
import 'package:recipe_app/presentation/screen/ingredient/ingredient_screen.dart';
import 'package:recipe_app/presentation/screen/splash/splash_screen.dart';
import 'package:recipe_app/presentation/screen/signIn/sign_in_screen.dart';
import 'package:recipe_app/presentation/screen/signUp/sign_up_screen.dart';
import 'package:recipe_app/presentation/screen/main/main_screen.dart';

class RouterPath {
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String main = '/main';
  static const String ingredient = '/ingredient';
}

final GoRouter router = GoRouter(
  initialLocation: RouterPath.splash,
  routes: [
    GoRoute(
      path: RouterPath.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouterPath.signIn,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: RouterPath.signUp,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: RouterPath.main,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: RouterPath.ingredient,
      builder: (context, state) {
        final recipe = state.extra as Recipe; 
        return IngredientScreen(recipe: recipe); 
      },
    ),
  ],
);
