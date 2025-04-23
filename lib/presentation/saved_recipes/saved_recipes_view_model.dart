import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/usecase/get_bookmarked_recipes_use_case.dart';
import 'package:recipe_app/domain/usecase/toggle_bookmark_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetBookmarkedRecipesUseCase _getBookmarkedRecipes;
  final ToggleBookmarkUseCase _toggleBookmark;

  SavedRecipesState _state = const SavedRecipesState();
  SavedRecipesState get state => _state;

  SavedRecipesViewModel({
    required GetBookmarkedRecipesUseCase getBookmarkedRecipes,
    required ToggleBookmarkUseCase toggleBookmark,
  }) : _getBookmarkedRecipes = getBookmarkedRecipes,
       _toggleBookmark = toggleBookmark;

  Future<void> load() async {
    _state = _state.copyWith(recipes: const UiState.loading());
    notifyListeners();

    final stateResult = await _getBookmarkedRecipes.execute();
    _state = _state.copyWith(recipes: stateResult);

    notifyListeners();
  }

  void onAction(SavedRecipesAction action) {
    switch (action) {
      case OnTapFavorite(:final recipeId):
        toggleBookmark(recipeId);

      case OnRetry():
        load();

      case OnClearError():
        clearError();

      // push 처리 등의 액션은 Root에서 처리하므로 무시
      case OnTapRecipe():
        break;
    }
  }

  Future<void> toggleBookmark(int recipeId) async {
    final currentState = _state.recipes;

    // 현재 화면 목록에 존재하지 않는 ID로 삭제 요청이 들어온 경우 → 오류 처리
    if (currentState is UiSuccess<List<Recipe>> &&
        !currentState.data.any((r) => r.id == recipeId)) {
      _state = _state.copyWith(errorMessage: '존재하지 않는 레시피입니다.');
      notifyListeners();
      return;
    }

    final result = await _toggleBookmark(recipeId);

    if (result is UiSuccess) {
      final currentState = _state.recipes;

      if (currentState is UiSuccess<List<Recipe>>) {
        final updatedList =
            currentState.data.where((recipe) => recipe.id != recipeId).toList();

        _state = _state.copyWith(
          recipes:
              updatedList.isEmpty
                  ? const UiState.empty()
                  : UiState.success(updatedList),
          errorMessage: null, // 이전 에러 초기화
        );

        notifyListeners();
      }
    } else if (result is UiError) {
      _state = _state.copyWith(errorMessage: result.message);
      notifyListeners();
    }
  }

  void clearError() {
    _state = _state.copyWith(errorMessage: null);
    notifyListeners();
  }
}
