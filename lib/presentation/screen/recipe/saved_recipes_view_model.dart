import 'package:flutter/foundation.dart';
import 'package:recipe_app/domain/entity/recipe_model.dart';
import 'package:recipe_app/domain/usecase/get_saved_recipes_usecase.dart';
import 'package:recipe_app/domain/usecase/unbookmark_recipe_usecase.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/presentation/screen/recipe/recipes_state.dart';
import 'package:recipe_app/presentation/screen/recipe/recipes_ui_model.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final UnbookmarkRecipeUseCase _unbookmarkRecipeUseCase;
  final BookmarkRepository _bookmarkRepository;
  bool _hasInitialized = false;

  RecipesState _state = const RecipesState(isLoading: true);
  RecipesState get state => _state;

  SavedRecipesViewModel(
    this._getSavedRecipesUseCase,
    this._unbookmarkRecipeUseCase,
    this._bookmarkRepository,
  );

  /// 초기 로딩 함수 (명시적으로 호출)
  Future<void> init() async {
    await _loadAllRecipes();
  }

  Future<void> _loadAllRecipes() async {
    _updateState(_state.copyWith(isLoading: true));

    try {
      final all = await _getSavedRecipesUseCase.execute();
      final bookmarkedIds = await _bookmarkRepository.getSavedRecipes();

      // ✅ 최초 실행 시에만 자동 저장 (이 부분 유지)
      if (!_hasInitialized && bookmarkedIds.isEmpty) {
        for (final recipe in all) {
          await _bookmarkRepository.saveRecipe(recipe.id);
        }
        _hasInitialized = true; // ✅ 한 번만 실행되게 차단
      }
      
      // 이 부분 추가 - 항상 초기화 플래그를 true로 설정하여 
      // 이후에는 자동 저장이 발생하지 않도록 함
      _hasInitialized = true;

      final refreshedIds = await _bookmarkRepository.getSavedRecipes();

      final uiModels =
          all.map((recipe) {
            final isBookmarked = refreshedIds.contains(recipe.id);
            return RecipeUiModel(recipe: recipe, isBookmarked: isBookmarked);
          }).toList();

      final bookmarkedOnly = uiModels.where((e) => e.isBookmarked).toList();

      _updateState(
        _state.copyWith(
          allRecipes: uiModels,
          filteredRecipes: bookmarkedOnly,
          isLoading: false,
          isEmpty: bookmarkedOnly.isEmpty, // 북마크된 항목이 비어있는지 여부 설정
        ),
      );
    } catch (_) {
      _updateState(_state.copyWith(isLoading: false));
    }
  }

  Future<void> toggleBookmark(Recipe recipe) async {
    final isSaved = await _bookmarkRepository.isSaved(recipe.id);

    if (isSaved) {
      await _unbookmarkRecipeUseCase.execute(recipe.id);
    } else {
      await _bookmarkRepository.saveRecipe(recipe.id);
    }

    // 상태 갱신 최소화: 바로 UI 갱신
    await _loadAllRecipes();
  }

  void updateQuery(String query) {
    final filtered = query.isEmpty
        ? _state.allRecipes.where((uiModel) => uiModel.isBookmarked).toList()
        : _state.allRecipes.where((uiModel) {
            return uiModel.isBookmarked && 
                  uiModel.recipe.name.toLowerCase().contains(
                    query.toLowerCase(),
                  );
          }).toList();

    _updateState(
      _state.copyWith(
        searchQuery: query, 
        filteredRecipes: filtered,
        isEmpty: filtered.isEmpty, // 검색 결과가 비었는지 상태 갱신
      ),
    );
  }

  void _updateState(RecipesState newState) {
    if (_state == newState) return; // 상태가 바뀌지 않았다면 무시
    _state = newState;
    notifyListeners();
  }
}