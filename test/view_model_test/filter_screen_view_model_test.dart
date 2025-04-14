import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/presentation/filter_screen/filter_screen_view_model.dart';

void main() {
  group('SavedRecipeViewModel test', () {
    final viewModel = FilterScreenViewModel();
    test('viewmodel rate update state ', () async {
      viewModel.updateRate(4);
      expect(viewModel.state.rate, 4);
    });
    test('viewmodel category update state ', () async {
      viewModel.updateCategory('chicken');
      expect(viewModel.state.selectedCategory, 'chicken');
    });
    test('viewmodel time update state ', () async {
      viewModel.updateTime('30');
      expect(viewModel.state.selectedTime, '30');
    });
  });
}
