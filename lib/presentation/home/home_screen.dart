import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_widget.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          final state = widget.viewModel.state;
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
