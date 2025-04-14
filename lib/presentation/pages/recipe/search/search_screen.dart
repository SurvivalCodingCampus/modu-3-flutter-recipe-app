import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';
import 'package:recipe_app/presentation/widgets/base/textfield/app_textfield.dart';
import 'package:recipe_app/presentation/widgets/recipe/filter_search_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    borderColor: AppColor.grey4,
                    contentPadding: const EdgeInsets.all(10),
                    controller: TextEditingController(),
                    hintText: 'Search recipe',
                  ),
                ),
                const FilterSearchButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
