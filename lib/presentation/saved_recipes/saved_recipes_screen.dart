import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.getSavedRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Saved Recipes'), centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: buildListView(),
          ),
        );
      },
    );
  }

  Widget buildListView() {
    if (widget.viewModel.state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: widget.viewModel.state.recipes.length,
      itemBuilder: (context, index) {
        final Recipe recipe = widget.viewModel.state.recipes[index];

        return RecipeCard(
          recipe: recipe,
          onCardTap: () {
            context.push('/ingredient/${recipe.id}');
          },
          onBookmarkTap: () {
            widget.viewModel.removeSavedRecipe(recipe.id);
          },
        );
      },
    );
  }
}
