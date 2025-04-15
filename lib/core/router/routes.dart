import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/pages/auth/sing_in_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/home/home_screen.dart';
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
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.home,
    builder: (context, state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: AppRoutes.search,
    builder: (context, state) {
      return const SplashScreen();
    },
  ),
];

abstract class AppRoutes {
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';

  static const String search = '/search';
}
