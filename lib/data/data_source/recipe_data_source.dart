// Project imports:

import 'package:recipe_app/data/dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  Future<List<RecipeDto>> fetchRecipes();
  Future<RecipeDto?> fetchRecipeById(int id);
  Future<void> updateRecipeRating({
    required int recipeId,
    required double rating,
  });
}
