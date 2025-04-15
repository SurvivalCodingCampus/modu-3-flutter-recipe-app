import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/dev_components.dart';
import 'package:recipe_app/presentation/dev_home_screen.dart';
import 'package:recipe_app/presentation/login/login_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    // 스플래시 화면
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    // 메인 화면

    // 메인 화면 (개발용)
    GoRoute(
      path: Routes.devHome,
      builder: (context, state) => const DevHomeScreen(),
    ),

    // 개발용 컴포넌트
    GoRoute(
      path: Routes.devComponents,
      builder: (context, state) => const DevComponents(),
    ),

    // 로그인 화면
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),

    // 저장된 레시피 화면
    GoRoute(
      path: Routes.savedRecipes,
      builder: (context, state) => SavedRecipesScreen.withMock(),
    ),

    // 레시피 검색 화면
    GoRoute(
      path: Routes.search,
      builder: (context, state) => SearchRecipesScreen.withMock(),
    ),
  ],
);
