import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class MockUserRepositoryImpl implements UserRepository {

  final _user = User(
      id: 0,
      name: '홍길동',
      image: 'https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png',
      address: 'Lagos, Nigeria',
      bookmarks: [1, 2, 3, 4]
  );

  @override
  Future<User> getUser() async {
    return _user;
  }

  @override
  Future<void> updateUser(User updatedUser) async {
  }
}