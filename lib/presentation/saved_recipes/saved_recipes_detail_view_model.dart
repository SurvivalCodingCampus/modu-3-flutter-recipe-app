import 'package:flutter/foundation.dart';
import 'package:recipe_app/domain/use_case/saved_recipe/get_saved_recipe_detail_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_detail_state.dart';

class SavedRecipesDetailViewModel with ChangeNotifier {
  final GetSavedRecipeDetailUseCase _getSavedRecipeDetailUseCase;

  SavedRecipesDetailViewModel({
    required GetSavedRecipeDetailUseCase getSavedRecipeDetailUseCase,
  }) : _getSavedRecipeDetailUseCase = getSavedRecipeDetailUseCase;

  final SavedRecipesDetailState _state = SavedRecipesDetailState();
  SavedRecipesDetailState get state => _state;
}
