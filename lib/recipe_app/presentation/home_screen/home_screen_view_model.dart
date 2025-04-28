import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:recipe_app/recipe_app/domain/use_case/add_bookmark_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/remove_bookmark_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/select_category_use_case.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen_event.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen_state.dart';

import '../../data/model/recipe.dart';

class HomeScreenViewModel with ChangeNotifier {
  SelectCategoryUseCase useCase;
  AddBookmarkUseCase addBookmarkUseCase;
  RemoveBookmarkUseCase removeBookmarkUseCase;

  HomeScreenViewModel({
    required this.useCase,
    required this.addBookmarkUseCase,
    required this.removeBookmarkUseCase,
  });

  List<Recipe> get recipes => _recipes;
  List<Recipe> _recipes = [];

  HomeScreenState _state = const HomeScreenState();

  HomeScreenState get state => _state;

  final _eventController = StreamController<HomeScreenEvent>();

  Stream<HomeScreenEvent> get eventStream => _eventController.stream;

  Future<List<Recipe>> getCategoryRecipes() async {
    final category = _state.selectedCategory;

    _state = _state.copyWith(isRecipesLoading: true);
    notifyListeners();

    try {
      final result = await useCase.execute(category);
      _recipes = result;

      _state = _state.copyWith(
        recipes: result,
        isRecipesLoading: false,
        errorMessage: '',
        selectedCategory: category,
      );
      notifyListeners();
      return result;
    } catch (e) {
      _state = _state.copyWith(
        isRecipesLoading: false,
        errorMessage: '레시피 불러오기 실패',
      );
    }
    notifyListeners();
    return [];
  }

  void onSelectedCategory(String category) {
    _state = _state.copyWith(selectedCategory: category);

    getCategoryRecipes(); // 선택된 카테고리 기준으로 레시피 불러오기
    notifyListeners();
  }

  void removeBookmark(int id) async {
    _eventController.add(HomeScreenEvent.showSnackbar('제거실패'));
    removeBookmarkUseCase.execute(id);
    notifyListeners();
  }

  void addBookmark(Recipe recipe) {
    try {
      addBookmarkUseCase.execute(recipe);
      _recipes =
          _recipes
              .map(
                (item) =>
                    item.id == recipe.id
                        ? item.copyWith(bookMarked: true)
                        : item,
              )
              .toList();
      _eventController.add(HomeScreenEvent.showSnackbar('북마크 추가됨'));
    } catch (e) {
      _eventController.add(HomeScreenEvent.showSnackbar('북마크 실패'));
    }
    notifyListeners();
  }
}
