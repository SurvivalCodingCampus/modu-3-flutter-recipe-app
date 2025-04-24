import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';

class FilterList extends StatelessWidget {
  final VoidCallback ontap;
  const FilterList({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: Image.asset('assets/images/filter_list.png'),
          ),
        ),
      ),
    );
  }
}
