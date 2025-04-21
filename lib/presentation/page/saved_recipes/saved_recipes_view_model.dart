import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/page/saved_recipes/save_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  late GetSavedRecipesUseCase _getSavedRecipesUseCase;
  SaveRecipesState _state = SaveRecipesState();

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) {
    _getSavedRecipesUseCase = getSavedRecipesUseCase;
    fetchData();
  }

  SaveRecipesState get state => _state;

  void fetchData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    _state = state.copyWith(
      isLoading: false,
      recipeList: await _getSavedRecipesUseCase.execute(),
    );
    notifyListeners();
  }
}
