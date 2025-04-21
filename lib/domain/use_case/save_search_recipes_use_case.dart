import 'dart:convert';
import 'dart:io';

import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

// Future<Map<String, dynamic>> getBeforeSearch() async {
//    File allRecipeFile = File('lib/data_source/recipes/recipes.json');
//    File searchRecipeFile = File(
//       'lib/data_source/recipes/recipes_search_result.json',
//    );
//
//    if (await searchRecipeFile.exists()) {
//       final response = await searchRecipeFile.readAsString();
//       return jsonDecode(response);
//    } else {
//       final response = await allRecipeFile.readAsString();
//       return jsonDecode(response);
//    }
// }

class SaveSearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SaveSearchRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<Recipe>> searchFilterRecipesList({required String text}) async {
    final List<Recipe> allRecipesList =
        await _recipeRepository.getAllRecipeList();
    final List<Recipe> searchRecipesList =
        allRecipesList.where((items) => items.name.contains(text)).toList();

    return searchRecipesList;
  }
}
