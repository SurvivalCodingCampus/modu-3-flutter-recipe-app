import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'home_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class HomeState with _$HomeState {
  final bool isLoading;
  final List<Recipe> recipes;
  final List<Recipe> filteredRecipes;
  final List<int> userBookmarks;

  const HomeState({
    this.isLoading = false,
    this.recipes = const [],
    this.filteredRecipes = const [],
    this.userBookmarks = const [],
  });
}