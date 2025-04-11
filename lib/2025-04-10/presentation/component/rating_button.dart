import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: RatingButton(),
      ),
    )
  );
}

class RatingButton extends StatefulWidget {
  const RatingButton({super.key});

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: Container(
                width: 51,
                height: 28,
                decoration: BoxDecoration(
                  color: isSelected ? ColorStyles.primary100 : ColorStyles.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('5',
                      style: TextStyle(
                        color: isSelected ? ColorStyles.white : ColorStyles.primary100,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.star,
                      size: 18,
                      color: isSelected ? ColorStyles.white : ColorStyles.primary100,
                    ),
                  ],
                )
              ),
            ),
          ],
        )
      ],
    );
  }
}
