import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/data/data_source/mock_recipe_data_source.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/domain/model/recipe.dart';

void main() {
  test('목데이터소스 테스트', () async {
    final RecipeDataSource mockRecipeDataSource = MockRecipeDataSource(
      client: http.Client(),
      url: 'testUrl',
    );
    final jsonList = await mockRecipeDataSource.getRecipeMaps();
    print(jsonList);
    // final recipeList =
    //     jsonList.map((e) {
    //       return Recipe.fromJson(e);
    //     }).toList();
    // print(recipeList);
  });
}
