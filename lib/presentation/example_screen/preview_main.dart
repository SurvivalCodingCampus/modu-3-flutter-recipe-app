import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/example_screen/button_example_screen.dart';
import 'package:recipe_app/presentation/example_screen/color_example_screen.dart';
import 'package:recipe_app/presentation/example_screen/filter_rating_button_example_screen.dart';
import 'package:recipe_app/presentation/example_screen/ingredient_list_example_screen.dart';
import 'package:recipe_app/presentation/example_screen/input_field_example_screen.dart';
import 'package:recipe_app/presentation/example_screen/rating_dialog_example_screen.dart';
import 'package:recipe_app/presentation/example_screen/recipe_list_example_screen.dart';
import 'package:recipe_app/presentation/example_screen/search_field_example_screen.dart';
import 'package:recipe_app/presentation/example_screen/tabs_example_screen.dart';
import 'package:recipe_app/presentation/example_screen/text_style_example_screen.dart';

import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class PreviewMain extends StatelessWidget {
  const PreviewMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        surfaceTintColor: ColorStyle.white,
        backgroundColor: ColorStyle.white,
        title: Text(
          '레시피 UI 미리보기',
          style: AppTextStyles.mediumBold(color: ColorStyle.label),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                '📍AppTextStyle 모음',
                style: AppTextStyles.largeBold(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TextStyleExampleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                '📍AppColorStyle 모음',
                style: AppTextStyles.largeBold(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColorExampleScreen(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('📍Button 모음', style: AppTextStyles.largeBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ButtonExampleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('📍InputField 모음', style: AppTextStyles.largeBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputFieldExampleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('📍Tabs', style: AppTextStyles.largeBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TabsExampleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                '📍Filter/RatingButton',
                style: AppTextStyles.largeBold(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const FilterRatingButtonExampleScreen(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                '📍IngredientItem List',
                style: AppTextStyles.largeBold(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IngredientListExampleScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                '📍RecipeCard List',
                style: AppTextStyles.largeBold(),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecipeListExampleScreen(),
                  ),
                );
              },
            ),

            ListTile(
              title: Text('📍RatingDialog', style: AppTextStyles.largeBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RatingDialogExampleScreen(),
                  ),
                );
              },
            ),

            ListTile(
              title: Text('📍SearchFile', style: AppTextStyles.largeBold()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchFieldExampleScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
