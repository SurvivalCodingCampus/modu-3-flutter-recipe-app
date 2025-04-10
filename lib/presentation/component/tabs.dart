import 'package:flutter/material.dart';
import 'package:recipe_app/ui/ui.dart';

class Tabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final Function(int) onTap;
  const Tabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // final double paddingValue = 12;
    // final totalWidth = MediaQuery.of(context).size.width - paddingValue * 2;
    // final tabWidth = totalWidth / labels.length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: List.generate(labels.length * 2 - 1, (i) {
          if (i.isOdd) return const SizedBox(width: 8); // 간격 추가

          final index = i ~/ 2;
          final label = labels[index];
          final isSelected = index == selectedIndex;

          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              child:
                  isSelected
                      ? _SelectedTab(label: label)
                      : _UnSelectedTab(label: label),
            ),
          );
        }),
      ),
    );
  }
}

class _SelectedTab extends StatelessWidget {
  final String label;

  const _SelectedTab({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      decoration: BoxDecoration(
        color: ColorStyles.primary100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyles.smallTextBold.copyWith(color: ColorStyles.white),
        ),
      ),
    );
  }
}

class _UnSelectedTab extends StatelessWidget {
  final String label;

  const _UnSelectedTab({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyles.smallTextBold.copyWith(
            color: ColorStyles.primary80,
          ),
        ),
      ),
    );
  }
}
