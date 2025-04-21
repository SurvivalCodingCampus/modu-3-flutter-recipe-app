import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/component/category_filter_button.dart';
import 'package:recipe_app/recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/recipe_app/presentation/component/time_filter_button.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/recipe_app/ui/button_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final FilterSearchViewModel filterSearchViewModel;

  const FilterSearchBottomSheet({
    super.key,
    required this.filterSearchViewModel,
  });

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  String? selectedTimeFilter;
  String? selectedCategoryFilter;
  int? selectedRatingFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Filter Search', style: TextStyles.smallerTextBold),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: TextStyles.smallerTextBold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  TimeFilterButton(
                    changedTimeFilter: (value) {
                      setState(() {
                        selectedTimeFilter = value;
                      });
                      print(selectedTimeFilter);
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rate',
                    style: TextStyles.smallerTextBold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  RatingButton(
                    changedRatingFilter: (value) {
                      setState(() {
                        selectedRatingFilter = value;
                      });
                      print(selectedRatingFilter);
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: TextStyles.smallerTextBold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 5),
                  CategoryFilterButton(
                    changedCategoryFilter: (value) {
                      setState(() {
                        selectedCategoryFilter = value;
                      });
                      print(selectedCategoryFilter);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    widget.filterSearchViewModel.filterRecipesByCategory(
                      selectedRatingFilter!,
                      selectedCategoryFilter!,
                    );
                    Navigator.pop(context, true);
                  },
                  style: ButtonStyles.filterButton,
                  child: Text('Filter', style: TextStyles.smallerTextSemiBold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
