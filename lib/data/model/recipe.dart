class Recipe {
  final String imageUrl;
  final String recipeName;
  final String chefName;
  final double rating;
  final String cookingTime;
  final bool isBookmarked;

  Recipe({
    required this.imageUrl,
    required this.recipeName,
    required this.chefName,
    required this.rating,
    required this.cookingTime,
    required this.isBookmarked,
  });
}

