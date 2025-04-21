import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/repository/search/search_recipe_repository.dart';

class GetRecentSearchTextUseCase {
  final SearchRecipeRepository _searchRecipeRepository;

  GetRecentSearchTextUseCase(this._searchRecipeRepository);

  Future<Result<List<String>>> execute() async {
    final result = await _searchRecipeRepository.getRecentSearchText();
    return result;
  }
}
