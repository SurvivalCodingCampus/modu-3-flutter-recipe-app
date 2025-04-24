import 'package:recipe_app/data/data_source/book_mark_data_source.dart';

import 'package:recipe_app/data/mepper/book_mark_mepper.dart';
import 'package:recipe_app/domain/model/book_mark/book_mark.dart';
import 'package:recipe_app/domain/repository/book_mark_repository.dart';

class BookMarkRepositoryImpl implements BookMarkRepository {
  final BookMarkDataSource _dataSource;
  BookMark _savedBookMark = BookMark(id: 0, bookMarkedRecipesId: []);

  @override
  Future<void> addBookMark(int recipeId) async {
    _savedBookMark.bookMarkedRecipesId.add(recipeId);
  }

  @override
  Future<void> removeBookMark(int recipeId) async {
    _savedBookMark.bookMarkedRecipesId.remove(recipeId);
  }

  BookMarkRepositoryImpl({required BookMarkDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<BookMark> getSavedRecipe(int id) async {
    if (_savedBookMark.id == 0) {
      final bookMarkDto = await _dataSource.getBookMarkDto(id);
      final bookMark = bookMarkDto.toBookMark();
      _savedBookMark = _savedBookMark.copyWith(
        id: bookMark.id,
        bookMarkedRecipesId: bookMark.bookMarkedRecipesId,
      );
    }
    return _savedBookMark;
  }
}
