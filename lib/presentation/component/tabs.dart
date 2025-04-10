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
    final double paddingValue = 12;
    final totalWidth = MediaQuery.of(context).size.width - paddingValue * 2;
    final tabWidth = totalWidth / labels.length;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingValue),
      child: SizedBox(
        height: 33,
        child: Row(
          children: List.generate(labels.length, (index) {
            final label = labels[index];
            final isSelected = index == selectedIndex;
            final tabWidget = GestureDetector(
              onTap: () => onTap(index),
              child:
                  isSelected
                      ? _SelectedTab(label: label, width: tabWidth)
                      : _UnSelectedTab(label: label, width: tabWidth),
            );

            // 마지막 아이템이 아니면 간격 추가
            if (index < labels.length - 1) {
              return Row(
                children: [
                  tabWidget,
                  const SizedBox(width: 8), // ← 여기서 간격 조정
                ],
              );
            } else {
              return tabWidget;
            }
          }),
        ),
      ),
    );
  }
}

class _SelectedTab extends StatelessWidget {
  final String label;
  final double width;
  const _SelectedTab({required this.label, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
  final double width;
  const _UnSelectedTab({required this.label, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
