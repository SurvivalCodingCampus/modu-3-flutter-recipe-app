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
          ],
        ),
      ),
    );
  }
}
