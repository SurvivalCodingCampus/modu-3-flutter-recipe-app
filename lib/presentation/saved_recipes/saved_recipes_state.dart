import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/model/recipe.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
class SavedRecipesState with _$SavedRecipesState {
  final List<Recipe> recipes;
  final bool isLoading;

  const SavedRecipesState({this.recipes = const [], this.isLoading = false});
}
