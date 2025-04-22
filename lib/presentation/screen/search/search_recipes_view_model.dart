import 'package:flutter/foundation.dart';
import 'package:recipe_app/domain/entity/recipe_model.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/screen/search/search_recipes_state.dart';

class SearchRecipesViewModel extends ChangeNotifier {
  final RecipeRepository _repository;

  SearchRecipesState _state = const SearchRecipesState(isLoading: true);
  SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._repository) {
    _fetchRecipes();
  }

  void updateQuery(String query) {
    _state = _state.copyWith(searchQuery: query);
    _applyFiltersAndSearch();
    notifyListeners();
  }

  void applyFilters(Map<String, dynamic> filters) {
    _state = _state.copyWith(appliedFilters: Map.from(filters));
    _applyFiltersAndSearch();
    notifyListeners();
  }

  Future<void> _fetchRecipes() async {
    try {
      final recipes = await _repository.getRecipes();
      _state = _state.copyWith(
        allRecipes: recipes,
        filteredRecipes: recipes,
        isLoading: false,
      );
      notifyListeners();
    } catch (e) {
      print("Error fetching recipes: $e");
      _state = _state.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  void _applyFiltersAndSearch() {
    final query = _state.searchQuery.toLowerCase();
    final filters = _state.appliedFilters;

    final List<Recipe> filtered =
        _state.allRecipes.where((recipe) {
          // 1. 검색어 필터링
          if (query.isNotEmpty) {
            final name = recipe.name.toLowerCase();
            final chef = recipe.chef.toLowerCase();
            final ingredients = recipe.ingredients
                .map((e) => e.ingredient.name.toLowerCase())
                .join(' ');

            final matchesQuery =
                name.contains(query) ||
                chef.contains(query) ||
                ingredients.contains(query);

            if (!matchesQuery) {
              return false;
            }
          }

          // 2. 별점 필터링
          if (filters.containsKey('rating')) {
            final minimumRating = filters['rating'] as int;
            if (recipe.rating < minimumRating) {
              return false;
            }
          }

          // 3. 카테고리 필터링
          if (filters.containsKey('categories') &&
              filters['categories'] is List<String> &&
              (filters['categories'] as List<String>).isNotEmpty) {
            final categories = filters['categories'] as List<String>;

            if (!categories.contains('All') &&
                !categories.contains(recipe.category)) {
              return false;
            }
          }

          return true;
        }).toList();

    _state = _state.copyWith(filteredRecipes: filtered);
  }
}
