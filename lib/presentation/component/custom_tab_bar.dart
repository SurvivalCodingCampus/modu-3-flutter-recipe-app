import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_sytle.dart';
import 'package:recipe_app/ui/text_style.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabTitles;
  final void Function(int)? onTabSelected;
  final int selectedIndex;

  const CustomTabBar({
    super.key,
    required this.tabTitles,
    required this.onTabSelected,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: ColorStyle.white, //ColorStyle.primary40,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
            tabTitles.asMap().entries.map((e) {
              final index = e.key;
              final title = e.value;
              final isSelected = index == selectedIndex;

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      onTabSelected?.call(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? ColorStyle.primary100
                                : ColorStyle.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: AppTextStyles.smallBold(
                          color:
                              isSelected
                                  ? ColorStyle.white
                                  : ColorStyle.primary80,
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
