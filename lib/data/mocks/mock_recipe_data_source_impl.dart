import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';

class MockRecipeDataSourceImpl implements RecipeDataSource {
  final String _path;

  MockRecipeDataSourceImpl({String filePath = 'assets/data/recipes.json'})
    : _path = filePath;

  @override
  Future<List<RecipeDto>> fetchRecipes() async {
    try {
      final jsonStr = await rootBundle.loadString(_path);
      final decoded = json.decode(jsonStr);

      return (decoded['recipes'] as List)
          .map((e) => RecipeDto.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (e) {
      // 예외 처리
      throw Exception('recipes 를 읽을 수 없음 : $e');
    }
  }
}

class MockSuccessDataSourceImpl implements RecipeDataSource {
  @override
  Future<List<RecipeDto>> fetchRecipes() async {
    return [
      RecipeDto(
        id: 1,
        name: 'Test Recipe',
        category: 'Test',
        image: '',
        chef: 'Chef',
        time: '10 min',
        rating: 4.0,
        ingredients: [],
      ),
    ];
  }
}

class MockFailDataSourceImpl implements RecipeDataSource {
  @override
  Future<List<RecipeDto>> fetchRecipes() async {
    throw Exception('DataSource failed');
  }
}
