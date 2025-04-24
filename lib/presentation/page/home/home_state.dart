import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final List<Recipe> searchData;
  final List<String> categoryList;
  final List<Recipe> categoryFilterRecipeList;
  final double imageWidth;
  final double imageHeight;
  final String selectCategory;

  const HomeState({
    this.searchData = const [],
    this.imageWidth = 0.0,
    this.imageHeight = 0.0,
    this.selectCategory = 'ALL',
    this.categoryList = const [
      'ALL',
      'Cereal',
      'Vegetables',
      'Dinner',
      'Chinese',
      'Local Dish',
      'Fruit',
      'BreakFast',
      'Spanish',
      'Lunch',
    ],
    this.categoryFilterRecipeList = const [],
  });
}
