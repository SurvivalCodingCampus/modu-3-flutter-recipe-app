import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';

class GetSavedRecipesUseCase {
  final BookmarkRepository _bookmarkRepository;

  const GetSavedRecipesUseCase(this._bookmarkRepository);

  Future<Result<List<Recipe>, RecipeError>> execute() async {
    return _bookmarkRepository.findAll();
  }
}
