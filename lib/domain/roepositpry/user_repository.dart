import 'package:recipe_app/domain/model/user/user.dart';

abstract interface class UserRepository {
  Future<User> getUser(String userName);
}
