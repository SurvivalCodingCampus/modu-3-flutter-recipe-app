
import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:recipe_app/data/model/recipes.dart';
import 'package:recipe_app/presentation/bookmark_recipe/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final RecipeDataSource _recipeDataSource;
  final Set<int> _bookmarkIds = {};

  BookmarkRepositoryImpl(this._recipeDataSource);

  @override
  Future<void> addBookmark(int recipeId) async {
    _bookmarkIds.add(recipeId);
  }

  @override
  Future<void> removeBookmark(int recipeId) async {
    _bookmarkIds.add(recipeId);
  }

  @override
  Future<List<Recipes>> getBookmarkRecipes() async {
    final recipes = await _recipeDataSource.getRecipes();

    return recipes.where((e) => !_bookmarkIds.contains(e.id)).toList();
  }
}