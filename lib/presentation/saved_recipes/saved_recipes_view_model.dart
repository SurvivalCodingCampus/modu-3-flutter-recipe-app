import 'package:flutter/foundation.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/repository/recipe/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  final List<Recipe> _recipes = [];
  final bool _isLoading = false;

  SavedRecipesViewModel(this._recipeRepository);

  List<Recipe> get recipes => List.unmodifiable(_recipes);
  bool get isLoading => _isLoading;
}
