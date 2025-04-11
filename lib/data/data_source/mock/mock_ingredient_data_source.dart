import 'dart:convert';
import 'dart:io';

import 'package:recipe_app/data/data_source/interface/ingredient_data_source.dart';
import 'package:recipe_app/data/dto/ingredient_dto.dart';
import 'package:recipe_app/data/mapper/ingredient_mapper.dart';
import 'package:recipe_app/data/model/ingredient.dart';

class MockIngredientDataSource implements IngredientDataSource {
  @override
  Future<List<Ingredient>> fetch() async {
    File file = File('lib/data/data_source/mock/data/ingredients.json');

    Map<String, dynamic> json = jsonDecode(await file.readAsString());

    List<dynamic> ingredients = json['ingredients'];

    await Future.delayed(const Duration(seconds: 1));

    return ingredients
        .cast<Map<String, dynamic>>()
        .map((e) => IngredientDTO.fromJson(e))
        .map((e) => e.toModel())
        .toList();
  }
}
