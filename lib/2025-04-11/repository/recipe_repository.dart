import '../data/recipe_data_source.dart';
import '../models/recipe/recipe.dart';

class RecipeRepository {
  final RecipeDataSource dataSource;

  RecipeRepository(this.dataSource);

  Future<List<Recipe>> getSaveRecipe() async {
    final response = await dataSource.fetchRecipes();
    return response.recipes;
  }
}