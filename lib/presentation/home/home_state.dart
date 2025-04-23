import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Recipe> recipes,
    @Default('All') String selectedCategory,
    @Default(false) bool isLoading,
  }) = _HomeState;
}
