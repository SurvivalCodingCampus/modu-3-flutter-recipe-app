// lib/core/router.dart
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/pages/home/splash_screen.dart';
import 'package:recipe_app/presentation/component/pages/signIn/sign_in_screen.dart';
import 'package:recipe_app/presentation/component/pages/signUp/sign_up_screen.dart';
import 'package:recipe_app/presentation/component/pages/home/main_screen.dart';

class RouterPath {
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String main = '/main';
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
  ],
);
