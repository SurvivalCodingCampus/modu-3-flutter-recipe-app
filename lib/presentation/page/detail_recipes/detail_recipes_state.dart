import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

part 'detail_recipes_state.freezed.dart';

@freezed
abstract class DetailRecipesState with _$DetailRecipesState {
  const factory DetailRecipesState({
    required Recipe recipesData,
    @Default(false) bool showMoreMenu,
  }) = _DetailRecipesState;
}