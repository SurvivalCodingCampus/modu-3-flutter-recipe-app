import 'package:recipe_app/data/data_source/auth_data_source.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/mepper/user_mepper.dart';
import 'package:recipe_app/domain/model/user/user.dart';
import 'package:recipe_app/domain/roepositpry/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;
  UserRepositoryImpl({required UserDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<User> getUser(String userName) async {
    final userDto = await _dataSource.getUserDto(userName);
    return userDto.toUser();
  }
}
