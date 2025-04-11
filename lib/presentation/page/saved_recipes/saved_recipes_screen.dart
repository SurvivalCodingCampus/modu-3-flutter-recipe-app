import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/common/component/recipe_card.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel model;

  const SavedRecipesScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: model,
      builder: (context, snapshot) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Saved recipes',
                    style: AppTextStyles.mediumBold(color: ColorStyle.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child:
                        model.isLoading
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                              itemCount: model.recipeList.length,
                              itemBuilder: (context, index) {
                                Recipe items = model.recipeList[index];
                                return RecipeCard(
                                  recipeName: items.name,
                                  recipeAuthor: items.author,
                                  imagePath: items.image,
                                  recipeTime: items.time,
                                  recipeRate: items.rating,
                                  imageType: ImageType.network,
                                );
                              },
                            ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
