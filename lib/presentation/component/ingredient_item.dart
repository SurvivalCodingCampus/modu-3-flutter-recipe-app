import 'package:flutter/material.dart';
import 'package:recipe_app/model/ingredient.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({super.key, required this.item});

  final Ingredient item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyle.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      width: double.infinity,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 52,
            height: 52,
            child: Image.network(item.imageUrl, fit: BoxFit.cover),
          ),
        ),
        title: Text(item.name, style: TextFontStyle.normalBold()),
        trailing: Text(
          '${item.imageUrl.toString()}g',
          style: TextFontStyle.smallRegular(color: ColorStyle.gray3),
        ),
      ),
    );
  }
}
