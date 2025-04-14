import 'package:flutter/cupertino.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

import '../../data/model/recipes.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipeViewModel(this._recipeRepository);

  List<Recipes> _recipes = List.unmodifiable([]);
  bool _isLoading = false;

  List<Recipes> get recipes => _recipes;

  bool get isLoading => _isLoading;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _recipeRepository.getRecipes();

    _isLoading = false;
    notifyListeners();
  }
}