import 'package:recipe_app/core/enums/time_filter.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/enums/category_filter.dart';

part 'search_recipes_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class SearchRecipesState with _$SearchRecipesState {
  // 전체 레시피 저장
  final List<Recipe> recipes;

  // 검색 결과 레시피 저장
  final List<Recipe> searchRecipes;

  // 필터 상태 저장
  final TimeFilter timeFilter;
  final int rateFilter;
  final CategoryFilter categoryFilter;

  final bool isLoading;
  final String searchString;

  const SearchRecipesState({
    this.recipes = const [],
    this.searchRecipes = const [],
    this.isLoading = false,
    this.searchString = '',
    this.timeFilter = TimeFilter.All,
    this.rateFilter = 0,
    this.categoryFilter = CategoryFilter.All
  });
}
