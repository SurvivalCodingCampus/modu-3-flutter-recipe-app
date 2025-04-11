import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';

import '../model/recipe.dart';

class RecipeDataSourceImpl implements RecipeDataSource {
  @override
  Future<List<Recipe>> getRecipeData() async {
    return [];
  }
}
