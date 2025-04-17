import 'package:recipe_app/feature/receipe/data/data_source/info/recipe_info_data_source.dart';
import 'package:recipe_app/feature/receipe/data/dto/recipe_dto.dart';

class MockRecipeInfoDataSourceImpl implements RecipeInfoDataSource {
  @override
  Future<RecipeDto> getRecipeInfo(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    return RecipeDto.fromJson({
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
  }
}
