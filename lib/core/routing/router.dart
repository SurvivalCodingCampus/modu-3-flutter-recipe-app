import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/sign-in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign-up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder:
          (context, state) =>
              SplashScreen(onTapStart: () => context.go(Routes.signIn)),
    ),
    GoRoute(
      path: Routes.signIn,
      builder:
          (context, state) => SignInScreen(
            onTapSignIn: () {},
            onTapSignUp: () => context.go(Routes.signUp),
          ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder:
          (context, state) =>
              SignUpScreen(onTapSignIn: () => context.go(Routes.signIn)),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => const HomeScreen()),
  ],
);
