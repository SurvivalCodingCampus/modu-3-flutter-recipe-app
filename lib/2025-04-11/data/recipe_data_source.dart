import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/recipe/recipes_response.dart';

class RecipeDataSource {
  Future<RecipesResponse> fetchRecipes() async {
    final jsonStr = await rootBundle.loadString('assets/recipes.json');
    final json = jsonDecode(jsonStr);
    return RecipesResponse.fromJson(json);
  }
}