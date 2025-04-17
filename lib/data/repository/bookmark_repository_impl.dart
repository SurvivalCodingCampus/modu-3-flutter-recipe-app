import 'package:collection/collection.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final RecipeDataSource _dataSource;
  bool _initialized = false;
  List<Recipe> _bookmarks = [];

  BookmarkRepositoryImpl(this._dataSource);

  bool get initialized => _initialized;

  @override
  Future<void> init() async {
    final List<Recipe> recipes = await _dataSource.fetch();

    _bookmarks = recipes.where((recipe) => recipe.bookmarked).toList();

    _initialized = true;
  }

  @override
  Future<void> add(Recipe recipe) async {
    if (initialized == false) {
      await init();
    }

    _bookmarks.add(recipe);
  }

  @override
  Future<void> remove(int id) async {
    if (initialized == false) {
      await init();
    }

    final Recipe? recipe = _bookmarks.firstWhereOrNull(
      (recipe) => recipe.id == id,
    );

    _bookmarks.remove(recipe);
  }

  @override
  Future<List<Recipe>> findAll() async {
    if (initialized == false) {
      await init();
    }

    return _bookmarks;
  }

  @override
  Future<List<Recipe>> findAllByFilter(
    bool Function(Recipe predicate) predicate,
  ) {
    // TODO: implement findAllByFilter
    throw UnimplementedError();
  }

  @override
  Future<Recipe?> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }
}
