import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/state/base_state.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';

class SavedRecipesState extends ListBaseState<Recipe> {
  const SavedRecipesState({super.data, super.viewState});

  SavedRecipesState copyWith({List<Recipe>? data, ViewState? viewState}) {
    return SavedRecipesState(
      data: data ?? this.data,
      viewState: viewState ?? this.viewState,
    );
  }
}
