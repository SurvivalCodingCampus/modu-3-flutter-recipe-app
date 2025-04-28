import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class Tabs extends StatelessWidget {
  final List<String> labels;
  final int selectIndex;
  final void Function(int) onValueChange;

  const Tabs({
    super.key,
    required this.labels,
    required this.selectIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorStyle.white),
      height: 58,
      child: Row(
        children:
            labels.asMap().entries.map((entry) {
              final index = entry.key;
              final label = entry.value;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onValueChange(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    height: 33,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color:
                          index == selectIndex
                              ? ColorStyle.primary100
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        label,
                        style:
                            index == selectIndex
                                ? AppTextStyles.smallBold(
                                  color: ColorStyle.white,
                                )
                                : AppTextStyles.smallBold(
                                  color: ColorStyle.primary80,
                                ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
