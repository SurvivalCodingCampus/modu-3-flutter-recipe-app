import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';
import 'package:recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved recipes', style: TextStyles.mediumBold(),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, snapshot) {
              if (viewModel.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children:
                    viewModel.recipes
                        .map(
                          (recipe) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RecipeCard(
                              recipe: recipe,
                              isBookmarked: viewModel.user.bookmarks.contains(recipe.id),
                              onBookmark: (int id) {
                                if(viewModel.user.bookmarks.contains(recipe.id)) {
                                  viewModel.deleteBookmarkToUserModel(id);
                                } else {
                                  viewModel.saveBookmarkToUserModel(id);
                                }
                              },
                            ),
                          ),
                        )
                        .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
