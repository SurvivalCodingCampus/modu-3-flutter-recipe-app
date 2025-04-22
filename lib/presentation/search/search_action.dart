import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/model.dart';

part 'search_action.freezed.dart';

@freezed
sealed class SearchAction with _$SearchAction {
  const factory SearchAction.searchRecipes(String query) = SearchRecipes;
  const factory SearchAction.onTapFilter(Filter filter) = OnTapFilter;
}
