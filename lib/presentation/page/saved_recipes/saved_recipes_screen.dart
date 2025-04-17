import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/common/component/recipe_card.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, snapshot) {
        return SafeArea(
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
                      viewModel.state.isLoading
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                            itemCount: viewModel.state.recipeList.length,
                            itemBuilder: (context, index) {
                              Recipe items = viewModel.state.recipeList[index];
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
        );
      },
    );
  }
}
