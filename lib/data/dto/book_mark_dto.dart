class BookmarkedRecipe {
  final int recipeId;

  BookmarkedRecipe({required this.recipeId});

  factory BookmarkedRecipe.fromJson(Map<String, dynamic> json) {
    return BookmarkedRecipe(recipeId: json['recipeId']);
  }

  Map<String, dynamic> toJson() {
    return {'recipeId': recipeId};
  }
}

class BookMarkDto {
  final int userId;
  final List<BookmarkedRecipe> bookmarkedRecipes;

  BookMarkDto({required this.userId, required this.bookmarkedRecipes});

  factory BookMarkDto.fromJson(Map<String, dynamic> json) {
    var recipeList =
        (json['bookmarkedRecipes'] as List)
            .map((e) => BookmarkedRecipe.fromJson(e))
            .toList();

    return BookMarkDto(userId: json['userId'], bookmarkedRecipes: recipeList);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'bookmarkedRecipes': bookmarkedRecipes.map((e) => e.toJson()).toList(),
    };
  }
}
