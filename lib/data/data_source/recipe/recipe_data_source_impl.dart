import 'dart:convert';
import 'dart:io';

import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:recipe_app/model/recipe.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  final recipeFile = File('lib/data/recipe.json');
  @override
  Future<List<Recipe>> getRecipes() async {
    final jsonString = await recipeFile.readAsString();
    final List<Map<String, dynamic>> recipes = jsonDecode(jsonString);
    return [];
    // return recipes.map((recipe) => RecipeDto.fromJson(recipe)).toList();
  }
}
