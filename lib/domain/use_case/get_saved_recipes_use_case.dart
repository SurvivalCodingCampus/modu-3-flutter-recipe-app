import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetSavedRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<Recipe>> getSavedRecipes() async {
    final recipes = await _recipeRepository.getRecipes();
    return recipes;
  }
}
