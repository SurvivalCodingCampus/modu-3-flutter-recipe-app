import 'user.dart';

class Recipe {
  final int recipeId;
  final String name;
  final String cookTime;
  final User chef;
  final double rate;
  final String foodImage;

  const Recipe({
    required this.recipeId,
    required this.name,
    required this.cookTime,
    required this.chef,
    required this.rate,
    required this.foodImage
  });

  @override
  String toString() {
    return 'Recipe{recipeId: $recipeId, name: $name, cookTime: $cookTime, chef: $chef, rate: $rate, foodImage: $foodImage}';
  }

  // final int commentCount;
  // final int serve;
  // final String video;
  // final CategoryFilter category;
  // final List<Ingredient> ingredients;
  // final List<String> steps;
}