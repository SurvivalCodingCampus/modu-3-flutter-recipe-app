import 'package:recipe_app/domain/model/user.dart';

abstract interface class UserDataSource {
  Future<List<Map<String, dynamic>>> getUsers();
  Future<void> updateUser(Map<String, dynamic> updatedUser);
}