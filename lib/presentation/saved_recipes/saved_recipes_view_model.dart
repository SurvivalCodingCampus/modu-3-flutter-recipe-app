import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/util/result.dart';
import 'package:recipe_app/util/ui_state.dart';

class SavedRecipesViewModel extends ChangeNotifier {
  final RecipeRepository _repository;

  UiState<List<Recipe>> _state = const UiState.loading();
  UiState<List<Recipe>> get state => _state;

  SavedRecipesViewModel(this._repository) {
    load();
  }

  Future<void> load() async {
    _state = const UiState.loading();
    notifyListeners();

    final result = await _repository.getRecipes();

    switch (result) {
      case Success(data: final recipes):
        _state =
            recipes.isEmpty ? const UiState.empty() : UiState.success(recipes);
        break;

      case Error(failure: final failure):
        _state = UiState.error(failure.message);
        break;
    }

    notifyListeners();
  }
}
