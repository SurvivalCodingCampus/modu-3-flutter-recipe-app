class IngredientModel {
  final int id;
  final String name;
  final String image;

  IngredientModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}