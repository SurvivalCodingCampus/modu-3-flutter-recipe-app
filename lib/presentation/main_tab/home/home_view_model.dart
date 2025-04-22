import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/usecase/get_bookmarked_recipeIds_use_case.dart';
import 'package:recipe_app/domain/usecase/get_recipe_categories_use_case.dart';
import 'package:recipe_app/domain/usecase/get_recipes_by_category_use_case.dart';
import 'package:recipe_app/domain/usecase/toggle_bookmark_use_case.dart';

import 'home_action.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRecipeCategoriesUseCase _getCategories;
  final GetRecipesByCategoryUseCase _getRecipesByCategory;
  final ToggleBookmarkUseCase _toggleBookmark;
  final GetBookmarkedRecipeIdsUseCase _getBookmarkedRecipeIds;

  HomeViewModel({
    required GetRecipeCategoriesUseCase getCategories,
    required GetRecipesByCategoryUseCase getRecipesByCategory,
    required ToggleBookmarkUseCase toggleBookmark,
    required GetBookmarkedRecipeIdsUseCase getBookmarkedRecipeIds,
  }) : _getCategories = getCategories,
       _getRecipesByCategory = getRecipesByCategory,
       _toggleBookmark = toggleBookmark,
       _getBookmarkedRecipeIds = getBookmarkedRecipeIds;

  HomeState _state = const HomeState();

  HomeState get state => _state;

  void onAction(HomeAction action) {
    switch (action) {
      case TapRecipe():
        // Root에서 처리
        break;
      case SearchTouch():
        // Root에서 처리
        break;

      case SelectCategory():
        final index = action.index;
        final category = _state.categories[index];
        _state = _state.copyWith(selectedCategoryIndex: index);
        notifyListeners();
        _loadRecipes(category);
        break;
      case ToggleBookmark():
        _toggleAndRefresh(action.recipe);
    }
  }

  Future<void> load() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final categoryResult = await _getCategories.execute();

    if (categoryResult case UiSuccess(:final data)) {
      final updatedCategories = ['All', ...data];

      _state = _state.copyWith(
        isLoading: false,
        categories: updatedCategories,
        selectedCategoryIndex: 0,
        recipes: const UiState.loading(),
      );
      notifyListeners();

      final category = updatedCategories[0];
      await _loadRecipes(category);
    } else if (categoryResult case UiError(:final message)) {
      debugPrint('카테고리 로딩 실패: $message');
    }
  }

  Future<void> _loadRecipes(String category) async {
    _state = _state.copyWith(recipes: const UiState.loading());
    notifyListeners();

    final recipeResult = await _getRecipesByCategory.execute(category);

    final result = await _getBookmarkedRecipeIds.execute();
    if (result case UiSuccess(:final data)) {
      _state = _state.copyWith(bookmarkedRecipeIds: data);
    }
    _state = _state.copyWith(recipes: recipeResult);
    notifyListeners();
  }

  Future<void> _toggleAndRefresh(Recipe recipe) async {
    final result = await _toggleBookmark(recipe.id);

    if (result is UiSuccess) {
      // 기존 bookmarkedId 리스트도 업데이트
      final newBookmarkedIds = [..._state.bookmarkedRecipeIds];

      if (newBookmarkedIds.contains(recipe.id)) {
        newBookmarkedIds.remove(recipe.id);
      } else {
        newBookmarkedIds.add(recipe.id);
      }

      // 레시피만 상태 유지한 채 UI 갱신
      if (_state.recipes is UiSuccess<List<Recipe>>) {
        final List<Recipe> updatedRecipes = (_state.recipes as UiSuccess).data;

        _state = _state.copyWith(
          bookmarkedRecipeIds: newBookmarkedIds,
          recipes: UiState.success(updatedRecipes),
        );
        notifyListeners();
      }
    }
  }
}
