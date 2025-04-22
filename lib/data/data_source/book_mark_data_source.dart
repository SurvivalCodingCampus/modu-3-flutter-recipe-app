import 'package:recipe_app/data/dto/book_mark_dto.dart';

abstract interface class BookMarkDataSource {
  // 북마크된 레시피 목록 가져오기
  Future<BookMarkDto> getBookMarkDto(int id);
}
