import 'package:recipe_app/data/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<UserDto> getCurrentUser();
  Future<void> saveUser(UserDto user);
}
