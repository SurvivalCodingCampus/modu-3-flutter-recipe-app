import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/core/modules/exception/custom_exception.dart';
import 'package:recipe_app/feature/receipe/data/data_source/info/mock/mock_recipe_info_data_source_impl.dart';
import 'package:recipe_app/feature/receipe/data/data_source/info/recipe_info_data_source.dart';
import 'package:recipe_app/feature/receipe/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/feature/receipe/data/repository/info/recipe_info_repository_impl.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/repository/info/recipe_info_repository.dart';
import 'package:recipe_app/feature/receipe/data/dto/recipe_dto.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/info/get_recipe_info_use_case.dart';
import 'package:recipe_app/feature/receipe/presentation/info/recipe_info_view_model.dart';

void main() {
  group('recipe info test', () {
    final RecipeInfoDataSource dataSource = MockRecipeInfoDataSourceImpl();
    final RecipeInfoRepository repository = RecipeInfoRepositoryImpl(
      dataSource,
    );
    test('recipe info mock data test', () async {
      final resp = await repository.getRecipeInfo(1);
      switch (resp) {
        case Success<Recipe>():
          expect(resp.data, mock.toRecipe());
          break;
        case Error<Recipe>():
          expect(resp.error, const NetworkException());
          break;
      }
    });

    test('recipe info view model test', () async {
      final RecipeInfoViewModel viewModel = RecipeInfoViewModel(
        GetRecipeInfoUseCase(repository),
      );
      await viewModel.getRecipeInfo(1);
      expect(viewModel.state.recipe, equals(isA<Recipe>()));
      expect(viewModel.state.recipe, equals(mock.toRecipe()));
    });
  });
}

final mock = RecipeDto.fromJson({
  "category": "Indian",
  "id": 1,
  "name": "Traditional spare ribs baked",
  "image":
      "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg",
  "chef": "Chef John",
  "time": "20 min",
  "rating": 4.0,
  "bookmarkStatus": true,
  "ingredients": [
    {
      "ingredient": {
        "id": 3,
        "name": "Pork",
        "image":
            "https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg",
      },
      "amount": 500,
    },
    {
      "ingredient": {
        "id": 9,
        "name": "Onion",
        "image":
            "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg",
      },
      "amount": 50,
    },
    {
      "ingredient": {
        "id": 8,
        "name": "Pepper",
        "image":
            "https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg",
      },
      "amount": 10,
    },
    {
      "ingredient": {
        "id": 1,
        "name": "Tomato",
        "image":
            "https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg",
      },
      "amount": 100,
    },
  ],
});
