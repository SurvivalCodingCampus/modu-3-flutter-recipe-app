class IngredientDto {
  num? id;
  String? name;
  String? image;

  IngredientDto({this.id, this.name, this.image});

  factory IngredientDto.fromJson(Map<String, dynamic> json) {
    return IngredientDto(
      id: json['id'] as num?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};
}
