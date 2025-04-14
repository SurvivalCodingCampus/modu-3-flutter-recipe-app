// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class Tabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int index) onValueChange;

  const Tabs({
    super.key,
    required this.labels,
    required this.onValueChange,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 15,
        children: List.generate(labels.length, (index) {
          return GestureDetector(
            onTap: () {
              onValueChange(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color:
                    index == selectedIndex
                        ? ColorStyle.primary100
                        : ColorStyle.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 150,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  labels[index],
                  style: TextFontStyle.extraSmallBold(
                    color:
                        index == selectedIndex
                            ? ColorStyle.white
                            : ColorStyle.primary100,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
