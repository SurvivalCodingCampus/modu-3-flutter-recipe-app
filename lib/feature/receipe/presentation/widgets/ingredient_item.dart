import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';

class IngredientItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final int weight;
  const IngredientItem({
    required this.imgUrl,
    required this.name,
    required this.weight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.grey4,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            height: 76,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white,
            ),
            child: Image.network(imgUrl),
          ),
          const SizedBox(width: 16),
          Expanded(child: Text(name, style: AppTextStyle.normalBold)),
          Text(
            '$weight'
            'g',
            style: AppTextStyle.smallRegular.copyWith(color: AppColor.grey3),
          ),
        ],
      ),
    );
  }
}
