import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesState get state => _state;

  void getRecipes() async {
    _state = _state.copyWith(isSearchLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _recipeRepository.getAllRecipeList(),
      isSearchLoading: false,
    );
    notifyListeners();
  }

  void searchRecipes({required String keyWord}) {
    _state = _state.copyWith(isSearchLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      searchKeyWord: keyWord,
      filterRecipes:
          _state.recipes
              .where((items) => items.name.contains(keyWord))
              .toList(),
      isSearchLoading: false,
    );
    notifyListeners();
  }
}
