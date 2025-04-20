import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/recipe_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final List<Recipe> recipes;
  final List<Recipe> filteredRecipes;
  final List<String> categoryList;
  final bool isLoading;
  final String selectedCategory;

  const HomeState({
    this.filteredRecipes = const [],
    this.recipes = const [],
    this.isLoading = false,
    this.selectedCategory = 'All',
    this.categoryList = const [
      'All',
      'Cereal',
      'Vegetables',
      'Dinner',
      'Breakfast',
      'Chinese',
      'Local Dish',
      'Fruit',
      'Spanish',
      'Lunch',
      'Korean',
    ],
  });
}
