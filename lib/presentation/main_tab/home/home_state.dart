import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState({required this.isLoading, required this.recipes});

  final bool isLoading;
  final List<Recipe> recipes;
}
