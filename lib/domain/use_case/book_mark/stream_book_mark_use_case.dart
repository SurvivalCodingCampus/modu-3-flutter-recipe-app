import 'package:recipe_app/domain/model/book_mark/book_mark.dart';
import 'package:recipe_app/domain/repository/book_mark_repository.dart';

class StreamBookMarkUseCase {
  final BookMarkRepository _repository;

  StreamBookMarkUseCase({required BookMarkRepository repository})
    : _repository = repository;

  Stream<BookMark> execute(int userId) {
    return _repository.streamBookmark(userId);
  }
}
