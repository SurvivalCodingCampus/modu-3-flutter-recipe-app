import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState({
    this.isLoading = false,
    this.recipes = const [],
    this.categories = const [],
    this.selectedCategoryIndex = 0,
  });

  final bool isLoading;
  final List<Recipe> recipes;
  final List<String> categories;
  final int selectedCategoryIndex;
}
