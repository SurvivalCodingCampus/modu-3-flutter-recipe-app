import '../../domain/model/recipe.dart';
import '../dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  Future<List<RecipeDto>> getRecipeDto();

  // Future<List<Recipe>> searchRecipes();
}