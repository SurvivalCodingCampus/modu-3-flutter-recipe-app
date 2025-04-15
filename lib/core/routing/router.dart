import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';

import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../presentation/home/home_screen.dart';
import '../../presentation/home/home_view_model.dart';
import '../../presentation/search_recipes/search_recipes_view_model.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/saved-recipes',
  routes: [
    GoRoute(
      path: '/',
      builder:
          (context, state) =>
              HomeScreen(viewModel: HomeViewModel(MockRecipeRepositoryImpl())),
    ),
    GoRoute(
      path: '/saved-recipes',
      builder:
          (context, state) =>
              SearchRecipesScreen(viewModel: SearchRecipesViewModel()),
    ),
  ],
);
