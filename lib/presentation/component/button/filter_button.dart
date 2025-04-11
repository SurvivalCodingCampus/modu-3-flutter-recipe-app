import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool starIcon;
  final VoidCallback onChanged;

  const FilterButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onChanged,
    required this.starIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: IntrinsicWidth(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: ColorStyle.primary80),
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? ColorStyle.primary100 : ColorStyle.white,
          ),
          curve: Curves.easeInOut,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Text(
                  text,
                  style: TextFontStyle.smallRegular(
                    color:
                        isSelected ? ColorStyle.white : ColorStyle.primary100,
                  ),
                ),
                starIcon
                    ? Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.star,
                        color:
                            isSelected
                                ? ColorStyle.white
                                : ColorStyle.primary100,
                      ),
                    )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
