import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
abstract class SavedRecipesState with _$SavedRecipesState{
  const factory SavedRecipesState({
    @Default([]) final List<Recipe> recipes,
    @Default([]) final List<int> bookMarkList,
    @Default(false) final bool isLoading,
  }) = _SavedRecipesState;
}