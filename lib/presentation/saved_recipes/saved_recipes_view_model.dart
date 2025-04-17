import 'package:flutter/material.dart';
import 'package:recipe_app/domain/use_case/use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final ToggleBookmarkRecipeUseCase _toggleBookmarkRecipeUseCase;

  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required ToggleBookmarkRecipeUseCase toggleBookmarkRecipeUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _toggleBookmarkRecipeUseCase = toggleBookmarkRecipeUseCase;

  SavedRecipesState get state => _state;

  Future<void> fetchSavedRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _state = state.copyWith(
      recipes: await _getSavedRecipesUseCase.execute(),
      isLoading: false,
    );
    notifyListeners();
  }

  Future<void> toggleRecipe(int id) async {
    _state = state.copyWith(
      recipes: await _toggleBookmarkRecipeUseCase.execute(id),
    );
    notifyListeners();
  }
}
