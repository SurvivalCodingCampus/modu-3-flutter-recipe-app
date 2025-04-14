import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel searchRecipesViewModel;

  const SearchRecipesScreen({super.key, required this.searchRecipesViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search recipes'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListenableBuilder(
          listenable: searchRecipesViewModel..fetchRecipes(),
          builder: (context, child) {
            final state = searchRecipesViewModel.searchRecipesState;
            if (state.isRecipesLoading == true) {
              return CircularProgressIndicator();
            }
            if (state.recipes.isEmpty) {
              return Center(child: Text('레시피가 없습니다'));
            }
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 2,
              children:
                  state.recipes
                      .map(
                        (recipe) => RecipeCard(
                          recipe: recipe,
                          showTimerAndBookmark: false,
                        ),
                      )
                      .toList(),
            );
          },
        ),
      ),
    );
  }
}
