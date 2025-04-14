import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_widget.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListenableBuilder(
        listenable: viewModel..fetchRecipes(),
        builder: (context, child) {
          final state = viewModel.state;
          if (state.isLoading) {
            return CircularProgressIndicator();
          }

          return Column(
            children:
                state.recipes
                    .map((recipe) => RecipeWidget(recipe: recipe))
                    .toList(),
          );
        },
      ),
    );
  }
}
