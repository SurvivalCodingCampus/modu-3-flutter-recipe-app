import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/filter.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/data/util/rate_enum.dart';
import 'package:recipe_app/data/util/time_enum.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository {
    fetchAllRecipes();
  }

  SearchRecipesState get state => _state;

  void fetchAllRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _recipeRepository.getRecipes();
    _state = _state.copyWith(recipeList: recipes, isLoading: false);
    notifyListeners();
  }

  Future<void> fetchSearchedRecipes(String value) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    final recipes = await _recipeRepository.getRecipes();
    final searchedRecipes =
        recipes.where((element) {
          return element.title.toLowerCase().contains(value.toLowerCase());
        }).toList();
    _state = _state.copyWith(
      isSearched: value == '' ? false : true,
      isLoading: false,
      searchText: value,
      recipeList: searchedRecipes,
    );
    notifyListeners();
  }

  Future<void> fetchFilterdRecipes(Filter filter) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _recipeRepository.getRecipes();
    final filterdRecipes =
        recipes.where((element) {
          if (filter.times.contains((element.createdAt ?? Time.all)) ||
              (filter.rates.contains(doubleToRate(element.rating))) ||
              (filter.categories.contains(element.category))) {
            return true;
          }
          return false;
        }).toList();
    _state = _state.copyWith(
      recipeList: filterdRecipes,
      isLoading: false,
      isSearched: true,
    );
    notifyListeners();
  }

  Rate doubleToRate(double num) {
    if (num.ceil() == 2) {
      return Rate.star2;
    } else if (num.ceil() == 3) {
      return Rate.star3;
    } else if (num.ceil() == 4) {
      return Rate.star4;
    } else if (num.ceil() == 5) {
      return Rate.star5;
    } else {
      return Rate.star1;
    }
  }
}
