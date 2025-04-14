import 'package:flutter/cupertino.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final SearchRecipesState _searchRecipesState = SearchRecipesState();

  RecipeRepository get recipeRepository => _recipeRepository;

  SearchRecipesViewModel(this._recipeRepository);

  SearchRecipesState get searchRecipesState => _searchRecipesState;
}
