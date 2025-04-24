import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';

import '../../dto/ingredient_dto.dart';
import '../../dto/ingredient_item_dto.dart';
import '../../dto/procedure_dto.dart';
import '../../dto/recipe_dto.dart';
import '../../mapper/recipe_mapper.dart';
import '../../model/recipe_model.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  @override
  Future<List<Recipe>> getRecipes() async {
    try {
      final results = await Future.wait([
        rootBundle.loadString('assets/json_data/recipe.json'),
        rootBundle.loadString('assets/json_data/ingredients.json'),
      ]);

      final recipeJson = results[0];
      final ingredientJson = results[1];

      final recipeMap = json.decode(recipeJson) as Map<String, dynamic>;
      final recipeData = recipeMap['recipes'] as List<dynamic>;

      final ingredientMap = json.decode(ingredientJson);
      final ingredientData = ingredientMap['ingredients'] as List<dynamic>;

      final recipeDtos = recipeData.map((e) => RecipeDto.fromJson(e)).toList();

      final ingredientDtos =
          ingredientData.map((e) => IngredientDto.fromJson(e)).toList();

      final recipes = recipeDtos.map((dto) => ToRecipe.fromDto(dto)).toList();

      if (kDebugMode) {
        print('getRecipes: ${recipes.length}개 로드됨');
      }

      return recipes;
    } on FileSystemException catch (e) {
      if (kDebugMode) print('파일 로드 오류: $e');
      return [];
    } on FormatException catch (e) {
      if (kDebugMode) print('JSON 파싱 오류: $e');
      return [];
    } catch (e) {
      if (kDebugMode) print('데이터 로드 오류: $e');
      return [];
    }
  }

  @override
  Future<List<Recipe>> searchRecipes(String keyword) async {
    final allRecipes = await getRecipes();

    if (keyword.isEmpty) {
      return allRecipes;
    }

    return allRecipes.where((recipe) {
      final keywordLower = keyword.toLowerCase();
      return recipe.name.toLowerCase().contains(keywordLower) ||
          recipe.ingredients.any(
            (ingredient) =>
                ingredient.ingredient.name.toLowerCase().contains(keywordLower),
          );
    }).toList();
  }
}
