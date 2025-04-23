import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/presentation/component/detail_recipe.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_action.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_state.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_view_model.dart';

import '../../core/di/di_setup.dart';

class DetailScreen extends StatefulWidget {
  final DetailRecipeState state;
  final void Function(DetailRecipeAction action) onAction;

  const DetailScreen({super.key, required this.state, required this.onAction});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final viewModel = DetailRecipeViewModel(
    repository: getIt(),
    useCase: getIt(),
  );
  final repository = RecipeRepository;
  late int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [Icon(Icons.search)],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (widget.state.recipe == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(30),
      child: DetailRecipe(recipe: widget.state.recipe!),
    );
  }
}
