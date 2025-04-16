import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:recipe_app/presentation/search_recipes/screen/search_recipes_root.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        return SplashScreen(
          onStartCooking: () {
            context.go(Routes.signIn);
          },
        );
      },
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) {
        return SignInScreen(
          onSignInClick: () {
            context.go(Routes.home);
          },
          onSignUpClick: () {
            context.go(Routes.signUp);
          },
        );
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) {
        return SignUpScreen(
          onSignInClick: () {
            context.go(Routes.signIn);
          },
          onSignUpClick: () {
            context.go(Routes.signIn);
          },
        );
      },
    ),
    GoRoute(
      path: Routes.searchRecipes,
      builder: (context, state) {
        final viewModel = SearchRecipesViewModel(
          RecipeRepositoryImpl(RecipeDataSourceImpl()),
        );

        viewModel.findRecipes();

        return SearchRecipeRoot(viewModel: viewModel);
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          body: navigationShell,
          currentPageIndex: navigationShell.currentIndex,
          onChangeIndex: (value) {
            navigationShell.goBranch(
              value,
              initialLocation: value == navigationShell.currentIndex,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) {
                return HomeScreen(
                  onSearchTap: () {
                    context.push(Routes.searchRecipes);
                  },
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final viewModel = SavedRecipesViewModel(
                  RecipeRepositoryImpl(RecipeDataSourceImpl()),
                );

                viewModel.findRecipes();

                return SavedRecipeRoot(viewModel: viewModel);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
