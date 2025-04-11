import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/components/f_medium_button.dart';
import 'package:recipe_app/presentation/saved_recipe/view/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipe/view_model/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/splash_background.jpeg',
              fit: BoxFit.cover,
            ),
          ),

          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black],
              ),
            ),
          ),

          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 104),
                Image.asset('assets/images/logo.png', width: 79, height: 79),
                const SizedBox(height: 14),
                Text('100K+ Premium Recipe', style: TextStyles.mediumTextBold()),
                const Spacer(),
                Text(
                  'Get\nCooking',
                  textAlign: TextAlign.center,
                  style: TextStyles.custom(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.2
                  ),
                ),
            
                const SizedBox(height: 20),
            
                Text(
                  'Simple way to find Tasty Recipe',
                  style: TextStyles.normalTextRegular(),
                ),
            
                const SizedBox(height: 64),
            
                FMediumButton(
                  text: 'Start Cooking',
                  voidCallback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => SavedRecipesScreen(
                              savedRecipesViewModel: SavedRecipesViewModel(
                                recipeRepository: RecipeRepositoryImpl(
                                  recipeDataSource: RecipeDataSourceImpl(),
                                ),
                              )..fetchSavedRecipes(),
                            ),
                      ),
                    );
                  },
                ),
            
                const SizedBox(height: 84),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
