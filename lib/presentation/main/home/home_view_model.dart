import 'package:flutter/material.dart';

import '../../../data/model/recipe_model.dart';
import '../../../domain/use_case/get_recipe_use_case.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRecipeUseCase getRecipeUseCase;

  HomeViewModel(this.getRecipeUseCase);

  HomeState _state = const HomeState();

  HomeState get state => _state;

  List<Recipe> _allRecipes = [];

  Future<void> fetchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await getRecipeUseCase.execute();
    _allRecipes = recipes;

    final filtered = _filterByCategory(_state.selectedCategory);
    _state = _state.copyWith(
      isLoading: false,
      recipes: _allRecipes,
      filteredRecipes: filtered,
    );
    notifyListeners();
  }

  void updateCategory(String category) {
    _state = _state.copyWith(selectedCategory: category);
    final filtered = _filterByCategory(category);

    print('선택된 카테고리: $category');
    print('필터된 레시피 수: ${filtered.length}');

    _state = _state.copyWith(filteredRecipes: filtered);
    notifyListeners();
  }

  List<Recipe> _filterByCategory(String category) {
    final normalizedCategory = category.trim().toLowerCase();
    if (normalizedCategory == 'All') return _allRecipes;

    return _allRecipes
        .where(
          (recipe) =>
              recipe.category.trim().toLowerCase() == normalizedCategory,
        )
        .toList();
  }

  Future<void> getAllRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final recipes = await getRecipeUseCase.execute();
      _allRecipes = recipes;

      _state = _state.copyWith(isLoading: false, recipes: recipes);
    } catch (e) {
      _state = _state.copyWith(isLoading: false);
    }
    notifyListeners();
  }
}
