import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/component/pages/recipe/recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;

  RecipesState _state = const RecipesState(isLoading: true);
  RecipesState get state => _state;

  SavedRecipesViewModel(this._repository) {
    _loadAllRecipes();
  }

  Future<void> _loadAllRecipes() async {
    try {
      final all = await _repository.getRecipes();
      _updateState(_state.copyWith(
        allRecipes: all,
        filteredRecipes: all,
        isLoading: false,
      ));
    } catch (_) {
      _updateState(_state.copyWith(isLoading: false));
    }
  }

  void updateQuery(String query) {
    final filtered = _state.allRecipes.where((recipe) {
      return recipe.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    _updateState(_state.copyWith(
      searchQuery: query,
      filteredRecipes: filtered,
    ));
  }

  void _updateState(RecipesState newState) {
    _state = newState;
    notifyListeners();
  }
}
