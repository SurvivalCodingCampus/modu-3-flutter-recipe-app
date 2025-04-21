import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recent_search_repository.dart';
import 'package:recipe_app/presentation/component/filter_search_state.dart';

class SearchRecipesUseCase {
  final RecentSearchRepository _recentSearchRepository;

  const SearchRecipesUseCase({
    required RecentSearchRepository recentSearchRepository,
  }) : _recentSearchRepository = recentSearchRepository;

  Future<List<Recipe>> execute(
    List<Recipe> recipes,
    String searchString,
    FilterSearchState filterSearchState,
  ) async {
    final List<Recipe> filteredRecipes =
        recipes
            // 카테고리 필터링
            .where((recipe) {
              if (filterSearchState.categoryFilter == CategoryFilter.All) {
                return true;
              }
              return recipe.category == filterSearchState.categoryFilter;
            })
            // Rate 별점 필터링
            .where((recipe) {
              if (filterSearchState.rateFilter == 5) {
                return recipe.rating >= 5.0;
              } else if (filterSearchState.rateFilter == 4) {
                return 4.0 <= recipe.rating && recipe.rating < 5.0;
              } else if (filterSearchState.rateFilter == 3) {
                return 3.0 <= recipe.rating && recipe.rating < 4.0;
              } else if (filterSearchState.rateFilter == 2) {
                return 2.0 <= recipe.rating && recipe.rating < 3.0;
              } else if (filterSearchState.rateFilter == 1) {
                return 1.0 <= recipe.rating && recipe.rating < 2.0;
              }
              return true;
            })
            .toList();

    final List<Recipe> searchRecipes =
        filteredRecipes
            .where(
              (recipe) =>
                  recipe.name.toLowerCase().contains(
                    searchString.toLowerCase(),
                  ) ||
                  recipe.chef.toLowerCase().contains(
                    searchString.toLowerCase(),
                  ),
            )
            .toList();

    await _recentSearchRepository.updateRecentSearch(searchRecipes);
    return searchRecipes;
  }
}
