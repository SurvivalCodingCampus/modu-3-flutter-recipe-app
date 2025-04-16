import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source.dart';
import 'package:recipe_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'package:recipe_app/test_screen/component_test_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder:
          (context, state, child) => BottomNavigationBarScreen(child: child),
      routes: [
        GoRoute(
          path: Routes.home,
          builder:
              (context, state) => HomeScreen(
                viewModel: SearchRecipesViewModel(
                  recipeRepository: MockRecipeRepositoryImpl(
                    recipeDataSource: MockRecipeDataSource(
                      client: http.Client(),
                      url: 'testUrl',
                    ),
                  ),
                ),
              ),
        ),
        GoRoute(
          path: Routes.savedRecipes,
          builder:
              (context, state) => SavedRecipesScreen(
                viewModel: SavedRecipesViewModel(
                  getSavedRecipesUseCase: GetSavedRecipesUseCase(
                    recipeRepository: MockRecipeRepositoryImpl(
                      recipeDataSource: MockRecipeDataSource(
                        client: http.Client(),
                        url: 'url',
                      ),
                    ),
                  ),
                ),
              ),
        ),
      ],
    ),

    GoRoute(path: "/", builder: (context, state) => ComponentTestScreen()),

    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpScreen()),

    GoRoute(
      path: Routes.search,
      builder:
          (context, state) => SearchRecipesScreen(
            viewModel: SearchRecipesViewModel(
              recipeRepository: MockRecipeRepositoryImpl(
                recipeDataSource: MockRecipeDataSource(
                  client: http.Client(),
                  url: 'testUrl',
                ),
              ),
            ),
          ),
    ),
  ],
);
