import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/repository/recipe/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesViewModel(this._recipeRepository);
}
