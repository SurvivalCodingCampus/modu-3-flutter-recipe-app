import 'package:flutter/foundation.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/domain/use_case/get_saved_recipes_use_case.dart';

import '../../data/model/recipe.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SavedRecipesViewModel(this._recipeRepository, this._getSavedRecipesUseCase);

  List<Recipe> get recipes => _recipes;
  List<Recipe> _recipes = [];

  //List내용 임의로 변형시키지 못함
  //List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> loadRecipesData() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _recipeRepository.fetchRecipes();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> bookMarkedRecipesUseCase() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _getSavedRecipesUseCase.execute();
    _isLoading = false;
    notifyListeners();
  }

  void toggleBookMark(int id) {
    final index = recipes.indexWhere(((recipe) => recipe.id == id));
    if (index != -1) {
      recipes[index] = recipes[index].copyWith(
        bookMarked: !recipes[index].bookMarked,
      );
      notifyListeners();
    }
  }
}
