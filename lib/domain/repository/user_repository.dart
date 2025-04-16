import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/domain/model/user.dart';

abstract class UserRepository {
  Future<Result<User>> getCurrentUser();
  Future<Result<void>> saveUser(User user);
}
