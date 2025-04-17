// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';

class RecipeInfoState {
  final ViewState state;
  final Recipe? recipe;

  RecipeInfoState({this.state = ViewState.loading, this.recipe});

  RecipeInfoState copyWith({ViewState? state, Recipe? recipe}) {
    return RecipeInfoState(
      state: state ?? this.state,
      recipe: recipe ?? this.recipe,
    );
  }
}
