import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class FilterSerchRecipeUseCase {
  final RecipeRepository _repository;

  FilterSerchRecipeUseCase({required RecipeRepository repository})
    : _repository = repository;

  Future<List<Recipe>> execute({
    required List<Recipe> recipes,
    required String keyword,
    required double rate,
    required Time sortTime,
    required Category category,
  }) async {
    List<Recipe> filtered;

    if (keyword.isEmpty) {
      filtered = await _repository.getRecipes(); // 전체에서 조회
    } else {
      filtered = List.from(recipes); // 키워드 검색된 내용에서 조회
    }

    // 1. 키워드 필터링
    if (keyword.isNotEmpty) {
      filtered =
          filtered
              .where(
                (r) => r.title.toLowerCase().contains(keyword.toLowerCase()),
              )
              .toList();
    }

    // 2. 별점 필터링
    if (rate > 0) {
      filtered =
          filtered
              .where((r) => r.rating >= rate && r.rating < rate + 1)
              .toList();
    }

    // 3. 시간 정렬
    switch (sortTime) {
      case Time.newest:
        filtered.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case Time.oldest:
        filtered.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case Time.popularity:
        filtered.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case Time.all:
        // No sorting needed for Time.all
        break;
    }

    // 4. 카테고리 필터링
    if (category != Category.all) {
      filtered = filtered.where((r) => r.category == category).toList();
    }

    return _repository.saveSearchRecipes(filtered);
  }
}
