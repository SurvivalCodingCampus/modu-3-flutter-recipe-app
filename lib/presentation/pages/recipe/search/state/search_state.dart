import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/state/base_state.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';

class SearchState extends ListBaseState<Recipe> {
  final bool isFiltered;
  final List<Recipe> originalData;
  final String searchText;
  const SearchState({
    this.isFiltered = false,
    this.searchText = '',
    this.originalData = const [],
    super.data,
    super.viewState,
  });

  SearchState copyWith({
    List<Recipe>? data,
    List<Recipe>? originalData,
    ViewState? viewState,
    bool? isFiltered,
    String? searchText,
  }) {
    return SearchState(
      data: data ?? this.data,
      originalData: originalData ?? this.originalData,
      viewState: viewState ?? this.viewState,
      isFiltered: isFiltered ?? this.isFiltered,
      searchText: searchText ?? this.searchText,
    );
  }
}
