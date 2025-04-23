import 'package:flutter/material.dart';
import 'package:recipe_app/core/result_extension.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/remove_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_screen_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final RemoveSavedRecipesUseCase _removeSavedRecipeUseCase;

  HomeScreenState _state = const HomeScreenState();

  HomeViewModel(this._getSavedRecipesUseCase, this._removeSavedRecipeUseCase);

  HomeScreenState get state => _state;

  void onAction(HomeAction action) {
    switch (action) {
      case OnTapBookmark(:final int recipeId):
        _removeRecipe(recipeId);
        break;
      case OnTapCategory():
        break;
      case OnTapSearchBar():
        break;
      case OnTapCard():
        break;
    }
  }

  void fetch() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _getSavedRecipesUseCase.execute();

    recipes.handle(
      onSuccess: (recipes) {
        _state = _state.copyWith(savedRecipes: recipes, isLoading: false);
      },
      onError: (error) {},
    );

    notifyListeners();
  }

  void _removeRecipe(int recipeId) async {
    await _removeSavedRecipeUseCase.execute(recipeId);
    notifyListeners();
  }
}
