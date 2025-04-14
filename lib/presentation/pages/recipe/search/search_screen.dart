import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';
import 'package:recipe_app/presentation/widgets/base/textfield/app_textfield.dart';
import 'package:recipe_app/presentation/widgets/recipe/filter_search_button.dart';
import 'package:recipe_app/presentation/widgets/recipe/recipe_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: AppColor.white,
        title: const Text('Search recipes'),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    prefixIcon: const Icon(Icons.search, color: AppColor.grey4),
                    borderColor: AppColor.grey4,
                    textColor: AppColor.grey4,
                    contentPadding: const EdgeInsets.all(8),
                    controller: TextEditingController(),
                    hintText: 'Search recipe',
                  ),
                ),
                const SizedBox(width: 20),
                const FilterSearchButton(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Search', style: AppTextStyle.normalBold),
                  Text(
                    '255 results',
                    style: AppTextStyle.smallerRegular.copyWith(
                      color: AppColor.grey3,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const RecipeCard(
                    recipeId: 1,
                    imgUrl:
                        'https://recipe1.ezmember.co.kr/cache/recipe/2022/09/30/8e7eb8e3019532a8dc6d39a9a325aad41.jpg',
                    title: 'title',
                    owner: 'owner',
                    starCount: 4,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
