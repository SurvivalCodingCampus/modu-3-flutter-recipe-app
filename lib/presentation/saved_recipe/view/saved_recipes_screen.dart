import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/components/f_recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipe/view_model/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel savedRecipesViewModel;

  const SavedRecipesScreen({super.key, required this.savedRecipesViewModel});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.savedRecipesViewModel,
        builder: (context, snapshot) {
          return SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Saved recipes',
                    style: TextStyles.mediumTextBold(color: AppColors.black),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      itemCount: widget.savedRecipesViewModel.savedRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe =
                            widget.savedRecipesViewModel.savedRecipes[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: FRecipeCard(recipe: recipe),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
