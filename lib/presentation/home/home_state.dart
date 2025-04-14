import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/recipe.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final List<Recipe> recipes;
  final bool isLoading;

  const HomeState({this.recipes = const [], this.isLoading = false});
}
