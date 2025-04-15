import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipe_ropository.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

import '../../data/model/recipe.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  //상태
  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._recipeRepository);

  void fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    List<Recipe> recipes = await _recipeRepository.getRecipes();
    _state = state.copyWith(
      recipes: recipes,
      filteredRecipes: recipes,
      isLoading: false,
    );
    notifyListeners();
  }

  void search(String keyword) async {

    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final results = state.recipes.where((recipe) {
      return recipe.recipeName.contains(keyword);
    }).toList();

    _state = state.copyWith(
      searchKeyword: keyword,
      filteredRecipes: results,
      isLoading: false,
    );
    notifyListeners();
  }

}
