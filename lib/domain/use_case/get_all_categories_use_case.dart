import 'package:recipe_app/domain/repository/repository.dart';

class GetAllCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  GetAllCategoriesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<List<String>> execute() async {
    final recipes = await _recipeRepository.getRecipes();

    return {'All', ...recipes.map((e) => e.category)}.toList();
  }
}
