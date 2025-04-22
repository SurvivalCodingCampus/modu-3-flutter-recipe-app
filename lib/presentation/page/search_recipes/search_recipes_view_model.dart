import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/use_case/save_search_recipes_use_case.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  final SaveSearchRecipesUseCase _saveSearchRecipesUseCase =
      SaveSearchRecipesUseCase(recipeRepository: getIt());

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesState get state => _state;

  void getRecipes({
    required List<Recipe> beforeSearchList,
  }) async {
    _state = _state.copyWith(isSearchLoading: true);
    notifyListeners();

    if (beforeSearchList.isEmpty) {
      _state = _state.copyWith(
        recipes: await _recipeRepository.getAllRecipeList(),
        isSearchLoading: false,
      );
    } else {
      _state = _state.copyWith(
        recipes:beforeSearchList,
        isSearchLoading: false,
      );
    }

    notifyListeners();
  }

  void searchRecipes({required String keyWord}) async {
    _state = _state.copyWith(isSearchLoading: true, searchKeyWord: keyWord);
    notifyListeners();

    _state = _state.copyWith(
      searchKeyWord: keyWord,
      filterRecipes: await _saveSearchRecipesUseCase.searchFilterRecipesList(
        text: keyWord,
      ),
      isSearchLoading: false,
    );
    notifyListeners();
  }

  void filterSearchRecipes({
    required Map<String, dynamic> filterMap,
  }) async {
    List<Recipe> targetList;


    String keyWord = _state.searchKeyWord;

    if (keyWord != '') {
      targetList = await _saveSearchRecipesUseCase.searchFilterRecipesList(
        text: keyWord,
      );
    } else {
      targetList = await _recipeRepository.getAllRecipeList();
    }

    // if (filterMap["selectTimeString"] == '' &&
    //     filterMap["selectCategoryString"] == '' &&
    //     filterMap["selectRateString"] == '') {
    //   targetList ==
    //       await _saveSearchRecipesUseCase.searchFilterRecipesList(text: '');
    // }

    if (filterMap["selectRateString"] != '') {
      targetList =
          targetList
              .where(
                (items) =>
                    items.rating.toInt().toString() ==
                    filterMap["selectRateString"],
              )
              .toList();
    }

    if (filterMap["selectCategoryString"] != 'All') {
      targetList =
          targetList
              .where(
                (items) => items.category == filterMap["selectCategoryString"],
              )
              .toList();
    }

    print('targetList $targetList');

    _state = _state.copyWith(filterRecipes: targetList);
    notifyListeners();
  }
}
