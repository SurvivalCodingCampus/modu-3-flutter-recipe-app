import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

enum ImageType { network, file, path }

class IngredientItem extends StatelessWidget {
  final Color backgroundColor;
  final String imagePath;
  final ImageType imageType;
  final String name;
  final String content;

  const IngredientItem({
    super.key,
    required this.backgroundColor,
    required this.imagePath,
    required this.imageType,
    required this.name,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    switch (imageType) {
      case ImageType.file:
        imageWidget = Image.file(File(imagePath), fit: BoxFit.contain);

      case ImageType.network:
        imageWidget = Image.network(imagePath, fit: BoxFit.contain);

      case ImageType.path:
        imageWidget = Image.asset(imagePath, fit: BoxFit.contain);
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: ColorStyle.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: SizedBox(width: 40, child: imageWidget)),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              name,
              style: AppTextStyles.normalBold(color: ColorStyle.black),
            ),
          ),
          Text(
            content,
            style: AppTextStyles.smallRegular(color: ColorStyle.gray3),
          ),
        ],
      ),
    );
  }
}
