import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/domain/repository/repository.dart';

class ToggleBookmarkRecipeUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  ToggleBookmarkRecipeUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository;

  Future<List<Recipe>> execute(int id) async {
    final recipes = await _recipeRepository.getRecipes();
    await _bookmarkRepository.toggle(id);

    final ids = await _bookmarkRepository.getIds();
    return recipes.where((e) => ids.contains(int.parse(e.id))).toList();
  }
}
