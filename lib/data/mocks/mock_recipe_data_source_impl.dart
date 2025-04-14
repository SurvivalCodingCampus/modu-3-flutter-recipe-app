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

class MockHangDataSourceImpl implements RecipeDataSource {
  @override
  Future<List<RecipeDto>> fetchRecipes() async {
    return [
      RecipeDto(
        id: 1,
        name: '끝나지 않는 김치볶음밥',
        category: '밥요리',
        image: 'http://10.255.255.1/image1.jpg', // 응답 없는 IP
        chef: '느린 셰프',
        time: '999분',
        rating: 1.0,
        ingredients: [],
      ),
      RecipeDto(
        id: 2,
        name: '응답 없는 카레',
        category: '카레',
        image: 'https://example.com/hang_image.jpg', // 존재하지 않는 주소
        chef: '404 셰프',
        time: '∞',
        rating: 2.0,
        ingredients: [],
      ),
      RecipeDto(
        id: 3,
        name: '로딩 중인 국수',
        category: '면요리',
        image: 'http://10.255.255.1/image2.jpg',
        chef: '핑핑 도는 셰프',
        time: '불명',
        rating: 3.5,
        ingredients: [],
      ),
    ];
  }
}
