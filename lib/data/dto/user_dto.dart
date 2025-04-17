// userDto.dart
class UserDto {
  int? id;
  String? userId;
  String? name;
  String? email;
  String? password;
  String? image;
  String? address;

  UserDto({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.password,
    this.image,
    this.address,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      image: json['image'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'image': image,
      'address': address,
    };
  }
}
