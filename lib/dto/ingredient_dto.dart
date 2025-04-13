class IngredientDto {
  final num? id;
  final String? name;
  final String? imageUrl;

  IngredientDto({this.id, this.name, this.imageUrl});

  factory IngredientDto.fromJson(Map<String, dynamic> json) {
    return IngredientDto(
      id: json['id'] as num?,
      name: json['name'] as String?,
      imageUrl: json['image'] as String?,
    );
  }
}
