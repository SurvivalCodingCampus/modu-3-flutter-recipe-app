import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/type/category_filter_type.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(null) String? errorMessage,
    required List<String> categories,
    @Default(CategoryFilterType.all) CategoryFilterType selectedCategory,
    @Default([]) List<Recipe> selectedCategoryRecipes
  }) = _HomeState;
}