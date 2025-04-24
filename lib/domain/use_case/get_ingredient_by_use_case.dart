import '../../data/model/recipe_model.dart';
import '../../data/repository/recipe_repository/recipe_repository.dart';

class GetIngredientByUseCase {
  final RecipeRepository repository;

  GetIngredientByUseCase(this.repository);

  Future<List<Recipe>> execute(int id) async {
    // return await repository.getIngredientsByRecipe(id);
    return await repository.getRecipesByIngredient(id.toString());
  }
}
