import 'package:flutter/cupertino.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/usecase/get_recipe_by_id_usecase.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';

class IngredientViewModel with ChangeNotifier {
  final GetRecipeByIdUseCase _getRecipeById;

  IngredientState _state = const IngredientState();
  IngredientState get state => _state;

  IngredientViewModel({required GetRecipeByIdUseCase getRecipeById})
    : _getRecipeById = getRecipeById;

  Future<void> load(int recipeId) async {
    _state = _state.copyWith(recipe: const UiState.loading());
    notifyListeners();

    final stateResult = await _getRecipeById(recipeId);
    _state = _state.copyWith(recipe: stateResult);

    notifyListeners();
  }
}
