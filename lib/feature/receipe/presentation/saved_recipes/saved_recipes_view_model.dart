import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/get_saved_recipes_use_case.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SavedRecipesViewModel(this._getSavedRecipesUseCase);

  SavedRecipesState _state = const SavedRecipesState();
  SavedRecipesState get state => _state;

  void fetchRecipes() async {
    _state = state.copyWith(viewState: ViewState.loading);
    notifyListeners();
    final resp = await _getSavedRecipesUseCase.getSavedRecipe();
    switch (resp) {
      case Success<List<Recipe>>():
        _state = state.copyWith(data: resp.data, viewState: ViewState.complete);
      case Error<List<Recipe>>():
        _state = state.copyWith(viewState: ViewState.error);
    }
    notifyListeners();
  }
}
