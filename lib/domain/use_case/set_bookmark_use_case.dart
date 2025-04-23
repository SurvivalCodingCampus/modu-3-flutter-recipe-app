import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class SetBookmarkUseCase {
  final UserRepository _userRepository;
  final BookmarkRepository _bookmarkRepository;

  SetBookmarkUseCase({
    required UserRepository userRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _userRepository = userRepository,
       _bookmarkRepository = bookmarkRepository;

  Future<List<int>> execute(int userId, int recipeId) async {
    // print('useCase setBookmark 진입');
    final userModel = await _userRepository.getUserData(userId);
    // print('useCase setBookmark 끝남 userModel : $userModel');
    return await _bookmarkRepository.setBookmark(userModel, recipeId);
  }
}
