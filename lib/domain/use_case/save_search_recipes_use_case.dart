import 'dart:convert';
import 'dart:io';

import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';


class SaveSearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SaveSearchRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<Recipe>> searchFilterRecipesList({required String text}) async {
    final List<Recipe> allRecipesList =
        await _recipeRepository.getAllRecipeList();
    final List<Recipe> searchRecipesList =
        allRecipesList.where((items) => items.name.contains(text)).toList();

    return text.isNotEmpty ?  searchRecipesList : allRecipesList;
  }
}
