import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/routing/routes.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_saved_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository_impl.dart';
import 'package:recipe_app/recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen.dart';
import 'package:recipe_app/recipe_app/presentation/ingredient_screen/ingredient_screen.dart';
import 'package:recipe_app/recipe_app/presentation/main_screen/bottom_navigation_bar_scaffold.dart';
import 'package:recipe_app/recipe_app/presentation/my_page/my_page_screen.dart';
import 'package:recipe_app/recipe_app/presentation/notification/notification_screen.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/sign_in/sign_in_screen.dart';
import 'package:recipe_app/recipe_app/presentation/sign_up/sign_up_screen.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
MockRecipeDataImpl mockRecipeDataImpl = MockRecipeDataImpl();
RecipeRepository repository = RecipeRepositoryImpl(
  recipeDataSource: mockRecipeDataImpl,
);
MockSavedRecipeDataImpl mockSavedRecipeDataImpl = MockSavedRecipeDataImpl();
BookMarkRepository bookMarkRepository = BookMarkRepositoryImpl(
  recipeDataSource: mockSavedRecipeDataImpl,
);
final GetSavedRecipesUseCase _bookMarkedRecipesUseCase = GetSavedRecipesUseCase(
  bookMarkRepository: bookMarkRepository,
);
SavedRecipesViewModel _savedRecipesViewModel = SavedRecipesViewModel(
  repository,
  _bookMarkedRecipesUseCase,
);
FilterSearchViewModel _filterSearchViewModel = FilterSearchViewModel(
  repository,
);
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.signIn,
      name: 'SignIn',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: Routes.signUp,
      name: 'SignUp',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: Routes.ingredientScreen,
      name: 'IngredientScreen',
      builder: (context, state) => const IngredientScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder:
          (context, state, child) => BottomNavigationBarScaffold(child: child),
      routes: [
        GoRoute(
          path: Routes.homeScreen,
          pageBuilder:
              (context, state) => NoTransitionPage(
                child: HomeScreen(
                  filterSearchViewModel: _filterSearchViewModel,
                ),
              ),
        ),
        GoRoute(
          path: Routes.savedRecipes,
          pageBuilder:
              (context, state) => NoTransitionPage(
                child: SavedRecipesScreen(
                  savedRecipesViewModel: _savedRecipesViewModel,
                ),
              ),
        ),
        GoRoute(
          path: Routes.notificationScreen,
          pageBuilder:
              (context, state) => NoTransitionPage(child: NotificationScreen()),
        ),
        GoRoute(
          path: Routes.myPageScreen,
          pageBuilder:
              (context, state) => NoTransitionPage(child: MyPageScreen()),
        ),
      ],
    ),
  ],
);
