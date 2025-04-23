import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository_impl.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_action.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_state.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

import '../../core/di/di_setup.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesState state;
  final void Function(SavedRecipesAction action) onAction;

  const SavedRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  final viewModel = SavedRecipesViewModel(getIt(), getIt(), getIt());
  final bookMarkRepository = BookMarkRepositoryImpl(recipeDataSource: getIt());

  @override
  void initState() {
    super.initState();
    viewModel.getSavedRecipes().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved recipes', style: TextStyles.savedRecipesText),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final Recipe recipe = viewModel.recipes[index];
          return RecipeCard(
            recipe: recipe,
            showTimerAndBookmark: true,
            onTapCard: () {
              context.push('/detail-screen-root/${recipe.id}');
            },
            onToggleBookMark: () {
              widget.onAction(SavedRecipesAction.removeBookMark(recipe.id));
            },
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: viewModel.recipes.length,
      ),
    );
  }
}
