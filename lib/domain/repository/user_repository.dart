import 'package:recipe_app/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User> getUser();
  Future<void> updateUser(User updatedUser);
}