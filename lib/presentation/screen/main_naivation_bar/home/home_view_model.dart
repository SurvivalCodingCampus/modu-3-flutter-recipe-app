import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/use_case/fetch_recipes_use_case.dart';

import 'package:recipe_app/domain/use_case/get_login_user_info_use_case.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/home/state/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final FetchRecipesUseCase _fetchRecipesUseCase;
  final GetLoginUserInfoUseCase _getLoginUserInfo;
  HomeViewModel({
    required FetchRecipesUseCase fetchRecipesUseCase,
    required GetLoginUserInfoUseCase getLoginUserInfo,
  }) : _fetchRecipesUseCase = fetchRecipesUseCase,
       _getLoginUserInfo = getLoginUserInfo;

  HomeState _state = HomeState();
  HomeState get state => _state;

  Future<void> getUserData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final user = await _getLoginUserInfo.execute();
    final recipes = await _fetchRecipesUseCase.execute();

    if (state.category == Category.all) {
      _state = state.copyWith(
        user: user,
        recipes: recipes,
        selectRecipes: recipes,
      );
    } else {
      final selectRecipe =
          recipes.where((recipe) => recipe.category == state.category).toList();
      _state = state.copyWith(
        user: user,
        recipes: recipes,
        selectRecipes: selectRecipe,
      );
    }

    notifyListeners();
  }

  void updateSelectedCategory(Category category) {
    final selectRecipe =
        state.recipes
            .where((recipe) => recipe.category == state.category)
            .toList();
    if (category == Category.all) {
      _state = state.copyWith(category: category, selectRecipes: state.recipes);
    } else {
      _state = state.copyWith(category: category, selectRecipes: selectRecipe);
    }

    notifyListeners();
  }
}
