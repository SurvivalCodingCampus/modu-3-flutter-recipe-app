import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/domain/repository/repository.dart';
import 'package:recipe_app/domain/use_case/get_all_categories_use_case.dart';
import 'package:recipe_app/domain/use_case/get_recipes_by_category_use_case.dart';
import 'package:recipe_app/domain/use_case/use_case.dart';
import 'package:recipe_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetRecipesByCategoryUseCase _getRecipesByCategoryUseCase;
  final ToggleBookmarkRecipeUseCase _toggleBookmarkRecipeUseCase;

  HomeState _state = const HomeState();

  HomeViewModel({
    required GetAllCategoriesUseCase getAllCategoriesUseCase,
    required GetRecipesByCategoryUseCase getRecipesByCategoryUseCase,
    required ToggleBookmarkRecipeUseCase toggleBookmarkRecipeUseCase,
  }) : _getAllCategoriesUseCase = getAllCategoriesUseCase,
       _getRecipesByCategoryUseCase = getRecipesByCategoryUseCase,
       _toggleBookmarkRecipeUseCase = toggleBookmarkRecipeUseCase;

  HomeState get state => _state;

  Future<void> getAllCategories() async {
    final categories = await _getAllCategoriesUseCase.execute();
    _state = state.copyWith(categories: categories, category: 'All');
    notifyListeners();
  }

  Future<void> fetchDishCardsByCategory(String category) async {
    final result = await _getRecipesByCategoryUseCase.execute(category);
    _state = state.copyWith(recipes: result);

    notifyListeners();
  }

  Future<void> onTapCategory(String category) async {
    _state = state.copyWith(category: category);
    await fetchDishCardsByCategory(category);
    notifyListeners();
  }

  void onTapFavorite(Recipe recipe) async {
    await _toggleBookmarkRecipeUseCase.execute(int.parse(recipe.id));
    await fetchDishCardsByCategory(_state.category);
  }
}
