import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/search_input_field.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SearchRecipesScreen extends StatelessWidget {
  const SearchRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search recipes', style: TextFontStyle.mediumBold()),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              spacing: 20,
              children: [
                SearchInputField(
                  placeholder: 'Search recipes',
                  onValueChange: (value) {},
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyle.primary100,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune_rounded),
                    color: ColorStyle.white,
                  ),
                ),
              ],
            ),
            Text('Recent Search', style: TextFontStyle.normalBold()),
          ],
        ),
      ),
    );
  }
}
