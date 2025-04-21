import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:recipe_app/data/dto/ingredient_dto.dart';

Future<List<IngredientDto>> loadIngredientsFromJson() async {
  final jsonString = await rootBundle.loadString('assets/json/ingredients.json');
  final jsonMap = json.decode(jsonString);
  final ingredients = jsonMap['ingredients'] as List<dynamic>;

  return ingredients
      .map((json) => IngredientDto.fromJson(json as Map<String, dynamic>))
      .toList();
}
