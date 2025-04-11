import 'dart:convert';
import 'dart:io';

import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/data/model/recipe.dart';

class MockRecipeDataSource implements RecipeDataSource {
  @override
  Future<List<Recipe>> fetch() async {
    File file = File('lib/data/data_source/mock/data/recipes.json');

    Map<String, dynamic> json = jsonDecode(await file.readAsString());

    List<dynamic> recipes = json['recipes'];

    await Future.delayed(const Duration(seconds: 1));

    return recipes
        .cast<Map<String, dynamic>>()
        .map((e) => RecipeDTO.fromJson(e))
        .map((e) => e.toModel())
        .toList();
  }
}
