import 'package:recipe_app/data/model/user.dart';
import 'package:recipe_app/data/repository/user_repository.dart';

class MockUserRepositoryImpl implements UserRepository {
  @override
  Future<User> getUser() async {
    return User(name: '홍길동', id: '1');
  }
}
