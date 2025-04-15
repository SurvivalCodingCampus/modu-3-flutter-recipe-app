import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  final String path = 'assets/data/recipe.json';

  RecipeDataSourceImpl();

  @override
  Future<List<RecipeDto>> getRecipeDto() async {
    try {
      await Future.delayed(const Duration(microseconds: 500000));
      final jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> recipesJson = jsonMap['recipes'];
      return recipesJson.map((e) => RecipeDto.fromJson(e)).toList();
    } catch (e) {
      throw Exception('레시피 데이터를 불러오는 데 실패했습니다.');
    }
  }

  @override
  Future<List<RecipeDto>> getSearchRecipeDto(String keyword) async {
    try {
      final jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> recipesJson = jsonMap['recipes'];
      return recipesJson
          .where((e) => e['name'].toString().contains(keyword))
          .map((e) => RecipeDto.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception('검색 레시피 데이터를 불러오는 데 실패했습니다.');
    }
  }
}
