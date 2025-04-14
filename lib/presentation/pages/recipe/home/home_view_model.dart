import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/core/modules/state/base_state.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';
import 'package:recipe_app/feature/receipe/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/pages/recipe/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  HomeViewModel(this._recipeRepository);

  ListBaseState<Recipe> _state = const HomeState();
  ListBaseState<Recipe> get state => _state;

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
