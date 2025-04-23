import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';
import 'package:recipe_app/presentation/page/home/home_screen_action.dart';
import 'package:recipe_app/presentation/page/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  HomeViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  HomeState _state = HomeState();

  HomeState get state => _state;

  void getSearchData({required List<Recipe> searchData}) {
    _state = state.copyWith(searchData: searchData);
    notifyListeners();
  }

  void filterCategoryList({required String category}) async {
    final List<Recipe> data = await _recipeRepository.getAllRecipeList();
    if (category.toLowerCase() == "all") {
      _state = _state.copyWith(
        categoryFilterRecipeList: data,
        selectCategory: category,
      );
    } else {
      final categoryFilterList =
          data.where((items) => items.category == category).toList();
      _state = _state.copyWith(
        categoryFilterRecipeList: categoryFilterList,
        selectCategory: category,
      );
    }

    notifyListeners();
  }

  void getImageSize({required GlobalKey imageKey}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = imageKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final size = renderBox.size;
        _state = _state.copyWith(imageWidth: size.width, imageHeight: size.height);
        notifyListeners();
      }
    });
  }

  void onAction(HomeScreenAction action) {
    switch (action) {
      case OnTapSearchBar():
        getSearchData(searchData: action.searchData);

      case OnTapCategoryBadge():
        filterCategoryList(category: action.selectString);

      case OnLoadGetImageSized():
        getImageSize(imageKey: action.imageKey);
    }
  }
}
