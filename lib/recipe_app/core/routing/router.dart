import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/routing/routes.dart';
import 'package:recipe_app/recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpScreen()),
  ],
);
