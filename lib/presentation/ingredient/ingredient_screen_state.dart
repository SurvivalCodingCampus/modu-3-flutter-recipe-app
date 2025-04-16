import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'ingredient_screen_state.freezed.dart';

@freezed
abstract class IngredientScreenState with _$IngredientScreenState {
  const factory IngredientScreenState({
    @Default(null) Recipe? recipe,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _IngredientScreenState;
}
