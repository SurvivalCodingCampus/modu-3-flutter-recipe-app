import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/image/app_image.dart';
import 'package:recipe_app/core/style/app_color.dart';

class FilterSearchButton extends StatelessWidget {
  const FilterSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.primary100,
        ),
        child: Image.asset(AppImage.filterSearch),
      ),
    );
  }
}
