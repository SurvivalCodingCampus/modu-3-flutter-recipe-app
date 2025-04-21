import 'package:recipe_app/domain/model/recipe.dart';

abstract interface class RecentSearchRepository {
  Future<List<Recipe>> getRecentSearch();
  Future<void> updateRecentSearch(List<Recipe> searchRecipes);
}