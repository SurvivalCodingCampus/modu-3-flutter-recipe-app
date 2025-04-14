import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  @override
  Future<List<RecipeDto>> fetchRecipes() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/json/recipes.json',
      );
      final Map<String, dynamic> decoded = json.decode(jsonString);
      final List<dynamic> jsonList = decoded['recipes'] ?? [];
      return jsonList
          .map(
            (jsonItem) => RecipeDto.fromJson(jsonItem as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      print('Error loading recipes: $e');
      return [];
    }
  }
}
