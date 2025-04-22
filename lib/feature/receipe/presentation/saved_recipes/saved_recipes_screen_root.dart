import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreenRoot extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  const SavedRecipesScreenRoot(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: const Text('Saved recipes'),
        backgroundColor: AppColor.white,
      ),
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          final state = viewModel.state;

          return SavedRecipesScreen(onAction: viewModel.onAction, state: state);
        },
      ),
    );
  }
}
