import 'package:recipe_app/data/data_source/book_mark_data_source.dart';

import 'package:recipe_app/data/mepper/book_mark_mepper.dart';
import 'package:recipe_app/domain/model/book_mark/book_mark.dart';
import 'package:recipe_app/domain/repository/book_mark_repository.dart';

class BookMarkRepositoryImpl implements BookMarkRepository {
  final BookMarkDataSource _dataSource;
  BookMarkRepositoryImpl({required BookMarkDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<BookMark> getSavedRecipe(int id) async {
    final bookMarkDto = await _dataSource.getBookMarkDto(id);
    return bookMarkDto.toBookMark();
  }
}
