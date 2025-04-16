import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/bookmark_recipes_use_case.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/get_saved_recipes_use_case.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final BookmarkRecipesUseCase _bookmarkRecipesUseCase;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required BookmarkRecipesUseCase bookmarkRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _bookmarkRecipesUseCase = bookmarkRecipesUseCase;

  SavedRecipesState _state = const SavedRecipesState();
  SavedRecipesState get state => _state;

  void fetchRecipes() async {
    _state = state.copyWith(viewState: ViewState.loading);
    notifyListeners();
    final resp = await _getSavedRecipesUseCase.getSavedRecipe();
    switch (resp) {
      case Success<List<Recipe>>():
        _state = state.copyWith(data: resp.data, viewState: ViewState.complete);
      case Error<List<Recipe>>():
        _state = state.copyWith(viewState: ViewState.error);
    }
    notifyListeners();
  }

  void bookmarkRecipe(int id) async {
    final result = await _bookmarkRecipesUseCase.bookmarkRecipe(id);
    switch (result) {
      case Success<bool>():
        final newData =
            state.data
                .map(
                  (e) =>
                      e.id == id
                          ? e.copyWith(bookmarkStatus: !e.bookmarkStatus)
                          : e,
                )
                .toList();
        _state = state.copyWith(data: newData, viewState: ViewState.complete);
      case Error<bool>():
        _state = state.copyWith(viewState: ViewState.error);
    }
    notifyListeners();
  }
}
