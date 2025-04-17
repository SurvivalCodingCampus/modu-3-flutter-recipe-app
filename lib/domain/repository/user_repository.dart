import 'package:recipe_app/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User> getUserData(int userId);
  Future<List<int>> getBookmarkList(int userId);
}
