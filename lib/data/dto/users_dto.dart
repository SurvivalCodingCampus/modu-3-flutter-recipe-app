// usersDto.dart
import 'package:recipe_app/data/dto/user_dto.dart';

class UsersDto {
  List<UserDto>? users;

  UsersDto({this.users});

  factory UsersDto.fromJson(List<dynamic> jsonList) {
    return UsersDto(
      users: jsonList.map((json) => UserDto.fromJson(json)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return users?.map((user) => user.toJson()).toList() ?? [];
  }
}
