import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/chef.dart';
import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/repository/chef_repository.dart';
import 'package:recipe_app/domain/repository/procedure_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/use_case/search_chef_by_recipe_chef_use_case.dart';
import 'package:recipe_app/domain/use_case/toggle_bookmark_use_case.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_state.dart';

class RecipeIngredientViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final UserRepository _userRepository;
  final ProcedureRepository _procedureRepository;
  final int _recipeId;
  final ToggleBookmarkUseCase _toggleBookmarkUseCase;
  final SearchChefByRecipeChef _searchChefByRecipeChef;

  RecipeIngredientState _state = const RecipeIngredientState();

  RecipeIngredientState get state => _state;

  RecipeIngredientViewModel({
    required RecipeRepository recipeRepository,
    required int recipeId,
    required ToggleBookmarkUseCase toggleBookmarkUseCase,
    required UserRepository userRepository,
    required ProcedureRepository procedureRepository,
    required SearchChefByRecipeChef searchChefByRecipeChef,
  }) : _recipeRepository = recipeRepository,
       _recipeId = recipeId,
       _toggleBookmarkUseCase = toggleBookmarkUseCase,
       _userRepository = userRepository,
       _procedureRepository = procedureRepository,
       _searchChefByRecipeChef = searchChefByRecipeChef {
    _state = state.copyWith(isLoading: true);
    fetchData();
  }

  void fetchData() async {
    final User user = await _userRepository.getUser();
    final Recipe recipe = await _recipeRepository.getRecipe(_recipeId);
    _state = state.copyWith(recipe: recipe);
    _state = state.copyWith(ingredientList: recipe.ingredients);

    // User데이터의 bookmark와 비교해서 북마크 여부 확인
    if (user.bookmarks.contains(_recipeId)) {
      _state = state.copyWith(isBookmarked: true);
    } else {
      _state = state.copyWith(isBookmarked: false);
    }

    // 셰프 데이터 불러오기
    final Chef chef = await _searchChefByRecipeChef.execute(recipe.id);
    _state = state.copyWith(chef: chef);

    // procedure 불러오기
    final List<Procedure> procedures = await _procedureRepository.getProcedures();
    _state = state.copyWith(procedureList: procedures.where((e) => e.recipeId == recipe.id).toList());

    // 로딩 종료
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void toggleBookmark(int id) async {
    _state = state.copyWith(isLoading: true);
    await _toggleBookmarkUseCase.execute(id);
    _state = state.copyWith(isBookmarked: !state.isBookmarked);
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }

  void onTabSelect(int index) {
    _state = state.copyWith(tabSelectedIndex: index);
    notifyListeners();
  }

  void onRating(int rateValue) {
    print('별점: ${'⭐' * rateValue}');
  }
}
