import 'package:recipe_app/feature/receipe/domain/dto/recipe_dto.dart';

abstract interface class SearchRecipeDataSource {
  Future<List<RecipeDto>> getRecipes();
}
