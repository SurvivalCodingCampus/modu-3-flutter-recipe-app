import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/bookmark/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository;

  Future<List<Recipe>> excute(int userId) async {
    final recipes = await _recipeRepository.getRecipes();

    final bookmarks = await _bookmarkRepository.getBookmarks(userId);

    final bookmarkedRecipeIds = bookmarks.first.recipesId;
    final savedRecipes =
        recipes
            .where((recipe) => bookmarkedRecipeIds.contains(recipe.id))
            .toList();
    return savedRecipes;
  }
}
