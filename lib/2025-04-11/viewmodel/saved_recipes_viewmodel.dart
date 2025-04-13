import 'package:flutter/foundation.dart';
import '../models/recipe/recipe.dart';
import '../repository/recipe_repository.dart';

class SavedRecipesViewModel extends ChangeNotifier {
  final RecipeRepository repository;

  List<Recipe> recipes = [];
  bool isLoading = true;

  SavedRecipesViewModel(this.repository) {
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    isLoading = true;
    notifyListeners();

    recipes = await repository.getSaveRecipe();

    isLoading = false;
    notifyListeners();
  }
}