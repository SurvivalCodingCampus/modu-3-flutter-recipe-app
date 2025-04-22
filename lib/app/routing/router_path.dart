import 'package:go_router/go_router.dart';
import 'package:recipe_app/app/di/di.dart';
import 'package:recipe_app/domain/entity/recipe_model.dart';
import 'package:recipe_app/presentation/screen/ingredient/ingredient_screen.dart';
import 'package:recipe_app/presentation/screen/splash/splash_screen.dart';
import 'package:recipe_app/presentation/screen/signIn/sign_in_screen.dart';
import 'package:recipe_app/presentation/screen/signUp/sign_up_screen.dart';
import 'package:recipe_app/presentation/screen/main/main_screen.dart';
import 'package:recipe_app/presentation/screen/search/search_recipes_screen.dart';

class RouterPath {
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String main = '/main';
  static const String ingredient = '/ingredient';
  static const String search = '/search';
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
    // ✅ search 경로 → 애니메이션 없이 즉시 전환
    GoRoute(
      path: RouterPath.search,
      builder: (context, state) => SearchRecipesScreen(
        repository: getIt(),
      ),
    ),
  ],
);
