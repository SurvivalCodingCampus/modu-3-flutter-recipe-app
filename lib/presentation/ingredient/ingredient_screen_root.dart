import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_screen.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';

class IngredientScreenRoot extends StatefulWidget {
  final IngredientViewModel viewModel;
  const IngredientScreenRoot({super.key, required this.viewModel});

  @override
  State<IngredientScreenRoot> createState() => _IngredientScreenRootState();
}

class _IngredientScreenRootState extends State<IngredientScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return IngredientScreen(state: widget.viewModel.state,);
      },
    );
  }
}
