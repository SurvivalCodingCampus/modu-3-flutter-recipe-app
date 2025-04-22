import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class GetBookmarkedRecipeIdsUseCase {
  final UserRepository userRepository;

  const GetBookmarkedRecipeIdsUseCase(this.userRepository);

  Future<UiState<List<int>>> execute() async {
    final result = await userRepository.getCurrentUser();

    return switch (result) {
      Success(:final data) => UiState.success(data.bookmarkedRecipeIds),
      Error(:final failure) => UiState.error(failure.message),
    };
  }
}
