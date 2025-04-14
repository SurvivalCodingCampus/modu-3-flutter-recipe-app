import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/image/app_image.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/presentation/widgets/recipe/filter_search.dart';

class FilterSearchButton extends StatelessWidget {
  const FilterSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        showBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          builder: (context) {
            return const FilterSearch();
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.primary100,
        ),
        child: Image.asset(AppImage.filterSearch),
      ),
    );
  }
}
