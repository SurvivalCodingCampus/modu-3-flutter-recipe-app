import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/page/splash/splash_view_model.dart';
import 'package:recipe_app/presentation/page/splash/splash_state.dart';

void main() {
  group('SplashViewModel Test', () {
    late SplashViewModel viewModel;

    setUp(() {
      viewModel = SplashViewModel();
    });

    test('초기 상태 확인', () {
      final state = viewModel.state;

      expect(state.isBackGroundVisible, false);
      expect(state.isOverlayVisible, false);
      expect(state.isLogoVisible, false);
      expect(state.isTextVisible, false);
    });

    test('stateChange() 호출 시 순차적으로 상태가 변경되어야 함', () async {
      // 상태 변화 감지용 변수
      List<SplashState> stateLog = [];
      viewModel.addListener(() {
        stateLog.add(viewModel.state);
      });

      await viewModel.stateChange();

      expect(stateLog.length, 4); // 각 단계에서 notifyListeners()가 호출됨
      expect(stateLog[0].isBackGroundVisible, true);
      expect(stateLog[1].isOverlayVisible, true);
      expect(stateLog[2].isLogoVisible, true);
      expect(stateLog[3].isTextVisible, true);
    });

    test('인터넷이 없는 경우 테스트 (mock)', () async {
      final result = await viewModel.isInternetAvailable();
      expect(result, false);
    });
  });
}
