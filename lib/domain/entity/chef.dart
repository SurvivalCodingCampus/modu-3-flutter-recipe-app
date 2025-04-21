// lib/models/chef.dart
class Chef {
  final int id;
  final String name;
  final String image;
  final String address;

  Chef({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
  });

  factory Chef.fromJson(Map<String, dynamic> json) {
    return Chef(
      id: json['id'],
      name: json['name'],
      image: json['image'], 
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'address': address,
    };
  }
}