import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/domain/repository/repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository;

  Future<List<Recipe>> execute() async {
    final recipes = await _recipeRepository.getRecipes();

    final bookmarkedIds = await _bookmarkRepository.getIds();

    return recipes
        .where((e) => bookmarkedIds.contains(int.parse(e.id)))
        .toList();
  }
}
