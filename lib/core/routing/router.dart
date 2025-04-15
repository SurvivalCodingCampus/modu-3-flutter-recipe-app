import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.signUp,
      builder:
          (context, state) =>
              SignUpScreen(onTapSignIn: () => context.go(Routes.signIn)),
    ),
  ],
);
