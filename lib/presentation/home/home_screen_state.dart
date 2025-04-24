import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'home_screen_state.freezed.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default([]) List<Recipe> savedRecipes,
    @Default(false) bool isLoading,
  }) = _HomeScreenState;
}
