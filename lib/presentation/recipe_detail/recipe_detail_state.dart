
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/procedure.dart';

import '../../data/model/chef.dart';
import '../../data/model/recipes.dart';

part 'recipe_detail_state.freezed.dart';

part 'recipe_detail_state.g.dart';

@freezed
abstract class RecipeDetailState with _$RecipeDetailState {
  const factory RecipeDetailState({
    required Recipes recipe,
    Chef? chef,
    required List<Procedure> procedure,
    required bool isLoading,
  }) = _RecipeDetailState;

  factory RecipeDetailState.fromJson(Map<String, Object?> json) => _$RecipeDetailStateFromJson(json);
}