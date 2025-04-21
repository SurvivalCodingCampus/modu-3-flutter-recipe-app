import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recent_search_repository.dart';

class MockRecentSearchRepositoryImpl implements RecentSearchRepository {
  List<Recipe> _recentSearch = [];

  @override
  Future<List<Recipe>> getRecentSearch() async {
    return _recentSearch;
  }

  @override
  Future<void> updateRecentSearch(List<Recipe> searchRecipes) async {
    _recentSearch = searchRecipes;
  }
}
