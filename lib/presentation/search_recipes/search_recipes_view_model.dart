import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:recipe_app/presentation/component/button/enum/category_type.dart';
import 'package:recipe_app/presentation/component/button/enum/star.dart';
import 'package:recipe_app/presentation/component/button/enum/time.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesState _state = SearchRecipesState();
  SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._recipeRepository) {
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recipeRepository.getRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }

  Future<void> searchRecipes(String inputText) async {
    if (inputText.isEmpty) {
      _state = state.copyWith(recipes: await _recipeRepository.getRecipes());
      notifyListeners();
    }
    final filtered =
        _state.recipes
            .where(
              (element) =>
                  element.title.toLowerCase().contains(inputText.toLowerCase()),
            )
            .toList();
    _state = state.copyWith(recipes: filtered, text: inputText);
    notifyListeners();
  }

  void updateSelectedCategory(CategoryType category) {
    _state = state.copyWith(categoryType: category);
    notifyListeners();
  }

  void updateSelectedStar(Star star) {
    _state = state.copyWith(star: star);
    notifyListeners();
  }

  void updateSelectedTime(Time time) {
    _state = state.copyWith(time: time);
    notifyListeners();
  }

  Future<void> filterRecipes(
    CategoryType category,
    Star star,
    Time time,
  ) async {
    final filtered =
        _state.recipes.where((recipe) {
          final matchesCategory =
              _state.categoryType == CategoryType.all ||
              recipe.category.name.toLowerCase() ==
                  _state.categoryType.name.toLowerCase();

          final matchesRate = switch (star) {
            Star.five => recipe.rating >= 5,
            Star.four => recipe.rating >= 4,
            Star.three => recipe.rating >= 3,
            Star.two => recipe.rating >= 2,
            Star.one => recipe.rating >= 1,
          };
          return matchesCategory && matchesRate;
        }).toList();

    switch (time) {
      case Time.all:
        break;
      case Time.newest:
        _state.recipes.sort((a, b) => b.id.compareTo(a.id));
        break;
      case Time.oldest:
        _state.recipes.sort((a, b) => a.id.compareTo(b.id));
        break;
      case Time.popularity:
        _state.recipes.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
    _state = state.copyWith(
      recipes: filtered,
      categoryType: category,
      star: star,
      time: time,
    );
    notifyListeners();
  }
}
