import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/filter_button.dart';

class HomeCategoryRail extends StatelessWidget {
  final void Function(String value) onCategoryClick;
  final List<String> categoryList;
  final String selectedCategory;
  const HomeCategoryRail({
    super.key,
    required this.onCategoryClick,
    required this.categoryList,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: ListView.separated(
        separatorBuilder: (_, _) {
          return const SizedBox(width: 8);
        },
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onCategoryClick(categoryList[index]);
            },
            child: FilterButton(
              isHome: true,
              text: categoryList[index],
              isSelected: selectedCategory == categoryList[index],
            ),
          );
        },
      ),
    );
  }
}

// class _HomeCategoryRailState extends State<HomeCategoryRail> {
//   final List<String> categoryList = const [
//     'All',
//     'Indian',
//     'Italian',
//     'Asian',
//     'Chinese',
//     'Japanese',
//   ];

//   String selectCategory = 'All';
// }
