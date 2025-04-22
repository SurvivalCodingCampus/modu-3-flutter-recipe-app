import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/domain/repository/select_category_repository.dart';

class SelectCategoryUseCase {
  final SelectCategoryRepository _repository;

  SelectCategoryUseCase({required SelectCategoryRepository repository})
    : _repository = repository;

  Future<List<Recipe>> execute(String category) async {
    return await _repository.selectCategoryRecipes(category);
  }
}
