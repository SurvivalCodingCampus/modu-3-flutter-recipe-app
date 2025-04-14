import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

class ChoiceScreen extends StatefulWidget {
  final RecipeRepository repository;

  const ChoiceScreen({super.key, required this.repository});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choice Screen')),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => SavedRecipesScreen(
                          savedRecipesViewModel: SavedRecipesViewModel(
                            widget.repository,
                          )..loadRecipesData(),
                        ),
                  ),
                );
              },
              child: Text('SavedRecipes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => SearchRecipesScreen(
                          searchRecipesViewModel: SearchRecipesViewModel(
                            widget.repository,
                          ),
                        ),
                  ),
                );
              },
              child: Text('SearchRecipes'),
            ),
          ],
        ),
      ),
    );
  }
}
