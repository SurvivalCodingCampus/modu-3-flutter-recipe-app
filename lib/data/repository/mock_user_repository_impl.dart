import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class MockUserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  MockUserRepositoryImpl({required UserDataSource userDataSource})
    : _userDataSource = userDataSource;

  @override
  Future<User> getUserData(int userId) async {
    final jsonMap = await _userDataSource.getUserData(userId);
    return User.fromJson(jsonMap);
  }

  @override
  Future<List<int>> getBookmarkList(int userId) async {
    final userData = await getUserData(userId);
    return userData.bookMarkList;
  }
}
