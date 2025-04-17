class UserDto {
  final num? id;
  final String? name;
  final String? email;
  final String? password;
  final String? address;
  final String? job;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.job,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      address: json['address'] as String,
      job: json['job'] as String,
    );
  }
}
