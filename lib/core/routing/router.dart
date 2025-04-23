import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/first/splash_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';

import '../../data/model/recipe_model.dart';
import '../../presentation/first/splash_screen_view_model.dart';
import '../../presentation/main/home/home.dart';
import '../../presentation/main/home/home_action.dart';
import '../../presentation/main/home/home_tab.dart';
import '../../presentation/main/home/home_view_model.dart';
import '../../presentation/main/sign_in/sign_in.dart';
import '../../presentation/main/sign_in/sign_in_view_model.dart';
import '../../presentation/main/sign_up/sign_up.dart';
import '../../presentation/main/sign_up/sign_up_view_model.dart';
import '../../presentation/recipe_screen/recipe_screen.dart';
import '../../presentation/recipe_screen/recipe_screen_view_model.dart';
import '../../presentation/saved_recipe/saved_recipe_screen_root.dart';
import '../di/get_it.dart';

final router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder:
          (context, state) => SplashScreen(viewModel: SplashScreenViewModel()),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => SignIn(viewModel: SignInViewModel()),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUp(viewModel: SignUpViewModel()),
    ),
    GoRoute(
      path: Routes.recipeScreen,
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return RecipeScreen(viewModel: RecipeScreenViewModel(recipe));
      },
    ),
    GoRoute(
      path: Routes.searchRecipes,
      builder: (context, state) {
        return SearchRecipesScreen(
          viewModel: getIt(),
          filterScreenViewModel: getIt(),
        );
      },
    ),

    ShellRoute(
      builder: (context, state, child) {
        return HomeTab(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.home,
          builder:
              (context, state) => Home(
                viewModel: getIt(),
                onAction: (action) {
                  if (action is OnSelectCategory) {
                    getIt<HomeViewModel>().updateCategory(action.category);
                  }
                },
              ),
        ),
        GoRoute(
          path: Routes.savedRecipes,
          builder: (context, state) {
            return SavedRecipeScreenRoot(viewModel: getIt());
          },
        ),
        // GoRoute(
        //   path: Routes.notification,
        //   builder:
        //       (context, state) =>
        //           NotificationScreen(viewModel: NotificationViewModel())),
        // GoRoute(
        //   path: Routes.profile,
        //   builder:
        //       (context, state) =>
        //           ProfileScreen(viewModel: ProfileViewModel())),
      ],
    ),
  ],
);
