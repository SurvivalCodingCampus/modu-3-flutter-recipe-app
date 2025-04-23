import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/user.dart';

part 'ingredient_state.freezed.dart';

@freezed
abstract class IngredientState with _$IngredientState{
  const factory IngredientState({
    @Default(Recipe()) final Recipe recipe,
    @Default(User()) final User userModel,
    @Default(false) final bool isLoading
  }) = _IngredientState;
}