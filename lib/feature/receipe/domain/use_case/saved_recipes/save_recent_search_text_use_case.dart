import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/repository/search/search_recipe_repository.dart';

class SaveRecentSearchTextUseCase {
  final SearchRecipeRepository _searchRecipeRepository;

  SaveRecentSearchTextUseCase(this._searchRecipeRepository);

  Future<Result<List<String>>> execute(String text) async {
    return await _searchRecipeRepository.saveRecentSearchText(text);
  }
}
