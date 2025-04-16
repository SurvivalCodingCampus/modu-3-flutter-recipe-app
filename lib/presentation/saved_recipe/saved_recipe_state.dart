import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/model/recipe_model.dart';
part 'saved_recipe_state.freezed.dart';

@freezed
class SavedRecipeState with _$SavedRecipeState {
  final bool isLoading;
  final List<Recipe> savedRecipes;

  SavedRecipeState({this.isLoading = false, this.savedRecipes = const []});
}
