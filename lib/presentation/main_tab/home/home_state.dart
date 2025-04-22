import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState({
    this.isLoading = false,
    this.recipes = const UiState.loading(),
    this.categories = const ['All'],
    this.selectedCategoryIndex = 0,
  });

  final bool isLoading;
  final UiState<List<Recipe>> recipes;
  final List<String> categories;
  final int selectedCategoryIndex;
}
