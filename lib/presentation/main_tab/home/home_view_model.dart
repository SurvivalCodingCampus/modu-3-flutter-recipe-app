import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/usecase/get_recipe_categories_use_case.dart';
import 'package:recipe_app/domain/usecase/get_recipes_by_category_use_case.dart';

import 'home_action.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRecipeCategoriesUseCase _getCategories;
  final GetRecipesByCategoryUseCase _getRecipesByCategory;

  HomeViewModel(this._getCategories, this._getRecipesByCategory);

  HomeState _state = const HomeState();

  HomeState get state => _state;

  void onAction(HomeAction action) {
    switch (action) {
      case TapRecipe():
        // TODO: 상세 화면 이동
        break;

      case SelectCategory():
        final index = action.index;
        final category = _state.categories[index];
        _state = _state.copyWith(selectedCategoryIndex: index);
        notifyListeners();
        _loadRecipes(category);
        break;
    }
  }

  Future<void> load() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final categoryResult = await _getCategories.execute();

    if (categoryResult case UiSuccess(:final data)) {
      final category = data.firstOrNull;
      _state = _state.copyWith(
        isLoading: false,
        categories: data,
        selectedCategoryIndex: 0,
        recipes: const UiState.loading(),
      );
      notifyListeners();
      if (category != null) {
        await _loadRecipes(category);
      }
    } else if (categoryResult case UiError(:final message)) {
      debugPrint('카테고리 로딩 실패: $message');
    }
  }

  Future<void> _loadRecipes(String category) async {
    _state = _state.copyWith(recipes: const UiState.loading());
    notifyListeners();

    final result = await _getRecipesByCategory.execute(category);
    _state = _state.copyWith(recipes: result);
    notifyListeners();
  }
}
