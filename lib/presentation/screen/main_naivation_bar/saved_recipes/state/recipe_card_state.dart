// ignore_for_file: annotate_overrides
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
part 'recipe_card_state.freezed.dart';

@freezed
class RecipeCardState with _$RecipeCardState {
  final Recipe? recipe;
  final bool isGrid;
  final VoidCallback? onToggle;
  final bool isSaved;

  const RecipeCardState({
    this.recipe,
    this.onToggle,
    this.isGrid = false,
    this.isSaved = false,
  });
}
