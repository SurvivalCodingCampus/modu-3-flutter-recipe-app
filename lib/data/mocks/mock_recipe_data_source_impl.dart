import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recipe_app/core/platform/json_storage.dart';
import 'package:recipe_app/core/platform/json_storage_key.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';

class MockRecipeDataSourceImpl implements RecipeDataSource {
  static const String assetPath = 'assets/data/recipes.json';

  @override
  Future<List<RecipeDto>> fetchRecipes() async {
    try {
      final loaded = await JsonStorage.load(JsonStorageKey.recipes);
      final json = loaded ?? await _loadFromAssets();

      if (json == null || json['recipes'] is! List) {
        throw MockRecipeDataSourceException('recipes.json 형식 오류 또는 데이터 없음');
      }

      final list = json['recipes'] as List;
      return list
          .map((e) => RecipeDto.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (e) {
      throw MockRecipeDataSourceException('recipes.json 로드 실패', cause: e);
    }
  }

  @override
  Future<RecipeDto?> fetchRecipeById(int id) async {
    final list = await fetchRecipes();
    return list.firstWhereOrNull((r) => r.id == id);
  }

  Future<Map<String, dynamic>?> _loadFromAssets() async {
    final assetStr = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(assetStr);
    if (decoded is Map<String, dynamic>) {
      await JsonStorage.save(JsonStorageKey.recipes, decoded);
      return decoded;
    }
    return null;
  }
}

class MockRecipeDataSourceException implements Exception {
  final String message;
  final Object? cause;

  MockRecipeDataSourceException(this.message, {this.cause});

  @override
  String toString() {
    return 'MockRecipeDataSourceException: $message'
        '${cause != null ? '\nCaused by: $cause' : ''}';
  }
}
