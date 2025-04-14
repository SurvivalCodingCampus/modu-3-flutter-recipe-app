import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

import '../../data/model/recipe.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  // 상태
  SearchRecipesState _state = const SearchRecipesState();
  SearchRecipesState get state => _state;

  SearchRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository {
    _state = state.copyWith(isLoading: true);
  }

  void fetchRecipes() async {
    final List<Recipe> recipes = await _recipeRepository.getRecipes();
    _state = state.copyWith(searchRecipes: recipes, recipes: recipes);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void searchRecipes(String value) async {
    final List<Recipe> searchRecipes =
        state.recipes
            .where(
              (recipe) =>
                  recipe.name.toLowerCase().contains(value.toLowerCase()) ||
                  recipe.chef.toLowerCase().contains(value.toLowerCase()),
            )
            .toList();
    _state = state.copyWith(searchRecipes: searchRecipes);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void updateSearchString(String value) async {
    _state = state.copyWith(searchString: value);
    notifyListeners();
  }
}
