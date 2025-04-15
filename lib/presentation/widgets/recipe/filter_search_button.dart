import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/image/app_image.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/presentation/pages/recipe/search/screen/filter_search_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/search/view_model/filter_search_view_model.dart';

class FilterSearchButton extends StatelessWidget {
  final FilterSearchViewModel viewModel;
  const FilterSearchButton(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        viewModel.resetData();
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          builder: (context) {
            return FilterSearch(viewModel);
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
