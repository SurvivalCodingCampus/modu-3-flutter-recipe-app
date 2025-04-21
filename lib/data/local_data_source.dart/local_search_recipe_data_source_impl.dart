import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/local_data_source.dart/local_data_source.dart';

class LocalSearchRecipeDataSourceImpl implements LocalSearchRecipeDataSource {
  List<Map<String, dynamic>> _data = [];

  @override
  Future<List<RecipeDto>> getRecipes() async {
    return _data.map((e) => RecipeDto.fromJson(e)).toList();
  }

  @override
  Future<void> saveRecipes(List<RecipeDto> datas) async {
    _data = datas.map((e) => e.toJson()).toList();
  }
}
