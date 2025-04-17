import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _savedRecipesUseCase;
  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesState get state => _state;

  SavedRecipesViewModel(this._savedRecipesUseCase);

  Future<void> findRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _savedRecipesUseCase.execute();

    switch (result) {
      case Success<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(recipes: result.success, isLoading: false);
        notifyListeners();
      case Error<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(error: result.error, isLoading: false);
        notifyListeners();
    }
  }

  Future<void> addBookmark(int id) async {
    await _savedRecipesUseCase.bookmarkRepository.save(id);
    notifyListeners();
  }

  Future<void> removeBookmark(int id) async {
    await _savedRecipesUseCase.bookmarkRepository.unSave(id);
    await findRecipes();
    notifyListeners();
  }
}
