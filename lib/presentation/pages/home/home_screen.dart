import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';
import 'package:recipe_app/presentation/pages/home/view_model/home_view_model.dart';
import 'package:recipe_app/presentation/widgets/recipe/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(title: const Text('Saved recipes')),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const RecipeCard(
              recipeId: 1,
              imgUrl:
                  'https://www.seriouseats.com/thmb/-KA2hwMofR2okTRndfsKtapFG4Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2015__05__Anova-Steak-Guide-Sous-Vide-Photos15-beauty-159b7038c56a4e7685b57f478ca3e4c8.jpg',
              title: 'Traditional spare ribs baked',
              owner: 'Chef John',
              starCount: 4.0,
              bookMarkStatus: false,
              duration: 20,
              height: 150,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }
}
