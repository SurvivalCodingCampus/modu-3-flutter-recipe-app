import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';
import 'package:recipe_app/feature/receipe/data/repository/home/recipe_repository.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel(this._recipeRepository);

  SavedRecipesState _state = const SavedRecipesState();
  SavedRecipesState get state => _state;

  void fetchRecipes() async {
    _state = state.copyWith(viewState: ViewState.loading);
    notifyListeners();
    final resp = await _recipeRepository.getRecipes();
    switch (resp) {
      case Success<List<Recipe>>():
        _state = state.copyWith(data: resp.data, viewState: ViewState.complete);
      case Error<List<Recipe>>():
        _state = state.copyWith(viewState: ViewState.error);
    }
    notifyListeners();
  }
}
