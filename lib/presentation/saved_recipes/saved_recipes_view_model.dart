import 'package:flutter/material.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesViewModel(this._getSavedRecipesUseCase);

  SavedRecipesState get state => _state;

  Future<void> fetchAll() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(recipes: await _getSavedRecipesUseCase.execute());

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }
}
