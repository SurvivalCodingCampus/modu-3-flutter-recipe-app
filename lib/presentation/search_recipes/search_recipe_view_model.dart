import 'package:flutter/cupertino.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_state.dart';

import '../../data/model/recipes.dart';

class SearchRecipeViewModel with ChangeNotifier{
  final RecipeRepository _recipeRepository;

  SearchRecipeViewModel(this._recipeRepository);

  SearchRecipeState _state = SearchRecipeState(recipes: [], keyword: '', isLoading: false, filterRecipes: []);
  SearchRecipeState get state => _state;

  Future<void> fetchAll() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(recipes: await _recipeRepository.getRecipes(),
    isLoading: false);

    notifyListeners();
  }


  void searchKeyword(String keyword) {
    final filterRecipes = _state.recipes.where((e) {
      return e.name.toLowerCase().contains(keyword.toLowerCase());
    }).toList();

    _state = _state.copyWith(
      keyword: keyword,
      filterRecipes: filterRecipes
    );

    notifyListeners();
  }
}