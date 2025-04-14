import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  @override
  final List<Recipe> recipes;
  @override
  final bool isLoading;
  @override
  final String title;
  @override
  final String resultsCount;

  const SearchState({
    this.recipes = const [],
    this.isLoading = false,
    this.title = 'Recent Search',
    this.resultsCount = '',
  });
}
