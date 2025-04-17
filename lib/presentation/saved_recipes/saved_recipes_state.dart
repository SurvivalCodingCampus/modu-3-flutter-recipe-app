import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/model.dart';

part 'saved_recipes_state.freezed.dart';

@freezed
class SavedRecipesState with _$SavedRecipesState {
  @override
  final List<Recipe> recipes;
  @override
  final bool isLoading;

  const SavedRecipesState({this.recipes = const [], this.isLoading = false});
}
