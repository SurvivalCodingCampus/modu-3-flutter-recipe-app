import 'dart:convert';
import 'dart:io';

import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:http/http.dart' as http;

class MockRecipeDataSource implements RecipeDataSource {
  final http.Client _client;
  final String _url;

  MockRecipeDataSource({required http.Client client, required String url})
    : _client = client,
      _url = url;

  @override
  Future<List<Map<String, dynamic>>> getRecipeMaps() async {
    String jsonString =
        await File(
          '/Users/eastar/Documents/github/modu-3-flutter-recipe-app/assets/json/recipes.json',
        ).readAsString();
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    List recipeList = jsonMap["recipes"];
    final List<Map<String, dynamic>> result =
        recipeList.map((e) {
          String category = e["category"];
          String imageUrl = e["image"];
          e["category"] = category.toLowerCase();
          
          return e as Map<String, dynamic>;
        }).toList();
    return result;
  }
}
