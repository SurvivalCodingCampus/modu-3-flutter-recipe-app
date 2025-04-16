
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/bookmark_recipe/bookmark_repository.dart';

import '../../data/model/recipes.dart';

class GetSavedRecipeUseCase {
  final BookmarkRepository _bookmarkRepository;

  GetSavedRecipeUseCase(this._bookmarkRepository);

  Future<List<Recipes>> execute() async {
    final recipes = await _bookmarkRepository.getBookmarkRecipes();
    return recipes;
  }

  Future<void> removeRecipeId(int recipeId) async {
    await _bookmarkRepository.removeBookmark(recipeId);
  }
}