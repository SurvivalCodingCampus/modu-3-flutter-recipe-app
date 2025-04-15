import 'package:go_router/go_router.dart';
import 'package:recipe_app/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/login/sign_in_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_view_model.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'package:recipe_app/router/routes.dart';

import '../presentation/home/home_screen.dart';
import '../presentation/login/sign_up_screen.dart';
import '../presentation/saved_recipe/saved_recipe_screen.dart';
import '../presentation/saved_recipe/saved_recipe_view_model.dart';
import '../presentation/search_recipes/search_recipe_screen.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    ShellRoute(
      // navigatorKey: _shellNavigatorKey,
      // builder: (context, state, child) =>
      //   BottomNavigationBarScaffod(child:child,
      routes: [
        GoRoute(
          path: Routes.splash,
          builder:
              (context, state) => SplashScreen(
                viewModel: SavedRecipeViewModel(
                  RecipeRepositoryImpl(RecipeDataSourceImpl()),
                ),
              ),
        ),
        GoRoute(
          path: Routes.signIn,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: Routes.signUp,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: Routes.search,
          builder:
              (context, state) => SearchRecipeScreen(
                viewModel: SearchRecipeViewModel(
                  RecipeRepositoryImpl(RecipeDataSourceImpl()),
                ),
              ),
        ),
        GoRoute(
          path: Routes.saved,
          builder:
              (context, state) => SavedRecipeScreen(
                viewModel: SavedRecipeViewModel(
                  RecipeRepositoryImpl(RecipeDataSourceImpl()),
                ),
              ),
        ),
        GoRoute(
          path: Routes.home,
          builder:
              (context, state) => HomeScreen(
                viewModel: SearchRecipeViewModel(
                  RecipeRepositoryImpl(RecipeDataSourceImpl()),
                ),
              ),
        ),
      ],
    ),
  ],
);
