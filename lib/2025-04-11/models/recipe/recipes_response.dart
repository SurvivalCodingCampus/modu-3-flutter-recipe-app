import 'recipe.dart';

class RecipesResponse {
  final List<Recipe> recipes;

  const RecipesResponse({required this.recipes});

  factory RecipesResponse.fromJson(Map<String, dynamic> json) {
    return RecipesResponse(
      recipes: (json['recipes'] as List<dynamic>)
          .map((item) => Recipe.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipes': recipes.map((e) => e.toJson()).toList(),
    };
  }
}