import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/repository/user_repository.dart';
import 'package:recipe_app/domain/model/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  const UserRepositoryImpl({
    required UserDataSource userDataSource,
  }) : _userDataSource = userDataSource;

  @override
  Future<List<User>> getUsers() async {
    final List<Map<String, dynamic>> users = await _userDataSource.getUsers();
    return users.map((user) => User.fromJson(user)).toList();
  }

  @override
  Future<User> getUserById({int id = 1}) async {
    final List<Map<String, dynamic>> users = await _userDataSource.getUsers();
    return users
        .map((user) => User.fromJson(user))
        .firstWhere((user) => user.id == id);
  }

  @override
  Future<void> updateUser(User updatedUser) async {
    await _userDataSource.updateUser(updatedUser.toJson());
  }
}