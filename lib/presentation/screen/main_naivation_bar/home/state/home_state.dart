// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/model/user/user.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final User? user;
  final Category? category;
  final List<Recipe> recipes;
  final List<Recipe> selectRecipes;
  final bool isLoading;
  HomeState({
    this.user,
    this.category = Category.all,
    this.recipes = const [],
    this.selectRecipes = const [],
    this.isLoading = false,
  });
}
