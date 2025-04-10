import 'package:flutter/material.dart';
import 'package:recipe_app/ui/text_styles.dart';

import '../../ui/color_styles.dart';

class TabsWidget extends StatelessWidget {
  final void Function(int index) onValueChange;
  final List<String> labels;
  final int selectedIndex;

  const TabsWidget({
    super.key,
    required this.onValueChange,
    required this.labels,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorStyles.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(labels.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                onValueChange(index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color:
                        index == selectedIndex
                            ? ColorStyles.primary100
                            : ColorStyles.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      labels[index],
                      style: TextStyles.smallBold(
                        color:
                            index == selectedIndex
                                ? ColorStyles.white
                                : ColorStyles.primary80,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
