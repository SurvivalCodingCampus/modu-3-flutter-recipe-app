import 'package:flutter/foundation.dart';
import 'package:recipe_app/recipe_app/model/recipe.dart';
import 'package:recipe_app/recipe_app/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel(this._recipeRepository);

  List<Recipe> _recipes = [];

  //List내용 임의로 변형시키지 못함
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoding = false;

  bool get isLoding => _isLoding;

  Future<void> loadRecipesData() async {
    _isLoding = true;
    notifyListeners();

    _recipes = await _recipeRepository.fetchRecipes();
    _isLoding = false;
    notifyListeners();
  }
}
