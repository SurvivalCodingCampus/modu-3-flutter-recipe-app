import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

class FilterSearchBottomSheet extends StatelessWidget {
  const FilterSearchBottomSheet({super.key});

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
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Filter Search', style: TextStyles2.smallerTextBold),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: TextStyles2.smallerTextBold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10),
                  TimeFilterButton(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rate',
                    style: TextStyles2.smallerTextBold,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10),
                  RatingButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
