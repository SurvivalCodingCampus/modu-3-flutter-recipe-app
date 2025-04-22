import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/domain/repository/repository.dart';
import 'package:recipe_app/domain/use_case/use_case.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;
  final ToggleBookmarkRecipeUseCase _toggleBookmarkRecipeUseCase;

  HomeState _state = const HomeState();

  HomeViewModel({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
    required ToggleBookmarkRecipeUseCase toggleBookmarkRecipeUseCase,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository,
       _toggleBookmarkRecipeUseCase = toggleBookmarkRecipeUseCase;

  HomeState get state => _state;

  Future<void> getAllCategories() async {
    final recipes = await _recipeRepository.getRecipes();

    final categories = {'All', ...recipes.map((e) => e.category)}.toList();
    _state = state.copyWith(categories: categories, category: 'All');
    notifyListeners();
  }

  Future<void> fetchDishCardsByCategory(String category) async {
    final recipes = await _recipeRepository.getRecipes();
    final ids = await _bookmarkRepository.getIds();

    final result =
        recipes
            .map((e) {
              if (ids.contains(int.parse(e.id))) {
                return e.copyWith(isFavorite: true);
              }
              return e;
            })
            .where((e) => category == "All" || e.category == category)
            .toList();
    _state = state.copyWith(recipes: result);

    notifyListeners();
  }

  Future<void> onTapCategory(String category) async {
    _state = state.copyWith(category: category);
    await fetchDishCardsByCategory(category);
    notifyListeners();
  }

  void onTapFavorite(Recipe recipe) async {
    await _toggleBookmarkRecipeUseCase.execute(int.parse(recipe.id));
  }
}
