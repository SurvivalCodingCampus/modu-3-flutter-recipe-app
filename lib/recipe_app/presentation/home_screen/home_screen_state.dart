import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  final List<Recipe> recipes;
  final bool isRecipesLoading;
  final String errorMessage;
  final String selectedCategory;

  const HomeScreenState({
    this.recipes = const [],
    this.isRecipesLoading = false,
    this.errorMessage = '오류 발생',
    this.selectedCategory = 'All',
  });
}
