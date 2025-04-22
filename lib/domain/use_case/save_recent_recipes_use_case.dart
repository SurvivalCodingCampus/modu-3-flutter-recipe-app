import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class SaveRecentRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SaveRecentRecipesUseCase({required RecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository;

  Future<void> saveRecentRecipes(List<Recipe> recipes) async {
    await _recipeRepository.saveRecentRecipes(recipes);
  }
}
