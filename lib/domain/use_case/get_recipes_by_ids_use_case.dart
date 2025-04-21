import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetRecipesByIdsUseCase {
  final RecipeRepository _repository;

  GetRecipesByIdsUseCase({required RecipeRepository repository})
    : _repository = repository;

  Future<List<Recipe>> execute(List<int> recipeIds) async {
    final allRecipes = await _repository.getRecipes();
    return recipeIds
        .map((id) => allRecipes.firstWhere((r) => r.recipeId == id))
        .whereType<Recipe>()
        .toList();
  }
}
