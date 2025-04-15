

import 'dart:convert';

import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/data/model/recipes.dart';


class RecipeDataSourceImpl implements RecipeDataSource {
  static const String _url = 'https://raw.githubusercontent.com/junsuk5/mock_json/main/recipe/recipes.json';

  @override
  Future<List<Recipes>> getRecipes() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> recipeJson = decoded['recipes'];
      return recipeJson.map((e) => Recipes.fromJson(e)).toList();
    } else {
      throw Exception('exception');
    }
  }
}
