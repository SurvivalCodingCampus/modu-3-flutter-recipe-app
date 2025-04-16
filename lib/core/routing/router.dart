import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/bookmark_repository_impl.dart';
import 'package:recipe_app/data/repository/repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/home/home_screen.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/my/my_screen.dart';
import 'package:recipe_app/presentation/notification/notification_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search/search_screen.dart';
import 'package:recipe_app/presentation/search/search_view_model.dart';
import 'package:recipe_app/presentation/sign-in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign-up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
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
            onTapSignIn: () => context.go(Routes.home),
            onTapSignUp: () => context.go(Routes.signUp),
          ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder:
          (context, state) =>
              SignUpScreen(onTapSignIn: () => context.go(Routes.signIn)),
    ),
    GoRoute(
      path: Routes.search,
      builder:
          (context, state) => SearchScreen(
            viewModel: SearchViewModel(
              repository: RecipeRepositoryImpl(
                recipeDataSource: MockRecipeDataSourceImpl(),
              ),
            ),
          ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          body: navigationShell,
          currentPageIndex: navigationShell.currentIndex,
          onChangeIndex: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder:
                  (context, state) => HomeScreen(
                    onTapSearch: () => context.push(Routes.search),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.save,
              builder:
                  (context, state) => SavedRecipesScreen(
                    viewModel: SavedRecipesViewModel(
                      getSavedRecipesUseCase: GetSavedRecipesUseCase(
                        recipeRepository: RecipeRepositoryImpl(
                          recipeDataSource: MockRecipeDataSourceImpl(),
                        ),
                        bookmarkRepository: BookmarkRepositoryImpl(),
                      ),
                    ),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.notification,
              builder: (context, state) => const NotificationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.my,
              builder: (context, state) => const MyScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
