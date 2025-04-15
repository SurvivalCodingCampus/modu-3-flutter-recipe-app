import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  SavedRecipesState _state = SavedRecipesState();

  SavedRecipesState get state => _state;

  SavedRecipesViewModel(RecipeRepository repository) : _repository = repository;

  Future<void> findRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.findDatas();

    switch (result) {
      case Success<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(recipes: result.success, isLoading: false);
        notifyListeners();
      case Error<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(error: result.error, isLoading: false);
        notifyListeners();
    }
  }
}
