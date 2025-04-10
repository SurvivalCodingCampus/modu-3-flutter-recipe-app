import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class MultiTabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onValueChange;

  const MultiTabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 8,
      children:
          labels.map((label) {
            final int labelIndex = labels.indexOf(label);
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  onValueChange(labelIndex);
                },
                child: AnimatedContainer(
                  height: 33,
                  duration: Duration(milliseconds: 700),
                  decoration: BoxDecoration(
                    color:
                        labelIndex == selectedIndex
                            ? ColorStyle.primary100
                            : ColorStyle.gray3,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: AppTextStyles.smallBold.copyWith(
                        color: ColorStyle.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
