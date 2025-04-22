import 'package:flutter/foundation.dart';
import 'package:recipe_app/domain/use_case/search_recipe/get_filter_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/search_recipe/get_recent_search_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/search_recipe/get_search_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/search_recipe/save_recent_recipes_use_case.dart';
import 'package:recipe_app/presentation/component/button/enum/category_type.dart';
import 'package:recipe_app/presentation/component/button/enum/star.dart';
import 'package:recipe_app/presentation/component/button/enum/time.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final GetSearchRecipesUseCase _getSearchRecipesUseCase;
  final GetFilterRecipesUseCase _getFilterRecipesUseCase;
  final SaveRecentRecipesUseCase _saveRecentRecipesUseCase;
  final GetRecentSearchRecipesUseCase _getRecentSearchRecipesUseCase;

  SearchRecipesState _state = SearchRecipesState();
  SearchRecipesState get state => _state;

  SearchRecipesViewModel(
    this._getSearchRecipesUseCase,
    this._getFilterRecipesUseCase,
    this._saveRecentRecipesUseCase,
    this._getRecentSearchRecipesUseCase,
  ) {
    recentRecipes();
  }

  Future<void> searchRecipes(String inputText) async {
    final search = await _getSearchRecipesUseCase.excute(inputText);
    _state = state.copyWith(recipes: search, text: inputText);
    notifyListeners();
  }

  Future<void> saveRecentRecipes(String query) async {
    await _saveRecentRecipesUseCase.excute(query);
  }

  Future<void> recentRecipes() async {
    final recent = await _getRecentSearchRecipesUseCase.excute();
    _state = state.copyWith(recipes: recent);
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
    String inputText,
  ) async {
    final filtered = await _getFilterRecipesUseCase.excute(
      category: category,
      star: star,
      time: time,
      inputText: inputText,
    );
    _state = state.copyWith(
      recipes: filtered,
      categoryType: category,
      star: star,
      time: time,
    );
    notifyListeners();
  }
}
