import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/domain/repository/filter_category_repository.dart';

class FilterCategoryUseCase {
  final FilterCategoryRepository _filterCategoryRepository;

  FilterCategoryUseCase({
    required FilterCategoryRepository filterCategoryRepository,
  }) : _filterCategoryRepository = filterCategoryRepository;

  Future<List<Recipe>> execute(int rate, String category) async {
    return await _filterCategoryRepository.filterRecipesByCategory(
      rate,
      category,
    );
  }
}
