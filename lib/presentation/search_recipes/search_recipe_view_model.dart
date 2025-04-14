import 'package:flutter/cupertino.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_state.dart';

class SearchRecipeViewModel with ChangeNotifier{
  final RecipeRepository _recipeRepository;

  SearchRecipeViewModel(this._recipeRepository, this._state);

  SearchRecipeState _state = SearchRecipeState(recipes: [], keyword: '', isLoading: false, filterRecipes: []);
  SearchRecipeState get state => _state;

}