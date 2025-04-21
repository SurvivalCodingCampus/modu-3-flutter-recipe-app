import 'package:recipe_app/domain/model/user/user.dart';

abstract interface class AuthRepository {
  Future<User> getUser();
}
