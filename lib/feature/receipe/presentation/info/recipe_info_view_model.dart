import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/info/get_recipe_info_use_case.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_state.dart';

class RecipeInfoViewModel with ChangeNotifier {
  final GetRecipeInfoUseCase _getRecipeInfoUseCase;

  RecipeInfoViewModel(this._getRecipeInfoUseCase);

  RecipeInfoState _state = RecipeInfoState();
  RecipeInfoState get state => _state;

  void getRecipeInfo(int id) async {
    final result = await _getRecipeInfoUseCase.execute(id);
    switch (result) {
      case Success<Recipe>():
        _state = state.copyWith(state: ViewState.complete, recipe: result.data);
      case Error<Recipe>():
        _state = state.copyWith(state: ViewState.error);
    }
    notifyListeners();
  }
}
