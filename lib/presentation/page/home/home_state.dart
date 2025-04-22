import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final List<Recipe> searchData;

  const HomeState({this.searchData = const []});
}
