import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FTabs extends StatelessWidget {
  final List<String> labels;
  List<int> get labelsIndices => List.generate(labels.length, (index) => index);

  final void Function(int) onValueChange;
  int _selectedIndex = 0;

  FTabs({super.key, required this.labels, required this.onValueChange});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375,
        height: 58,
        padding: EdgeInsets.fromLTRB(20, 12, 20, 13),
        child: Row(
          children: labelsIndices.map((index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.5),
                child: GestureDetector(
                  onTap: () {
                    onValueChange(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primary100,
                    ),
                    alignment: Alignment.center,
                    height: 33,
                    child: Text(labels[index], style: TextStyles.smallerTextBold(),),
                  ),
                ),
              ),
            );
          }).toList(),
        )
    );
  }
}
