import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class ToggleBookmarkUseCase {
  final UserRepository _userRepository;

  const ToggleBookmarkUseCase(this._userRepository);

  Future<UiState<void>> call(int recipeId) async {
    final userResult = await _userRepository.getCurrentUser();

    if (userResult case Error(:final failure)) {
      return UiState.error(failure.message);
    }

    final User user = (userResult as Success).data;

    final List<int> updatedBookmarkedIds = [...user.bookmarkedRecipeIds];

    if (updatedBookmarkedIds.contains(recipeId)) {
      updatedBookmarkedIds.remove(recipeId);
    } else {
      updatedBookmarkedIds.add(recipeId);
    }

    final User updatedUser = user.copyWith(
      bookmarkedRecipeIds: updatedBookmarkedIds,
    );

    final saveResult = await _userRepository.saveUser(updatedUser);

    return switch (saveResult) {
      Success() => const UiState.success(null),
      Error(:final failure) => UiState.error(failure.message),
    };
  }
}
