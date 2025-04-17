import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/component/button/enum/category_type.dart';
import 'package:recipe_app/presentation/component/button/enum/star.dart';
import 'package:recipe_app/presentation/component/button/enum/time.dart';

part 'search_recipes_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class SearchRecipesState with _$SearchRecipesState {
  final List<Recipe> recipes;
  final bool isLoading;
  final String text;
  final CategoryType categoryType;
  final Star star;
  final Time time;

  SearchRecipesState({
    this.recipes = const [],
    this.isLoading = false,
    this.text = '',
    this.categoryType = CategoryType.all,
    this.star = Star.five,
    this.time = Time.all,
  });
}
