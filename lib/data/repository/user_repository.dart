import 'package:recipe_app/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User> getUserById();
  Future<void> updateUser(User user);
  Future<List<User>> getUsers();
}