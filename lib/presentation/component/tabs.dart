import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            labels.map((label) {
              final int labelIndex = labels.indexOf(label);
              return GestureDetector(
                onTap: () {
                  onValueChange(labelIndex);
                },

                child: Container(
                  // child: AnimatedContainer(
                  // duration: const Duration(microseconds: 700),
                  width: 375 / labels.length,
                  height: 33,
                  decoration: BoxDecoration(
                    color:
                        labelIndex == selectIndex
                            ? ColorStyle.primary100
                            : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style:
                          labelIndex == selectIndex
                              ? AppTextStyles.smallBold(color: ColorStyle.white)
                              : AppTextStyles.smallBold(
                                color: ColorStyle.primary80,
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
