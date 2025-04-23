import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/domain/repository/repository.dart';

class GetRecipesByCategoryUseCase {
  final RecipeRepository _recipeRepository;
  final BookmarkRepository _bookmarkRepository;

  GetRecipesByCategoryUseCase({
    required RecipeRepository recipeRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _bookmarkRepository = bookmarkRepository;

  Future<List<Recipe>> execute(String category) async {
    final recipes = await _recipeRepository.getRecipes();
    final ids = await _bookmarkRepository.getIds();
    final result =
        recipes
            .map((e) {
              if (ids.contains(int.parse(e.id))) {
                return e.copyWith(isFavorite: true);
              }
              return e;
            })
            .where((e) => category == "All" || e.category == category)
            .toList();
    return result;
  }
}
