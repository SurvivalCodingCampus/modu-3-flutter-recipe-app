class RecipeResponse {
  final List<RecipeDto>? recipes;

  RecipeResponse({this.recipes});

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    return RecipeResponse(
      recipes:
          (json['recipes'] as List<dynamic>?)
              ?.map((e) => RecipeDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class RecipeDto {
  final int? id;
  final String? category;
  final String? name;
  final String? image;
  final String? chef;
  final String? time;
  final double? rating;
  final List<IngredientAmount>? ingredients;

  RecipeDto({
    this.id,
    this.category,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
    this.ingredients,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    return RecipeDto(
      id: json['id'] as int?,
      category: json['category'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      chef: json['chef'] as String?,
      time: json['time'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ingredients:
          (json['ingredients'] as List<dynamic>?)
              ?.map((e) => IngredientAmount.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class IngredientAmount {
  final IngredientDto? ingredient;
  final int? amount;

  IngredientAmount({this.ingredient, this.amount});

  factory IngredientAmount.fromJson(Map<String, dynamic> json) {
    return IngredientAmount(
      ingredient:
          json['ingredient'] != null
              ? IngredientDto.fromJson(
                json['ingredient'] as Map<String, dynamic>,
              )
              : null,
      amount: json['amount'] as int?,
    );
  }
}

class IngredientDto {
  final int? id;
  final String? name;
  final String? image;

  IngredientDto({this.id, this.name, this.image});

  factory IngredientDto.fromJson(Map<String, dynamic> json) {
    return IngredientDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }
}
