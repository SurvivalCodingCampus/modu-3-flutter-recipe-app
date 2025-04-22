import 'package:flutter/material.dart';

import '../../../data/model/recipe_model.dart';
import '../../../domain/use_case/get_recipe_use_case.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRecipeUseCase getRecipeUseCase;

  HomeViewModel(this.getRecipeUseCase);

  HomeState _state = const HomeState();

  HomeState get state => _state;

  Future<void> fetchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await getRecipeUseCase.execute();
    _state = _state.copyWith(recipes: recipes, isLoading: false);
    notifyListeners();
  }

  void updateCategory(String category) {
    _state = _state.copyWith(selectedCategory: category);

    final filtered = _filterByCategory(_state.recipes, category);
    _state = _state.copyWith(filteredRecipes: filtered);
    notifyListeners();
  }

  List<Recipe> _filterByCategory(List<Recipe> all, String category) {
    final normalizedCategory = category.trim().toLowerCase();
    if (normalizedCategory == 'all' || normalizedCategory.isEmpty) {
      return all;
    }

    return all
        .where(
          (recipe) =>
              recipe.category.trim().toLowerCase() == normalizedCategory,
        )
        .toList();
  }
}
