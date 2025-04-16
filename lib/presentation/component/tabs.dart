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
      children: List.generate(labels.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(index),
            child: _buildTab(index),
          ),
        );
      }),
    );
  }

  Widget _buildTab(int index) {
    final isSelected = index == selectedIndex;

    return Container(
      alignment: Alignment.center,
      height: 33,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? ColorStyles.primary100 : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorStyles.primary100),
      ),
      child: Text(
        labels[index],
        style: TextStyles.smallerRegular.copyWith(
          color: isSelected ? ColorStyles.white : ColorStyles.primary100,
        ),
      ),
    );
  }
}
