import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesState _state = SearchRecipesState();
  SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._recipeRepository) {
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recipeRepository.getRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }

  Future<void> searchRecipes(String inputText) async {
    if (inputText.isEmpty) {
      _state = state.copyWith(recipes: await _recipeRepository.getRecipes());
      notifyListeners();
    }
    final filtered =
        _state.recipes
            .where(
              (element) =>
                  element.title.toLowerCase().contains(inputText.toLowerCase()),
            )
            .toList();
    _state = state.copyWith(recipes: filtered, text: inputText);
    notifyListeners();
  }

  Future<void> filterRecipes() async {}
}
