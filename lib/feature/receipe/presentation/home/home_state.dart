import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';

class HomeState {
  final ViewState state;
  final List<Recipe> recipes;
  final List<Recipe> filteredRecipes;
  final String filter;
  const HomeState({
    this.state = ViewState.loading,
    this.recipes = const [],
    this.filteredRecipes = const [],
    this.filter = 'All',
  });

  HomeState copyWith({
    ViewState? state,
    List<Recipe>? recipes,
    List<Recipe>? filteredRecipes,
    String? filter,
  }) {
    return HomeState(
      state: state ?? this.state,
      recipes: recipes ?? this.recipes,
      filteredRecipes: filteredRecipes ?? this.filteredRecipes,
      filter: filter ?? this.filter,
    );
  }
}
