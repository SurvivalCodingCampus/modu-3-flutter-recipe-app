import '../../data/model/recipe_ingredient.dart';
import '../../data/repository/recipe_repository/recipe_repository.dart';

class GetIngredientByUseCase {
  final RecipeRepository repository;
  GetIngredientByUseCase(this.repository);

  Future<List<RecipeIngredient>> excute(String recipeId) async {
    return await repository.getIngredientsByRecipe(recipeId);
  }
}
