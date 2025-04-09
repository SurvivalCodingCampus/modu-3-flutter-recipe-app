import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class Tabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final Function(int) onValueChange;
  const Tabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 58,
      child: Row(
        children: [
          for (int i = 0; i < labels.length; i++) ...[
            GestureDetector(
              onTap: () {
                onValueChange(i);
              },
              child: Container(
                width: 300 / labels.length,
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      i == selectedIndex
                          ? ColorStyles.primary100
                          : ColorStyles.white,
                ),
                child: Center(
                  child: Text(
                    labels[i],
                    style: TextStyles.smallerTextBold.copyWith(
                      color:
                          i == selectedIndex
                              ? ColorStyles.white
                              : ColorStyles.primary80,
                    ),
                  ),
                ),
              ),
            ),
            if (i < labels.length - 1) SizedBox(width: 15),
          ],
        ],
      ),
    );
  }
}
