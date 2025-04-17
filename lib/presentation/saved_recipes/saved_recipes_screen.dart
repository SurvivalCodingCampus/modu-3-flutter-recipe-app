import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes.dart';
import 'package:recipe_app/ui/ui.dart';

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
            return ListView.separated(
              itemBuilder: (context, index) {
                final recipe = widget.viewModel.state.recipes[index];
                return GestureDetector(
                  onTap: () {
                    context.push('/recipe-ingredient/${recipe.id}');
                  },
                  behavior: HitTestBehavior.opaque,
                  child: RecipeCard(
                    recipe: recipe,
                    onTap: () {
                      widget.viewModel.toggleRecipe(int.parse(recipe.id));
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: widget.viewModel.state.recipes.length,
            );
          },
        ),
      ),
    );
  }
}
