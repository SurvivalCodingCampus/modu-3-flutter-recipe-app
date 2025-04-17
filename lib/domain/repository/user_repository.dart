import '../model/user.dart';

abstract interface class UserRepository {
  Future<User> getUser();
}
