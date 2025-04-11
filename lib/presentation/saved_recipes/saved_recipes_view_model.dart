import 'package:flutter/foundation.dart';
import 'package:recipe_app/model/recipe.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final List<Recipe> _recipes = [];
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  final bool _isLoading = false;
  bool get isLoading => _isLoading;
}
