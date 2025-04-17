import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/state/base_state.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';

class SearchState extends ListBaseState<Recipe> {
  final bool isFiltered;
  // view model의 데이터
  final List<Recipe> originalData;
  // 필터링된 데이터
  final List<Recipe> filteredData;
  final String searchText;
  const SearchState({
    this.isFiltered = false,
    this.searchText = '',
    this.originalData = const [],
    this.filteredData = const [],
    // 뷰에 보여지는 데이터
    super.data,
    super.viewState,
  });

  SearchState copyWith({
    List<Recipe>? data,
    List<Recipe>? originalData,
    List<Recipe>? filteredData,
    ViewState? viewState,
    bool? isFiltered,
    String? searchText,
  }) {
    return SearchState(
      data: data ?? this.data,
      originalData: originalData ?? this.originalData,
      filteredData: filteredData ?? this.filteredData,
      viewState: viewState ?? this.viewState,
      isFiltered: isFiltered ?? this.isFiltered,
      searchText: searchText ?? this.searchText,
    );
  }
}
