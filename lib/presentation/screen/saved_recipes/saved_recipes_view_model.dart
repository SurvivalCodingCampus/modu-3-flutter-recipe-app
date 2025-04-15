import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/screen/saved_recipes/saved_recipe_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;

  SavedRecipesViewModel({required RecipeRepository repository})
    : _repository = repository;

  SavedRecipeState _state = SavedRecipeState();
  SavedRecipeState get state => _state;
  // bool get isLoading => _state.isLoading;
  // List<Recipe> get savedRecipes => _state.savedRecipes;

  Future<void> fetchSavedRecipe() async {
    // 로딩 시작 알림
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    // 데이터 가지고 오고 로딩 꺼짐 알림
    _state = state.copyWith(
      isLoading: false,
      savedRecipes: await _repository.getRecipes(),
    );
    notifyListeners();
  }
}
