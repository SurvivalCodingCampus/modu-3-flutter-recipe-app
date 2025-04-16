import 'package:recipe_app/domain/model/user.dart';

abstract interface class BookmarkRepository {
  Future<List<int>> getBookmarkList(int userId);
  Future<List<int>> setBookmark(User userModel, int recipeId);
}
