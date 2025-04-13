import 'package:flutter/foundation.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/repository/recipe/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  List<Recipe> _recipes = [];
  bool _isLoading = false;

  SavedRecipesViewModel(this._recipeRepository) {
    fetchRecipes();
  }

  List<Recipe> get recipes => List.unmodifiable(_recipes);
  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _recipeRepository.getRecipes();
    _isLoading = false;
    notifyListeners();
  }
}
