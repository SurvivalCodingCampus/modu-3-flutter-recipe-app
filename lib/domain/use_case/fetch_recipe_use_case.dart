import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/roepositpry/recipe_repository.dart';

class FetchRecipeUseCase {
  final RecipeRepository _recipeRepository;

  FetchRecipeUseCase(this._recipeRepository);

  Future<Recipe> execute(int recipeId) async {
    return await _recipeRepository.getRecipe(recipeId);
  }
}
