import 'package:flutter/cupertino.dart';
import 'package:recipe_app/presentation/saved_recipe/get_saved_recipe_use_case.dart';

import '../../data/model/recipes.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final GetSavedRecipeUseCase _getSavedRecipeUseCase;

  SavedRecipeViewModel(this._getSavedRecipeUseCase);

  List<Recipes> _recipes = List.unmodifiable([]);
  bool _isLoading = false;

  List<Recipes> get recipes => _recipes;
  bool get isLoading => _isLoading;

  Future<void> fetchSavedRecipes() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _getSavedRecipeUseCase.execute();

    _isLoading = false;
    notifyListeners();
  }
  Future<void> removeRecipeIds(int recipeId) async {
    _isLoading = true;
    notifyListeners();

    await _getSavedRecipeUseCase.removeRecipeId(recipeId);

    _recipes = await _getSavedRecipeUseCase.execute();

    _isLoading = false;
    notifyListeners();
  }
}
