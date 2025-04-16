import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data/repository/recipe_repository/recipe_repository_impl.dart';
import 'package:recipe_app/domain/use_case/get_ingredient_by_use_case.dart';
import 'package:recipe_app/domain/use_case/get_recipe_by_use_case.dart';
import 'package:recipe_app/presentation/first/splash_screen.dart';

import '../../data/data_source/recipe/recipe_data_source_impl.dart';
import '../../domain/use_case/get_procedure_by_use_case.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../domain/use_case/toggle_book_mark_use_case.dart';
import '../../presentation/first/splash_screen_view_model.dart';
import '../../presentation/main/home/home.dart';
import '../../presentation/main/home/home_tab.dart';
import '../../presentation/main/home/home_view_model.dart';
import '../../presentation/main/sign_in/sign_in.dart';
import '../../presentation/main/sign_in/sign_in_view_model.dart';
import '../../presentation/main/sign_up/sign_up.dart';
import '../../presentation/main/sign_up/sign_up_view_model.dart';
import '../../presentation/recipe_screen/recipe_screen.dart';
import '../../presentation/recipe_screen/recipe_screen_view_model.dart';
import '../../presentation/saved_recipe/saved_recipe_screen.dart';
import '../../presentation/saved_recipe/saved_recipe_view_model.dart';

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
        final recipeId = state.pathParameters['id']!;

        final recipeRepository = RecipeRepositoryImpl(RecipeDataSourceImpl());

        return RecipeScreen(
          viewModel: RecipeScreenViewModel(
            recipeId,
            GetRecipeByUseCase(recipeRepository),
            GetIngredientByUseCase(recipeRepository),
            GetProceduresByRecipeUseCase(recipeRepository),
          ),
        );
      },
    ),

    // ShellRoute로 bottom nav 구조 관리
    ShellRoute(
      builder: (context, state, child) {
        return HomeTab(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (context, state) => Home(viewModel: HomeViewModel()),
        ),
        GoRoute(
          path: Routes.savedRecipes,
          builder: (context, state) {
            final recipeRepository = RecipeRepositoryImpl(
              RecipeDataSourceImpl(),
            );
            return SavedRecipeScreen(
              viewModel: SavedRecipeViewModel(
                GetSavedRecipesUseCase(recipeRepository),
                ToggleBookMarkUseCase(recipeRepository),
              ),
            );
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
