import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/component/pages/search/search_recipes_state.dart';

class SearchRecipesViewModel extends ChangeNotifier {
  final RecipeRepository _repository;

  SearchRecipesState _state = const SearchRecipesState(isLoading: true);
  SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._repository) {
    _fetchRecipes();
  }

  void applyFilters(Map<String, dynamic> filters) {
    _state = _state.copyWith(appliedFilters: Map.from(filters));
    _applySearch(); // 기존 검색 로직과 같이 사용
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

  void updateQuery(String query) {
    _state = _state.copyWith(searchQuery: query);
    _applySearch();
  }

  void _applySearch() {
    final query = _state.searchQuery.toLowerCase();

    final filtered =
        _state.allRecipes.where((recipe) {
          final name = recipe.name.toLowerCase();
          final chef = recipe.chef.toLowerCase();
          final ingredients = recipe.ingredients
              .map((e) => e.ingredient.name.toLowerCase())
              // ← 여기에 `.name` 필수
              .join(' ');

          return name.contains(query) ||
              chef.contains(query) ||
              ingredients.contains(query);
        }).toList();

    _state = _state.copyWith(filteredRecipes: filtered);
    notifyListeners();
  }
}
