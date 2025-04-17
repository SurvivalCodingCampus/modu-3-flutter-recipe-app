import 'package:recipe_app/domain/model/bookmark.dart';

abstract interface class BookmarkRepository {
  Future<List<Bookmark>> getBookmarks(int userId);
}
