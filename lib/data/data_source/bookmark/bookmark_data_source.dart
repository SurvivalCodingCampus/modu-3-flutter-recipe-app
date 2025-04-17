import 'package:recipe_app/data/dto/bookmark_dto.dart';

abstract interface class BookmarkDataSource {
  Future<List<BookmarkDto>> getBookmarks();
}
