import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/state/base_state.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';

class SearchState extends ListBaseState<Recipe> {
  const SearchState({super.data, super.viewState});

  SearchState copyWith({List<Recipe>? data, ViewState? viewState}) {
    return SearchState(
      data: data ?? this.data,
      viewState: viewState ?? this.viewState,
    );
  }
}
