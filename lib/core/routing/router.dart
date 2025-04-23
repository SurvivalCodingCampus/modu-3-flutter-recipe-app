import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_set.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';
import 'package:recipe_app/presentation/home/screen/home_root.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:recipe_app/presentation/ingredient/screen/ingreident_root.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/screen/saved_recipes_root.dart';
import 'package:recipe_app/presentation/search_recipes/screen/search_recipes_root.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'package:recipe_app/presentation/splash/splash_view_model.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        final viewModel = getIt<SplashViewModel>();

        viewModel.isNetworkConnect();

        return SplashScreen(
          viewModel: viewModel,
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
        final SearchRecipesViewModel viewModel = getIt();

        viewModel.action(const SearchRecipesAction.search(''));

        return SearchRecipeRoot(viewModel: viewModel);
      },
    ),

    GoRoute(
      path: '${Routes.ingredientRecipes}/:id',
      builder: (context, state) {
        final int id = int.parse(state.pathParameters['id']!);
        final IngredientViewModel viewModel = getIt();

        viewModel.findRecipeById(id);

        return IngredientRoot(viewModel: viewModel);
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
                final viewModel = getIt<HomeViewModel>();

                viewModel.action(const HomeAction.findRecipes());

                return HomeRoot(viewModel: viewModel);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.savedRecipes,
              builder: (context, state) {
                final SavedRecipesViewModel viewModel = getIt();

                viewModel.action(const SavedRecipesAction.findRecipes());

                return SavedRecipeRoot(
                  viewModel: viewModel,
                  onCardClick: (int id) {
                    context.push('${Routes.ingredientRecipes}/$id');
                  },
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
