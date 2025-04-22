import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/model.dart';

part 'recipe_ingredient_state.freezed.dart';

@freezed
class RecipeIngredientState with _$RecipeIngredientState {
  @override
  final Recipe? recipe;
  @override
  final List<Procedure> procedures;
  @override
  final bool isLoading;
  final int selectedTabIndex;

  const RecipeIngredientState({
    this.recipe,
    this.procedures = const [],
    this.isLoading = false,
    this.selectedTabIndex = 0,
  });
}
