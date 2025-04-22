import 'package:recipe_app/core/error/ui_state.dart';

class CheckNetworkErrorUseCase {
  Future<UiState<void>> execute({bool notUsed = true}) async {
    if (!notUsed) {
      await Future.delayed(const Duration(seconds: 3));
      return const UiState.error("네트워크 연결이 유효하지 않습니다");
    } else {
      return const UiState.success(null);
    }
  }
}
