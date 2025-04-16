import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/example_screen/preview_main.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/home_screen.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/main_navigation_bar.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/profile/profile_screen.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/screen/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/screen/sign_in/sign_in_screen.dart';
import 'package:recipe_app/presentation/screen/sign_up/sign_up_screen.dart';
import 'package:recipe_app/presentation/screen/splash/splash_screen.dart';

import '../../presentation/screen/main_naivation_bar/notification/notification_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    // 인증관련 화면
    GoRoute(path: Routes.splash, builder: (conttext, state) => SplashScreen()),
    GoRoute(path: Routes.signIn, builder: (conttext, state) => SignInScreen()),
    GoRoute(path: Routes.signUp, builder: (conttext, state) => SignUpScreen()),

    //메인 탭
    ShellRoute(
      builder: (conttext, state, child) => MainNavigationBar(child: child),
      routes: [
        GoRoute(path: Routes.home, builder: (conttext, state) => HomeScreen()),
        GoRoute(
          path: Routes.savedRecipe,
          builder:
              (conttext, state) => SavedRecipesScreen(
                viewModel: SavedRecipesViewModel(
                  repository: RecipeRepositoryImpl(
                    dataSource: RecipeDataSourceImpl(),
                  ),
                ),
              ),
        ),
        GoRoute(
          path: Routes.notification,
          builder: (conttext, state) => NotificationScreen(),
        ),
        GoRoute(
          path: Routes.profile,
          builder: (conttext, state) => ProfileScreen(),
        ),
      ],
    ),

    GoRoute(
      path: Routes.search,
      builder:
          (conttext, state) => SearchRecipesScreen(
            viewModel: SearchRecipesViewModel(
              repository: RecipeRepositoryImpl(
                dataSource: RecipeDataSourceImpl(),
              ),
            ),
          ),
    ),

    // 예시화면
    GoRoute(path: Routes.example, builder: (conttext, state) => PreviewMain()),
  ],
);
