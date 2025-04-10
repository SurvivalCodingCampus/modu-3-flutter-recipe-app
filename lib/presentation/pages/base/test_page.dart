import 'package:flutter/material.dart';
import 'package:recipe_app/core/utils/app_show_dialog.dart';
import 'package:recipe_app/presentation/widgets/base/button/app_button.dart';
import 'package:recipe_app/presentation/widgets/recipe/filter_button.dart';
import 'package:recipe_app/presentation/widgets/recipe/ingredient_item.dart';
import 'package:recipe_app/presentation/widgets/recipe/rating_button.dart';
import 'package:recipe_app/presentation/widgets/recipe/recipe_card.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = ['Label', 'Label'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IngredientItem(
                imgUrl: 'https://pngimg.com/d/tomato_PNG12591.png',
                name: 'Tomatos',
                weight: 500,
              ),
              _gap(),
              RecipeCard(
                recipeId: 1,
                imgUrl:
                    'https://www.seriouseats.com/thmb/-KA2hwMofR2okTRndfsKtapFG4Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2015__05__Anova-Steak-Guide-Sous-Vide-Photos15-beauty-159b7038c56a4e7685b57f478ca3e4c8.jpg',
                title: 'Traditional spare ribs baked',
                owner: 'Chef John',
                starCount: 4.0,
                bookMarkStatus: false,
                duration: 20,
                height: 150,
              ),
              _gap(),
              Row(
                children: [
                  Expanded(
                    child: RecipeCard(
                      recipeId: 1,
                      imgUrl:
                          'https://www.seriouseats.com/thmb/-KA2hwMofR2okTRndfsKtapFG4Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2015__05__Anova-Steak-Guide-Sous-Vide-Photos15-beauty-159b7038c56a4e7685b57f478ca3e4c8.jpg',
                      title: 'Traditional spare ribs baked',
                      owner: 'Chef John',
                      starCount: 4.0,
                      height: 150,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: RecipeCard(
                      recipeId: 1,
                      imgUrl:
                          'https://www.seriouseats.com/thmb/-KA2hwMofR2okTRndfsKtapFG4Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2015__05__Anova-Steak-Guide-Sous-Vide-Photos15-beauty-159b7038c56a4e7685b57f478ca3e4c8.jpg',
                      title: 'Traditional spare ribs baked',
                      owner: 'Chef John',
                      starCount: 4.0,
                      height: 150,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  RatingButton(text: '5', isSelected: false),
                  RatingButton(text: '5', isSelected: true),
                ],
              ),
              _gap(),
              Row(
                children: [
                  FilterButton(text: 'text', isSelected: false),
                  FilterButton(text: 'text', isSelected: true),
                ],
              ),
              AppButton(
                text: 'text',
                onClick: () {
                  AppShowDialog.ratingDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _gap() {
    return SizedBox(height: 8);
  }
}
