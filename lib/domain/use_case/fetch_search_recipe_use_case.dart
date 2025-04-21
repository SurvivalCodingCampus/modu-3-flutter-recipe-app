import '../../data/model/recipe_model.dart';
import '../../data/repository/recipe_repository/recipe_repository.dart';

class FetchSearchRecipeUseCase {
  final RecipeRepository _repository;
  List<Recipe>? _cachedResults;

  FetchSearchRecipeUseCase(this._repository);

  Future<List<Recipe>> execute(String keyword) async {
    final results = await _repository.searchRecipes(keyword);
    _cachedResults = results;
    return results;
  }

  List<Recipe>? get lastCachedResults => _cachedResults;
}
