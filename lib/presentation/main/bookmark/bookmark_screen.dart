import 'package:flutter/material.dart';

import '../../../data/repository/mock_recipe_repository_impl.dart';
import '../../saved_recipes/saved_recipes_screen.dart';
import '../../saved_recipes/saved_recipes_view_model.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SavedRecipesScreen(viewModel: SavedRecipesViewModel(MockRecipeRepositoryImpl()));
  }
}