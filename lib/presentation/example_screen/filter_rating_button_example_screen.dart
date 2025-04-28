import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/buttons/filter_button.dart';

import 'package:recipe_app/core/component/buttons/rating_button.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class FilterRatingButtonExampleScreen extends StatefulWidget {
  const FilterRatingButtonExampleScreen({super.key});

  @override
  State<FilterRatingButtonExampleScreen> createState() =>
      _FilterRatingButtonExampleScreenState();
}

class _FilterRatingButtonExampleScreenState
    extends State<FilterRatingButtonExampleScreen> {
  bool isPressed1 = true;
  bool isPressed2 = false;

  bool isPressed3 = true;
  bool isPressed4 = false;

  bool isPressed5 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter RatingButton 미리보기',
          style: AppTextStyles.largeBold(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Text('📍 Rating Button', style: AppTextStyles.mediumBold()),
              SizedBox(height: 11),
              RatingButton(
                text: "1",
                isSelected: isPressed1,
                icon: Icons.star,
                onChange: () {
                  setState(() {
                    isPressed1 = !isPressed1;
                  });
                },
              ),
              const SizedBox(height: 11),
              RatingButton(
                text: "2",
                isSelected: isPressed2,
                icon: Icons.star,
                onChange: () {
                  setState(() {
                    isPressed2 = !isPressed2;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text('📍 Fileter Button', style: AppTextStyles.mediumBold()),
              const SizedBox(height: 11),
              FilterButton(
                text: "Text1",
                isSelected: isPressed3,
                onChange: () {
                  setState(() {
                    isPressed3 = !isPressed3;
                  });
                },
              ),
              const SizedBox(height: 11),
              FilterButton(
                text: "Text2",
                isSelected: isPressed4,
                onChange: () {
                  setState(() {
                    isPressed4 = !isPressed4;
                  });
                },
              ),
              const SizedBox(height: 11),
              FilterButton(
                text: "Text Text Text Text",
                isSelected: isPressed5,
                onChange: () {
                  setState(() {
                    isPressed5 = !isPressed5;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
