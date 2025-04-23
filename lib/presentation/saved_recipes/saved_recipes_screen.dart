import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel _viewModel;
  const SavedRecipesScreen({
    super.key,
    required SavedRecipesViewModel savedRecipesViewModel,
  }) : _viewModel = savedRecipesViewModel;

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget._viewModel.fetchSavedRecipes(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text('Saved recipes', style: TextFontStyle.mediumBold()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: widget._viewModel,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: widget._viewModel.state.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = widget._viewModel.state.recipes[index];
                    final isBookmarked = widget
                        ._viewModel
                        .state
                        .bookmarkedRecipes
                        .contains(recipe.id);
                    return GestureDetector(
                      onTap: () {
                        context.push('${Routes.savedDetail}/${recipe.id}');
                      },
                      child: RecipeCard(
                        recipe: recipe,
                        isBookmarked: isBookmarked,
                        onBookmarkToggle: () {
                          widget._viewModel.toggleBookmark(recipe.id);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
