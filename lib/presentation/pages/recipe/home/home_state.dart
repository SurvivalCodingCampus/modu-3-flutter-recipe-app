import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/state/base_state.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';

class HomeState extends ListBaseState<Recipe> {
  const HomeState({super.data, super.viewState});

  HomeState copyWith({List<Recipe>? data, ViewState? viewState}) {
    return HomeState(
      data: data ?? this.data,
      viewState: viewState ?? this.viewState,
    );
  }
}
