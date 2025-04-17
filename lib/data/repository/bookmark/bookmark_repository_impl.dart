import 'package:recipe_app/data/data_source/bookmark/bookmark_data_source.dart';
import 'package:recipe_app/data/mapper/bookmark_mapper.dart';
import 'package:recipe_app/domain/model/bookmark.dart';
import 'package:recipe_app/domain/repository/bookmark/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkDataSource _bookmarkDataSource;

  BookmarkRepositoryImpl(this._bookmarkDataSource);

  @override
  Future<List<Bookmark>> getBookmarks(int userId) async {
    final bookMarkDto = await _bookmarkDataSource.getBookmarks();

    return bookMarkDto.map((e) => e.toBookmark()).toList();
  }
}
