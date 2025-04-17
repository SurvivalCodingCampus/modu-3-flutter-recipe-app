import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/repository/home/recipe_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetSavedRecipesUseCase(this._recipeRepository);

  Future<Result<List<Recipe>>> excute() {
    final result = _recipeRepository.getRecipes();
    return result;
  }
}
