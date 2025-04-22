import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/repository/search/search_recipe_repository.dart';

class GetSavedRecipesUseCase {
  final SearchRecipeRepository _searchRecipeRepository;

  GetSavedRecipesUseCase(this._searchRecipeRepository);

  Future<Result<List<Recipe>>> excute() {
    final result = _searchRecipeRepository.getRecipes();
    return result;
  }
}
