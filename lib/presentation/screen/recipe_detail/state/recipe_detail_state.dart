// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:recipe_app/domain/model/procedure/procedure.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/model/user/user.dart';

part 'recipe_detail_state.freezed.dart';

@freezed
class RecipeDetailState with _$RecipeDetailState {
  final Recipe? recipe;
  final User? user;
  final List<Procedure>? procedure;
  final bool isLoading;
  final int selectedTabIndex;

  const RecipeDetailState({
    this.recipe,
    this.user,
    this.procedure,
    this.isLoading = false,
    this.selectedTabIndex = 0,
  });
}
