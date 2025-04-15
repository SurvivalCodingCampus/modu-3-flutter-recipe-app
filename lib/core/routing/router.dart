import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../presentation/saved_recipes/saved_recipes_screen.dart';
import '../../presentation/saved_recipes/saved_recipes_view_model.dart';
import '../../presentation/search_recipes/search_recipes_screen.dart';
import '../../presentation/search_recipes/search_recipes_view_model.dart';
import '../../presentation/splash/splash_screen.dart';

//GoRouter configuration
final router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: Routes.savedRecipes,
        builder: (context, state) => SavedRecipesScreen(viewModel: SavedRecipesViewModel(MockRecipeRepositoryImpl())),
      ),
      GoRoute(
        path: Routes.searchRecipes,
        builder: (context, state) => SearchRecipesScreen(viewModel: SearchRecipesViewModel(MockRecipeRepositoryImpl())),
      ),
    ],
);