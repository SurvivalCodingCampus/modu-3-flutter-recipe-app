import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/recipe.dart';
import '../../domain/model/user.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final List<Recipe> recipes;
  final bool isLoading;
  final User? user;

  const HomeState({this.recipes = const [], this.isLoading = false, this.user});
}
