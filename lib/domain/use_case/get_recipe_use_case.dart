import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetRecipeUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipeUseCase(this._recipeRepository);

  Future<Result<Recipe, RecipeError>> execute(int id) async {
    return await _recipeRepository.findById(id);
  }
}
