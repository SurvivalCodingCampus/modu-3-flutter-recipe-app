import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

class GetRecentSearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetRecentSearchRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<Recipe>> excute() async {
    return await _recipeRepository.getRecentRecipes();
  }
}
