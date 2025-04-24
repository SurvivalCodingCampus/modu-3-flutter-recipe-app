import 'package:flutter/material.dart';
import 'package:recipe_app/domain/use_case/recipe/fetch_recipe_use_case.dart';
import 'package:recipe_app/domain/use_case/recipe/get_recipe_procedure_use_case.dart';
import 'package:recipe_app/domain/use_case/user/get_user_info_use_case.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/state/recipe_detail_state.dart';

class RecipeDetailViewModel with ChangeNotifier {
  final FetchRecipeUseCase _fetchRecipeUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;
  final GetRecipeProcedureUseCase _getRecipeProcedureUseCase;

  RecipeDetailViewModel({
    required FetchRecipeUseCase fetchRecipeUseCase,
    required GetUserInfoUseCase getUserInfoUseCase,
    required GetRecipeProcedureUseCase getRecipeProcedureUseCase,
  }) : _fetchRecipeUseCase = fetchRecipeUseCase,
       _getUserInfoUseCase = getUserInfoUseCase,
       _getRecipeProcedureUseCase = getRecipeProcedureUseCase;

  RecipeDetailState _state = RecipeDetailState();
  RecipeDetailState get state => _state;

  Future<void> fetchRecipe(int recipeId) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    // 레시피 단일 조회
    _state = state.copyWith(
      recipe: await _fetchRecipeUseCase.execute(recipeId),
      isLoading: false,
    );
    _state = state.copyWith(
      user: await _getUserInfoUseCase.execute(
        state.recipe!.userName,
      ), // 레시피 작성자 정보 조회
    );

    _state = state.copyWith(
      procedure: await _getRecipeProcedureUseCase.execute(recipeId),
    ); // 레시피 절차 조회

    // 레시피
    notifyListeners();
  }

  Future<void> changeTabIndex(int index) async {
    _state = state.copyWith(selectedTabIndex: index);
    notifyListeners();
  }
}
