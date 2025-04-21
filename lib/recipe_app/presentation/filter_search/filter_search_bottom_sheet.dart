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
  String selectedTimeFilter = 'All';
  String? selectedCategoryFilter;
  int? selectedRatingFilter;
  late int selectedIndexButton;

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
                      selectedTimeFilter;
                      setState(() {});
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
                  selectedRatingFilter == 1
                      ? RatingButton(
                        changedRatingFilter: (value) {
                          selectedRatingFilter = value = 1;
                        },
                      )
                      : RatingButton(
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
                  selectedCategoryFilter == ''
                      ? CategoryFilterButton(
                        changedCategoryFilter: (value) {
                          selectedCategoryFilter = value = 'All';
                        },
                      )
                      : CategoryFilterButton(
                        changedCategoryFilter: (value) {
                          setState(() {
                            selectedCategoryFilter = value;
                          });
                        },
                      ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    widget.filterSearchViewModel.filterRecipesByCategory(
                      selectedTimeFilter!,
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
