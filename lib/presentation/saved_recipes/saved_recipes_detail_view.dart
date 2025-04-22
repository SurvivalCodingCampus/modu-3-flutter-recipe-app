import 'package:flutter/material.dart';

import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SavedRecipesDetailView extends StatefulWidget {
  final int recipeId;

  const SavedRecipesDetailView({super.key, required this.recipeId});

  @override
  State<SavedRecipesDetailView> createState() => _SavedRecipesDetailViewState();
}

class _SavedRecipesDetailViewState extends State<SavedRecipesDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                Text(
                  '(13K Reviews)',
                  style: TextFontStyle.smallRegular(color: ColorStyle.gray4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
