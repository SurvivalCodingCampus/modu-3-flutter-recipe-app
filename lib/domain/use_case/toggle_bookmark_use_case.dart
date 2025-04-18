import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/model/user.dart';

class ToggleBookmarkUseCase {
  final UserRepository _userRepository;

  const ToggleBookmarkUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<void> execute(int id) async {
    final User user = await _userRepository.getUser();

    // 유저를 가져와서 북마크 수젇
    if (user.bookmarks.contains(id)) {
      user.bookmarks.remove(id);
    } else {
      user.bookmarks.add(id);
    }

    // 북마크가 수정된 user 업로드
    await _userRepository.updateUser(user);
  }
}