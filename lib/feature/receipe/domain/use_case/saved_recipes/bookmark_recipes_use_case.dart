import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/repository/home/recipe_repository.dart';

class BookmarkRecipesUseCase {
  final RecipeRepository _recipeRepository;

  BookmarkRecipesUseCase(this._recipeRepository);

  Future<Result<bool>> bookmarkRecipe(int id) async {
    return _recipeRepository.bookmarkRecipe(id);
  }
}
