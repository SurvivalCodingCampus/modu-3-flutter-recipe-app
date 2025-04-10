// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class CustomThreeTabs extends StatelessWidget {
  final List<String> labels;
  final void Function(int index) onValueChange;

  const CustomThreeTabs({
    super.key,
    required this.labels,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      color: Colors.blueGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 7,
        children: [
          GestureDetector(
            onTap: () {
              final int seletedIndex = 0;
              onValueChange(seletedIndex);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: ColorStyle.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 107,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  labels[0],
                  style: TextFontStyle.extraSmallBold(
                    color: ColorStyle.primary80,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              final int seletedIndex = 1;
              onValueChange(seletedIndex);
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorStyle.primary100,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 107,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  labels[1],
                  style: TextFontStyle.extraSmallBold(color: ColorStyle.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              final int seletedIndex = 2;
              onValueChange(seletedIndex);
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorStyle.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 107,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  labels[2],
                  style: TextFontStyle.extraSmallBold(
                    color: ColorStyle.primary80,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
