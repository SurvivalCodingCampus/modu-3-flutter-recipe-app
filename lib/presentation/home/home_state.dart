import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/util/category_enum.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/user.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState{
  const factory HomeState({
    @Default(User()) final User userModel,
    @Default([]) final List<Recipe> allRecipes,
    @Default([]) final List<Recipe> newRecipes,
    @Default(0) final int selectedIndex,
    @Default([]) final List<int> bookmarkList,
    @Default(false) final bool isLoading,
    @Default(Categories.values) final List<Categories> categories,
  }) = _HomeState;
}