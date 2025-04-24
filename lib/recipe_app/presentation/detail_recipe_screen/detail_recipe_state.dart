import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/recipe_app/data/model/procedure.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

part 'detail_recipe_state.freezed.dart';

@freezed
abstract class DetailRecipeState with _$DetailRecipeState {
  const factory DetailRecipeState({
    Recipe? recipe,
    @Default(<Procedure>[]) List<Procedure> procedure,
    @Default(<Ingredient>[]) List<Ingredient> ingredient,
    @Default(false) bool isRecipeLoading,
    @Default('') String errorMessage,
  }) = _DetailRecipeState;
}
