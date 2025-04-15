import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/interface/recipe_repository.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesViewModel(this._repository);

  SavedRecipesState get state => _state;

  Future<void> fetchAll() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(recipes: await _repository.findAll());

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }
}
