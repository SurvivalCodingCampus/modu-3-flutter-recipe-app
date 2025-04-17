import 'package:recipe_app/domain/repository/bookmark_repository.dart';

class RemoveSavedRecipesUseCase {
  final BookmarkRepository _bookmarkRepository;

  const RemoveSavedRecipesUseCase(this._bookmarkRepository);

  Future<void> execute(int id) async {
    await _bookmarkRepository.remove(id);
  }
}
