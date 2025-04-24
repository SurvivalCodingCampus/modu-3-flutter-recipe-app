import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/page/detail_recipes/detail_recipes_screen.dart';
import 'package:recipe_app/presentation/page/detail_recipes/detail_recipes_state.dart';
import 'package:recipe_app/presentation/page/detail_recipes/detail_recipes_view_model.dart';

class DetailRecipesScreenRoot extends StatefulWidget {
  final Recipe recipesData;
  const DetailRecipesScreenRoot({super.key, required this.recipesData});

  @override
  State<DetailRecipesScreenRoot> createState() => _DetailRecipesScreenRootState();
}

class _DetailRecipesScreenRootState extends State<DetailRecipesScreenRoot> {
  late final DetailRecipesViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = DetailRecipesViewModel(
      initialState: DetailRecipesState(recipesData: widget.recipesData),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _viewModel,
      builder: (context, _) => DetailRecipesScreen(viewModel: _viewModel),
    );
  }
}