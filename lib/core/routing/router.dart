import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data/data_source/recipes/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/recipes/recipe_data_source_impl.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/common/component/nav_bar_component.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/page/home/home_screen.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/page/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/page/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/page/splash/splash_screen.dart';
import 'package:recipe_app/presentation/page/splash/splash_view_model.dart';
import 'package:recipe_app/data/repository/recipes/recipe_repository_impl.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder:
          (context, state) =>
              SplashScreen(splashViewModel: SplashViewModel()..stateChange()),
    ),

    GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpScreen()),
    GoRoute(
      path: Routes.search,
      builder:
          (context, state) => SearchRecipesScreen(
            viewModel: DiSetup().getIt(),
          ),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(child: child),
              NavBarComponent(nowPageState: GoRouterState.of(context).fullPath),
            ],
          ),
          backgroundColor: ColorStyle.white,
        );
      },
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder:
              (context, state) => NoTransitionPage(child: HomeScreen()),
        ),

        GoRoute(
          path: Routes.savedRecipes,
          pageBuilder:
              (context, state) => NoTransitionPage(
                child: SavedRecipesScreen(
                  viewModel: DiSetup().getIt(),
                ),
              ),
        ),
      ],
    ),
  ],
);
