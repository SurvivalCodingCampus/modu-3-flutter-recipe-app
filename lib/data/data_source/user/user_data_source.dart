import 'package:recipe_app/data/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<UserDto> fetchUser(int id);
  Future<List<UserDto>> fetchAllUsers();
}
