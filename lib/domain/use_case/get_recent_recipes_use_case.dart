import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetRecentRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetRecentRecipesUseCase({required RecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository;

  Future<List<Recipe>> getRecentRecipes() async {
    return await _recipeRepository.getSavedRecentRecipes();
  }
}
