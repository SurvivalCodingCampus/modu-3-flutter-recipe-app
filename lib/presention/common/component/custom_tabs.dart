import 'package:flutter/material.dart';
import 'package:recipe_app/presention/common/ui/color_style.dart';
import 'package:recipe_app/presention/common/ui/text_styles.dart';

class CustomTabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final VoidCallback? onValueChange;

  const CustomTabs({
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyle.white,
      height: 58,
      padding: EdgeInsets.all(10),
      child: Row(
        children:
            labels.map((e) {
              return Expanded(
                child: GestureDetector(
                  onTap: onValueChange,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == labels.indexOf(e)
                              ? ColorStyle.primary80
                              : ColorStyle.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      e,
                      style:
                          selectedIndex == labels.indexOf(e)
                              ? AppTextStyles.smallBold(color: ColorStyle.white)
                              : AppTextStyles.smallBold(
                                color: ColorStyle.primary80,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
