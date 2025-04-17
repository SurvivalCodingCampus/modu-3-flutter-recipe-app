import 'package:recipe_app/data/data_source/book_mark_data_soure_ipl.dart';
import 'package:recipe_app/data/mepper/book_mark_mepper.dart';
import 'package:recipe_app/domain/model/book_mark/book_mark.dart';
import 'package:recipe_app/domain/roepositpry/book_mark_repository.dart';

class BookMarkRepositoryImpl implements BookMarkRepository {
  final BookMarkDataSoureIpl _dataSource;
  BookMarkRepositoryImpl({required BookMarkDataSoureIpl dataSource})
    : _dataSource = dataSource;

  @override
  Future<BookMark> getSavedRecipe(int id) async {
    final bookMarkDto = await _dataSource.getBookMarkDto(id);
    return bookMarkDto.toBookMark();
  }
}
