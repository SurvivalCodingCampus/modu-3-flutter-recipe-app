import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/repository/mock_recipe_repository_impl.dart';

import 'package:recipe_app/main.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final mockRepository = MockRecipeRepositoryImple();
    final viewModel = HomeViewModel(recipeRepository: mockRepository);

    expect(viewModel.recipes.isNotEmpty, true);
  });
}
