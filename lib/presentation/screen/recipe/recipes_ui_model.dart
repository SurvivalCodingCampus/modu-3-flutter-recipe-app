import 'package:recipe_app/domain/entity/recipe_model.dart';

class RecipeUiModel {
  final Recipe recipe;
  final bool isBookmarked;

  RecipeUiModel({
    required this.recipe,
    required this.isBookmarked,
  });
}
