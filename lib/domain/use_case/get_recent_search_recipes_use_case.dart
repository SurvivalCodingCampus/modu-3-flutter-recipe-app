import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class GetRecentSearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetRecentSearchRecipesUseCase(this._recipeRepository);

  Future<Result<List<Recipe>, RecipeError>> execute() async {
    return await _recipeRepository.getRecentSearchRecipes();
  }
}
