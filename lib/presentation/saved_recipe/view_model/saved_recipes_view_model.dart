import 'package:flutter/cupertino.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  final List<Recipe> _savedRecipes = [];

  List<Recipe> get savedRecipes => List.unmodifiable(_savedRecipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  SavedRecipesViewModel({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<void> fetchSavedRecipes() async {
    _isLoading = true;
    notifyListeners();

    final savedRecipes = await _recipeRepository.getSavedRecipe();
    _savedRecipes.addAll(savedRecipes);
    _isLoading = false;
    notifyListeners();
  }
}