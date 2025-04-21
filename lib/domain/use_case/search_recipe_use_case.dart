import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/domain/repository/repository.dart';

class SearchRecipeUseCase {
  final RecipeRepository _recipeRepository;
  final SearchRecipeRepository _searchRecipeRepository;

  SearchRecipeUseCase({
    required RecipeRepository recipeRepository,
    required SearchRecipeRepository searchRecipeRepository,
  }) : _recipeRepository = recipeRepository,
       _searchRecipeRepository = searchRecipeRepository;

  Future<List<Recipe>> execute(String query, Filter filter) async {
    final result =
        (await _recipeRepository.getRecipes())
            .where(
              (e) =>
                  e.name.toLowerCase().contains(query.toLowerCase()) ||
                  e.chef.toLowerCase().contains(query.toLowerCase()),
            )
            .where((e) {
              if (filter.time == 'All') {
                return true;
              }
              return e.totalTimeMinutes == filter.time;
            })
            .where((e) => e.rating >= filter.rate)
            .where((e) {
              if (filter.category == 'All') {
                return true;
              }
              return filter.category == e.category;
            })
            .toList();

    await _searchRecipeRepository.saveRecipes(result);

    return result;
  }
}
