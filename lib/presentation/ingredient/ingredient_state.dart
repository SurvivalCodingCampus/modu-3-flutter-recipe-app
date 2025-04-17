import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/enums/category.dart';
import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/domain/model/recipe.dart';

part 'ingredient_state.freezed.dart';

@freezed
abstract class IngredientState with _$IngredientState {
  const factory IngredientState({
    @Default(
      Recipe(
        id: -1,
        category: Category.unknown,
        chef: '정보 없음',
        foodName: '정보 없음',
        image: '정보 없음',
        ingredients: [],
        rate: -1.0,
        time: '정보 없음',
      ),
    )
    Recipe recipe,
    @Default(false) bool isLoading,
    @Default(null) Exception? error,
    @Default([]) List<Procedure> procedures,
  }) = _IngredientState;
}
