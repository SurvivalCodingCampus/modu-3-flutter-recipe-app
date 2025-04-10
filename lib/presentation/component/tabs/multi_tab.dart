import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class MultiTab extends StatelessWidget {
  final List<String> labels;
  final ValueChanged<int> onValueChange;
  final int selectedIndex;

  const MultiTab({
    super.key,
    required this.labels,
    required this.onValueChange,
    this.selectedIndex = 0,
  });

  List<Widget> buildButtons() {
    return labels
        .map(
          (label) => Expanded(
            child: GestureDetector(
              onTap: () => onValueChange(labels.indexOf(label)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                decoration: BoxDecoration(
                  color:
                      selectedIndex == labels.indexOf(label)
                          ? ColorStyles.primary100
                          : ColorStyles.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyles.smallTextBold.copyWith(
                      color:
                          selectedIndex == labels.indexOf(label)
                              ? ColorStyles.white
                              : ColorStyles.primary80,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 10, children: buildButtons());
  }
}
