import 'package:flutter/material.dart';


import '../component/recipe_card.dart';
import '../ui/text_styles.dart';
import 'saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel savedRecipesViewModel;

  const SavedRecipesScreen({super.key, required this.savedRecipesViewModel});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {

  @override
  void initState() {
    super.initState();
    widget.savedRecipesViewModel.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.savedRecipesViewModel,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: 10),
              Text(
                'Saved recipes',
                style: TextStyles.mediumTextBold.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: widget.savedRecipesViewModel.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = widget.savedRecipesViewModel.recipes[index];
                    return Center(child: RecipeCard(recipe: recipe));
                  },
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 20),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
