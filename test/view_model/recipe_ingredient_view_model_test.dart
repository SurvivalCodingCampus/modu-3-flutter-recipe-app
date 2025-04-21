import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/remote_data_source/remote_data_source.dart';
import 'package:recipe_app/data/repository/repository.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';

void main() {
  test('RecipeIngredientViewModel 테스트', () async {
    final viewModel = RecipeIngredientViewModel(
      recipeRepository: RecipeRepositoryImpl(
        recipeDataSource: MockRecipeDataSourceImpl(),
      ),
      procedureRepository: ProcedureRepositoryImpl(
        procedureDataSource: MockProcedureDataSourceImpl(),
      ),
    );

    expect(viewModel.state.recipe, isNull);
    expect(viewModel.state.procedures, isEmpty);

    await viewModel.loadRecipeIngredient('1');

    expect(viewModel.state.recipe, isA<Recipe>());
    expect(viewModel.state.procedures, isNotEmpty);
  });
}
