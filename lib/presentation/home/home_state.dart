import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/recipe.dart';
import '../../data/model/user.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final List<Recipe> recipes;
  final bool isLoading;
  final User? user;

  const HomeState({this.recipes = const [], this.isLoading = false, this.user});
}
