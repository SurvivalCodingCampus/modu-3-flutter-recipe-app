import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

class ChoiceScreen extends StatefulWidget {
  final RecipeRepository repository;
  final FilterSearchViewModel filterSearchViewModel;

  const ChoiceScreen({
    super.key,
    required this.repository,
    required this.filterSearchViewModel,
  });

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choice Screen'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 18),
                backgroundColor: Colors.amber,
              ),
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
              child: const Text('저장된 레시피'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 18),
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => SearchRecipesScreen(
                          searchRecipesViewModel: SearchRecipesViewModel(
                            widget.repository,
                          ),
                          filterSearchViewModel: widget.filterSearchViewModel,
                        ),
                  ),
                );
              },
              child: const Text('레시피 검색'),
            ),
          ],
        ),
      ),
    );
  }
}
