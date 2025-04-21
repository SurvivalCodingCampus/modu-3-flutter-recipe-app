import 'package:recipe_app/domain/model/recipe/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getSaveRecipeList();
  Future<List<Recipe>> getAllRecipeList();

}
