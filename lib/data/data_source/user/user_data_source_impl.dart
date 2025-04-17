import 'package:recipe_app/data/data_source/user/user_data_source.dart';
import 'package:recipe_app/data/dto/user_dto.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<UserDto>> fetchAllUsers() {
    // TODO: implement fetchAllUsers
    throw UnimplementedError();
  }

  @override
  Future<UserDto> fetchUser(int id) {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }
}
