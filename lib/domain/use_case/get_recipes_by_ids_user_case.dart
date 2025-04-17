import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/roepositpry/recipe_repository.dart';

class GetRecipesByIdsUserCase {
  final RecipeRepository _recipeRepository;

  GetRecipesByIdsUserCase(this._recipeRepository);

  Future<List<Recipe>> execute(List<int> recipeIds) async {
    final allRecipes = await _recipeRepository.getRecipes();
    return recipeIds
        .map((id) => allRecipes.firstWhere((r) => r.recipeId == id))
        .whereType<Recipe>()
        .toList();
  }
}
