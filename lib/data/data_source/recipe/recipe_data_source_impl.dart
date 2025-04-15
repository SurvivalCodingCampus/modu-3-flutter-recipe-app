import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:recipe_app/dto/recipe_dto.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  @override
  Future<List<RecipeDto>> getRecipes() async {
    final jsonString = await rootBundle.loadString('assets/json/recipe.json');
    final List<dynamic> recipes = jsonDecode(jsonString);

    return recipes.map((recipe) => RecipeDto.fromJson(recipe)).toList();
  }
}
