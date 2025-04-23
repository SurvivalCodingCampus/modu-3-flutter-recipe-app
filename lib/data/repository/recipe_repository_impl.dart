import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/mepper/recipe_mepper.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;
  final List<Recipe> _savedSearchRecipes = <Recipe>[]; // 검색한 레시피 저장

  RecipeRepositoryImpl({required RecipeDataSource dataSource})
    : _dataSource = dataSource;

  // 전체 레시피 조회
  @override
  Future<List<Recipe>> getRecipes() async {
    final recipeDto = await _dataSource.getRecipeDtos();
    return recipeDto.map((e) => e.toRecipe()).toList();
  }

  // 레시피 아이디로 단일 조회
  @override
  Future<Recipe> getRecipe(int recipeId) {
    return _dataSource.getRecipeDto(recipeId).then((value) => value.toRecipe());
  }

  // 레시피 필터 조회
  @override
  Future<List<Recipe>> filterSearchRecipes({
    required List<Recipe> recipes,
    required String keyword,
    required double rate,
    required Time sortTime,
    required Category category,
  }) {
    // TODO: implement filterSearchRecipes
    throw UnimplementedError();
  }

  // 검색 레시피 조회
  @override
  Future<List<Recipe>> getSearchRecipes() {
    if (_savedSearchRecipes.isEmpty) {
      return getRecipes(); // 전체 메시지
    }
    return Future.value(_savedSearchRecipes); // 이전에 검색된 메시지 전송
  }

  // 검색된 레시피 저장
  @override
  Future<List<Recipe>> saveSearchRecipes(List<Recipe> recipes) async {
    final List<Recipe> newRecipes = List.from(recipes);
    _savedSearchRecipes.clear(); // 기존 데이터를 삭제
    _savedSearchRecipes.addAll(newRecipes); // 새 데이터를 추가
    return _savedSearchRecipes; // 업데이트된 리스트 반환
  }
}
