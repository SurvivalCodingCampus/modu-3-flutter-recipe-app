import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/usecase/get_recipe_by_id_usecase.dart';
import 'package:recipe_app/domain/usecase/set_recipe_rating_usecase.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';

class IngredientViewModel with ChangeNotifier {
  final GetRecipeByIdUseCase _getRecipeById;
  final SetRecipeRatingUseCase _setRecipeRating;

  IngredientState _state = const IngredientState();
  IngredientState get state => _state;

  IngredientViewModel({
    required GetRecipeByIdUseCase getRecipeById,
    required SetRecipeRatingUseCase setRecipeRating,
  }) : _getRecipeById = getRecipeById,
       _setRecipeRating = setRecipeRating;

  Future<void> load(int recipeId) async {
    _state = _state.copyWith(recipe: const UiState.loading());
    notifyListeners();

    final stateResult = await _getRecipeById(recipeId);
    _state = _state.copyWith(recipe: stateResult);

    notifyListeners();
  }

  Future<void> updateRating(int recipeId, double rating) async {
    final state = await _setRecipeRating(recipeId: recipeId, rating: rating);

    switch (state) {
      case UiSuccess():
        await load(recipeId);
        break;

      case UiError(:final message):
        debugPrint('평점 업데이트 실패: $message');
        break;

      case UiLoading():
      case UiEmpty():
        break;
    }
  }
}
