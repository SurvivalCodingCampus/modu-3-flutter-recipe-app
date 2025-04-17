import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/data_source/mock_user_data_source_impl.dart';
import 'package:recipe_app/domain/repository/user_repository_impl.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/toggle_bookmark_use_case.dart';
import 'package:recipe_app/presentation/ingredient/auth/sign_in_screen.dart';
import 'package:recipe_app/presentation/ingredient/auth/sign_up_screen.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/ingredient/splash/splash_screen.dart';
import 'package:recipe_app/presentation/main/home/home_screen.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/main/notification/notification_screen.dart';
import 'package:recipe_app/presentation/main/profile/profile_screen.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_view_model.dart';

import '../../domain/repository/recipe_repository_impl.dart';

final userDataSource = MockUserDataSourceImpl();
final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen()),
    GoRoute(path: Routes.signIn, builder: (context, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (context, state) => SignUpScreen()),
    GoRoute(
      path: Routes.search,
      builder:
          (context, state) => SearchRecipesScreen(
            viewModel: SearchRecipesViewModel(
              recipeRepository: RecipeRepositoryImpl(
                recipeDataSource: MockRecipeDataSourceImpl(),
              ),
            ),
          ),
    ),
    GoRoute(
      path: Routes.ingredient,
      builder: (context, state) {
        final recipeId = int.parse(state.pathParameters['recipeId'] ?? '-1');
        return RecipeIngredientScreen(
          viewModel: RecipeIngredientViewModel(
            recipeRepository: RecipeRepositoryImpl(
              recipeDataSource: MockRecipeDataSourceImpl(),
            ),
            recipeId: recipeId,
          ),
        );
      },
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder:
                  (context, state) => SavedRecipesScreen(
                    viewModel: SavedRecipesViewModel(
                      recipeRepository: RecipeRepositoryImpl(
                        recipeDataSource: MockRecipeDataSourceImpl(),
                      ),
                      getSavedRecipesUseCase: GetSavedRecipesUseCase(
                        userRepository: UserRepositoryImpl(
                          userDataSource: userDataSource,
                        ),
                        recipeRepository: RecipeRepositoryImpl(
                          recipeDataSource: MockRecipeDataSourceImpl(),
                        ),
                      ),
                      toggleBookmarkUseCase: ToggleBookmarkUseCase(
                        userRepository: UserRepositoryImpl(
                          userDataSource: userDataSource,
                        ),
                      ),
                    ),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notifications,
              builder: (context, state) => NotificationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
