import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/domain/model/chef.dart';
import 'package:recipe_app/domain/model/ingredient_with_amount.dart';
import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'recipe_ingredient_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class RecipeIngredientState with _$RecipeIngredientState{
  final Recipe recipe;
  final Chef chef;
  final int tabSelectedIndex;
  final bool isLoading;
  final bool isBookmarked;
  final List<IngredientWithAmount> ingredientList;
  final List<Procedure> procedureList;

  const RecipeIngredientState({
    this.isLoading = false,
    this.isBookmarked = false,
    this.tabSelectedIndex = 0,
    this.chef = const Chef(
      id: 0,
      name: '',
      image: '',
      address: '',
    ),
    this.recipe = const Recipe(
        id: 0,
        category: CategoryFilter.All,
        name: '',
        time: '',
        rating: 0,
        image: '',
        ingredients: [],
        chef: ''
    ),
    this.ingredientList = const [],
    this.procedureList = const []
  });
}