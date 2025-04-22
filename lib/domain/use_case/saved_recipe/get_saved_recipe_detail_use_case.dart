import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

class GetSavedRecipeDetailUseCase {
  final RecipeRepository _recipeRepository;

  const GetSavedRecipeDetailUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<Recipe> excute(int recipeId) async {
    final recipe = _recipeRepository.getRecipe(recipeId);
    return recipe;
  }
}
