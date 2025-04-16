import 'package:flutter/cupertino.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_recipe_use_case.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_screen_state.dart';

class IngredientScreenViewModel with ChangeNotifier {
  final GetRecipeUseCase getRecipeUseCase;

  IngredientScreenState _state = const IngredientScreenState();

  IngredientScreenViewModel(this.getRecipeUseCase);

  bool get isLoading => _state.isLoading;
  IngredientScreenState get state => _state;
  Recipe? get recipe => _state.recipe;
  String? get error => _state.error;

  Future<void> fetchRecipe(int recipeId) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Recipe? recipe = await getRecipeUseCase.execute(recipeId);

    if (recipe != null) {
      _state = _state.copyWith(recipe: recipe, isLoading: false);
    } else {
      _state = _state.copyWith(error: '잘못된 접근입니다.', isLoading: false);
    }

    notifyListeners();
  }
}
