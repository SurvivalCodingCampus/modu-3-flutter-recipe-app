import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

class SaveRecentRecipesUseCase {
  final RecipeRepository _recipeRepository;

  SaveRecentRecipesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<void> excute(String query) async {
    final seacrh = await _recipeRepository.getSearchRecipes(query);
    final ids = seacrh.map((e) => e.id).toSet().toList();
    return await _recipeRepository.saveRecentRecipes(ids);
  }
}
