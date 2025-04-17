import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final UserDataSource _userDataSource;

  BookmarkRepositoryImpl({required UserDataSource userDataSource})
    : _userDataSource = userDataSource;

  Future<User> getUserData(int userId) async {
    // print('getUserData 진입');
    final jsonMap = await _userDataSource.getUserData(userId);
    return User.fromJson(jsonMap);
  }

  @override
  Future<List<int>> getBookmarkList(int userId) async {
    // print('getBookmarkList 진입');
    final userData = await getUserData(userId);
    return userData.bookMarkList;
  }

  @override
  Future<List<int>> setBookmark(User userModel, int recipeId) async {
    // print('북마크 레포지토리 setBookmark진입');
    List<int> bookmarkList = await getBookmarkList(userModel.id);
    List<int> newBookmarkList = bookmarkList.toList();
    if (newBookmarkList.contains(recipeId)) {
      newBookmarkList.remove(recipeId);
    } else {
      newBookmarkList.add(recipeId);
    }
    // print('새로운 북마크리스트 : $newBookmarkList');
    // print(
    //   '수정한 유저모델 : ${userModel.copyWith(bookMarkList: newBookmarkList).toJson()}',
    // );
    await _userDataSource.setUserData(
      userModel.copyWith(bookMarkList: newBookmarkList).toJson(),
    );

    return newBookmarkList;
  }
}
