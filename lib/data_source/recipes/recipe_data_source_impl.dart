import 'dart:convert';

import 'package:recipe_app/data_source/recipes/recipe_data_source.dart';
import 'package:http/http.dart' as http;

class RecipeDataSourceImpl implements RecipeDataSource {
  @override
  Future<Map<String, dynamic>> getRecipes() async{
    final response = await http.get(Uri.parse('https://github'
        '.com/junsuk5/mock_json/blob/main/recipe/recipes.json'));
    return jsonDecode(response.body);
  }
}
