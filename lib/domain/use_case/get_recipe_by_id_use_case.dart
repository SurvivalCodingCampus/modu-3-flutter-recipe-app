import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetRecipeByIdUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipeByIdUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Recipe> execute(int recipeId) async {
    final recipes = await _recipeRepository.getRecipes();
    final recipe = recipes.firstWhere(
      (element) => element.recipeId == recipeId,
    );
    return recipe;
  }
}
