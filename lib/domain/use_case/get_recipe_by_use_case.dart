import '../../data/model/recipe_model.dart';
import '../../data/repository/recipe_repository/recipe_repository.dart';

class GetRecipeByUseCase {
  final RecipeRepository repository;

  GetRecipeByUseCase(this.repository);

  Future<Recipe> execute(String recipeId) async {
    return await repository.getRecipeById(recipeId);
  }
}
