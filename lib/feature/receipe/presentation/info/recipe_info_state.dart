import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';

enum InfoPopupState { none, share, rate, review, unsave }

class RecipeInfoState {
  final ViewState state;
  final Recipe? recipe;
  final InfoPopupState popupState;

  RecipeInfoState({
    this.state = ViewState.loading,
    this.recipe,
    this.popupState = InfoPopupState.none,
  });

  RecipeInfoState copyWith({
    ViewState? state,
    Recipe? recipe,
    InfoPopupState? popupState,
  }) {
    return RecipeInfoState(
      state: state ?? this.state,
      recipe: recipe ?? this.recipe,
      popupState: popupState ?? this.popupState,
    );
  }
}
