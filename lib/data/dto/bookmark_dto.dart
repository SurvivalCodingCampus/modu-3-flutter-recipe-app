class BookmarkDto {
  final int userId;
  final List<int> recipesId;

  BookmarkDto({required this.userId, required this.recipesId});

  factory BookmarkDto.fromJson(Map<String, dynamic> json) {
    return BookmarkDto(
      userId: json['userId'] as int,
      recipesId: List<int>.from(json['bookmarkedRecipeIds']),
    );
  }
}
