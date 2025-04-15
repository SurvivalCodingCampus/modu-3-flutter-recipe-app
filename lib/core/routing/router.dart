import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/first/splash_screen.dart';
import '../../presentation/first/splash_screen_view_model.dart';
import '../../presentation/main/sign_in/sign_in.dart';
import '../../presentation/main/sign_in/sign_in_view_model.dart';
import '../../presentation/main/sign_up/sign_up.dart';
import '../../presentation/main/sign_up/sign_up_view_model.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUp(viewModel: SignUpViewModel()),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => SignIn(viewModel: SignInViewModel()),
    ),
    GoRoute(
      path: Routes.splash,
      builder:
          (context, state) => SplashScreen(viewModel: SplashScreenViewModel()),
    ),
  ],
);
