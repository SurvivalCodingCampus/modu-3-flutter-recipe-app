import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/media.dart';
import 'package:recipe_app/data/model/review.dart';
import 'package:recipe_app/data/model/user.dart';
import 'package:recipe_app/data/util/category_enum.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    @Default('') final String recipeId,
    @Default('') final String title,
    @Default([]) final List<Ingredient> ingridients,
    @Default(Review()) final Review review,
    @Default(User()) final User user,
    @Default(null) final DateTime? createdAt,
    @Default(Media()) final Media media,
    @Default([]) final List<String> recipeStep,
    @Default('') final String cookingTime,
    @Default([]) final List<Categorys> categoryList,
    @Default(0) final double rate,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
