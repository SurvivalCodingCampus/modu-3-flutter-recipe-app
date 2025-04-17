import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_state.dart';

import '../../data/model/recipe_model.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../domain/use_case/toggle_book_mark_use_case.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final ToggleBookMarkUseCase _toggledBookMarkUseCase;

  SavedRecipeState _state = SavedRecipeState();

  SavedRecipeState get state => _state;

  SavedRecipeViewModel(
    this._getSavedRecipesUseCase,
    this._toggledBookMarkUseCase,
  );

  Future<void> fetchSavedRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _getSavedRecipesUseCase.markRecipes();
    _state = _state.copyWith(savedRecipes: recipes, isLoading: false);
    notifyListeners();
  }

  Future<void> toggleBookMark(Recipe recipe) async {
    await _toggledBookMarkUseCase.toggleBookmark(recipe);
    await fetchSavedRecipes();
  }
}
