import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class MockUserRepositoryImpl implements UserRepository {
  @override
  Future<User> getUser() async {
    return User(name: '홍길동', id: '1');
  }
}
