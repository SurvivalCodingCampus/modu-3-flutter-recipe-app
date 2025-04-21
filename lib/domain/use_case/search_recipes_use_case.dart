import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SearchRecipesUseCase(this._recipeRepository);

  Future<Result<List<Recipe>, RecipeError>> execute(String query) async {
    return await _recipeRepository.findAllByFilter(
      (e) => e.name.toLowerCase().contains(query.toLowerCase()),
    );
  }
}
