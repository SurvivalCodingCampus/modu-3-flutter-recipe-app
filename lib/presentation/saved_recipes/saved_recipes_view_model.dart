import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

import '../../domain/model/recipe.dart';
import '../../domain/repository/recipe_ropository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  //상태
  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesState get state => _state;

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
  : _recipeRepository = recipeRepository;

  void fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recipeRepository.getRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }
}
