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

  void getRecipes({required List<Map<String,dynamic>> beforeSearchList}) async {
    _state = _state.copyWith(isSearchLoading: true);
    print("beforeSearchList $beforeSearchList");
    notifyListeners();

    if (beforeSearchList.isEmpty) {
      _state = _state.copyWith(
        recipes: await _recipeRepository.getAllRecipeList(),
        isSearchLoading: false,
      );
    }else{
      _state = _state.copyWith(
        recipes: beforeSearchList.map((items) => Recipe.fromJson(items)).toList(),
        isSearchLoading: false,
      );
    }

    notifyListeners();
  }

  void searchRecipes({required String keyWord}) async {
    _state = _state.copyWith(isSearchLoading: true);
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

  Future<List<Map<String, dynamic>>> saveWriteFile({required String text}) async {
    final filterRecipesList = await _saveSearchRecipesUseCase
        .searchFilterRecipesList(text: text);

    final List<Map<String, dynamic>> filterMapList =
        filterRecipesList.map((items) => items.toJson()).toList();

    return filterMapList;

  }
}
