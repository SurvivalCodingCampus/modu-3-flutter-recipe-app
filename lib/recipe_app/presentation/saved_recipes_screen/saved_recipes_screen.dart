import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository_impl.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

import '../../core/di/di_setup.dart';
import 'saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel savedRecipesViewModel;

  const SavedRecipesScreen({super.key, required this.savedRecipesViewModel});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  final bookMarkRepository = BookMarkRepositoryImpl(recipeDataSource: getIt());

  @override
  void initState() {
    super.initState();
    widget.savedRecipesViewModel.getSavedRecipesUseCase();
    bookMarkRepository.initializeBookmarks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved recipes', style: TextStyles.savedRecipesText),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: ListenableBuilder(
          listenable: widget.savedRecipesViewModel,
          builder: (context, child) {
            if (widget.savedRecipesViewModel.state.isRecipesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (widget.savedRecipesViewModel.recipes.isEmpty) {
              return const Center(child: Text('저장된 레시피가 없습니다.'));
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                final Recipe recipe =
                    widget.savedRecipesViewModel.recipes[index];
                return RecipeCard(
                  recipe: recipe,
                  showTimerAndBookmark: true,
                  onToggleBookMark: () {
                    widget.savedRecipesViewModel.removeBookmarkUseCase(
                      recipe.id,
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: widget.savedRecipesViewModel.recipes.length,
            );
          },
        ),
      ),
    );
  }
}
