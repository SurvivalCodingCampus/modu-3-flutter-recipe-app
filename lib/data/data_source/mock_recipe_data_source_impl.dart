import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';

import '../dto/recipe_dto.dart';

class MockRecipeDataSourceImpl implements RecipeDataSource{
  @override
  Future<List<RecipeDto>> getRecipeDtos() async {
    // final File file = File('lib/data/mock_data/recipes.json');
    final String fileString = await rootBundle.loadString('assets/mock_data/recipes.json');
    final Map<String, dynamic> json = jsonDecode(fileString);
    final List<dynamic> recipes = json['recipes'];

    return recipes.map((e) => RecipeDto.fromJson(e)).toList();
  }
}