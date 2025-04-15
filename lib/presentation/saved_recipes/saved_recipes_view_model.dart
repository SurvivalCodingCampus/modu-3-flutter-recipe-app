// Flutter imports:
import 'package:flutter/foundation.dart';
// Project imports:
import 'package:recipe_app/core/data/model/recipe.dart';
import 'package:recipe_app/core/data/repository/recipe_repository.dart';
import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/core/ui/ui_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;

  UiState<List<Recipe>> _state = const UiState.loading();
  UiState<List<Recipe>> get state => _state;

  SavedRecipesViewModel(this._repository) {
    load();
  }

  Future<void> load() async {
    _state = const UiState.loading();
    notifyListeners();

    try {
      final result = await _repository.getRecipes();

      switch (result) {
        case Success(data: final recipes):
          _state =
              recipes.isEmpty
                  ? const UiState.empty()
                  : UiState.success(recipes);
          break;

        case Error(failure: final failure):
          _state = UiState.error(failure.message);
          break;
      }
    } catch (e) {
      _state = const UiState.error('예상치 못한 오류가 발생');
      debugPrint('load() failed: $e');
    }

    notifyListeners();
  }
}
