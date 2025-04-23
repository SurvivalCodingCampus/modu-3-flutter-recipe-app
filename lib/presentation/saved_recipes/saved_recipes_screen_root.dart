import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/ui/ui.dart';

class SavedRecipesScreenRoot extends StatefulWidget {
  final SavedRecipesViewModel viewModel;
  const SavedRecipesScreenRoot({super.key, required this.viewModel});

  @override
  State<SavedRecipesScreenRoot> createState() => _SavedRecipesScreenRootState();
}

class _SavedRecipesScreenRootState extends State<SavedRecipesScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchSavedRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.white,
        surfaceTintColor: ColorStyles.white,
        title: Text(
          'Saved Recipes',
          style: TextStyles.mediumTextBold.copyWith(
            color: ColorStyles.labelColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, child) {
            if (widget.viewModel.state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SavedRecipesScreen(
              state: widget.viewModel.state,
              onAction: (action) {
                switch (action) {
                  case OnTapCard():
                    context.push('/recipe-ingredient/${action.id}');
                  case OnTapSave():
                    widget.viewModel.toggleRecipe(action.id);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
