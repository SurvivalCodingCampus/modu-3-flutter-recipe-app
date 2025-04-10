import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class Tabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onChanged;

  const Tabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          List.generate(labels.length, (index) {
            if (index == selectedIndex) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(index),
                  child: Container(
                    alignment: Alignment.center,
                    height: 33,
                    decoration: BoxDecoration(
                      color: ColorStyles.primary100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      labels[index],
                      style: TextStyles.smallerRegular.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(index),
                  child: Container(
                    alignment: Alignment.center,
                    height: 33,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorStyles.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      labels[index],
                      style: TextStyles.smallerRegular.copyWith(
                        color: ColorStyles.primary100,
                      ),
                    ),
                  ),
                ),
              );
            }
          }).toList(),
    );
  }
}
