import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

void main() {
  diSetUp();
  MockRecipeDataImpl mockRecipeDataImpl = MockRecipeDataImpl();
  RecipeRepository repository = RecipeRepositoryImpl(
    recipeDataSource: mockRecipeDataImpl,
  );
  SearchRecipesViewModel searchRecipesViewModel = SearchRecipesViewModel(
    getIt(),
  );
  FilterSearchViewModel filterSearchViewModel = FilterSearchViewModel(
    useCase: getIt(),
    recipeRepository: getIt(),
  );
  testWidgets('SearchRecipesScreen Check Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchRecipesScreen(
            searchRecipesViewModel: getIt(),
            filterSearchViewModel: getIt(),
            savedRecipesViewModel: getIt(),
          ),
        ),
      ),
    );
    expect(find.byType(SearchRecipesScreen), findsOneWidget);
  });
  testWidgets('SearchRecipesScreen Spice keyword  Check Test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchRecipesScreen(
            searchRecipesViewModel: getIt(),
            filterSearchViewModel: getIt(),
            savedRecipesViewModel: getIt(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // 검색창에 'Spice' 입력
    final searchFieldFinder = find.byType(TextField); // 또는 key 사용
    expect(searchFieldFinder, findsOneWidget);
    await tester.enterText(searchFieldFinder, 'Spice');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle(); // 결과 반영까지 기다림

    // 결과가 보이는지 확인
    final resultFinder = find.textContaining('Spice');
    expect(resultFinder, findsWidgets); //
  });

  testWidgets('SearchRecipesScreen japan keyword Check Test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchRecipesScreen(
            searchRecipesViewModel: getIt(),
            filterSearchViewModel: getIt(),
            savedRecipesViewModel: getIt(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // 검색창에 'japan' 입력
    final searchFieldFinder = find.byType(TextField);
    expect(searchFieldFinder, findsOneWidget);
    await tester.enterText(searchFieldFinder, 'japan');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pumpAndSettle();

    // 결과가 보이는지 확인
    final resultFinder = find.textContaining('japan');
    expect(resultFinder, findsWidgets); //
  });
}
