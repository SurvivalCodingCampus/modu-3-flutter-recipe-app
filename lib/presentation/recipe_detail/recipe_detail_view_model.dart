import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/usecase/get_recipe_by_id_use_case.dart';
import 'package:recipe_app/domain/usecase/set_recipe_rating_use_case.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_action.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_state.dart';

class RecipeDetailViewModel with ChangeNotifier {
  final GetRecipeByIdUseCase _getRecipeById;
  final SetRecipeRatingUseCase _setRecipeRating;

  RecipeDetailState _state = const RecipeDetailState();

  RecipeDetailState get state => _state;

  RecipeDetailViewModel({
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

  void onAction(RecipeDetailAction action, {int? recipeId}) {
    switch (action) {
      case OnRate(:final rating):
        if (recipeId != null) updateRating(recipeId, rating.toDouble());
        break;
      case OnRetry():
        if (recipeId != null) load(recipeId);
        break;
      case OnSelectTab(:final index):
        _state = _state.copyWith(selectedTabIndex: index);
        notifyListeners();
    }
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
