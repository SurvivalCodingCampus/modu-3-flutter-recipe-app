import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class FetchRecipeUseCase {
  final RecipeRepository _repository;

  FetchRecipeUseCase({required RecipeRepository repository})
    : _repository = repository;

  Future<Recipe> execute(int recipeId) async {
    return await _repository.getRecipe(recipeId);
  }
}
