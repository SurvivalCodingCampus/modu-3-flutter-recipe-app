// Flutter imports:
import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';

// Project imports:

class Tabs extends StatelessWidget {
  final List<String> tabTitles;
  final void Function(int)? onTabSelected;
  final int selectedIndex;

  const Tabs({
    super.key,
    required this.tabTitles,
    this.onTabSelected,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final int tabCount = tabTitles.length;

    // 탭 개수에 따라 여백과 간격 계산
    final double tabSpacing = _calculateTabSpacing(tabCount);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildExpandedTabs(tabCount, tabSpacing),
    );
  }

  List<Expanded> _buildExpandedTabs(int tabCount, double tabSpacing) {
    return tabTitles.asMap().entries.map((e) {
      final index = e.key;
      final title = e.value;
      final isSelected = index == selectedIndex;

      return Expanded(
        child: Padding(
          padding: EdgeInsets.only(
            right: index == tabCount - 1 ? 0 : tabSpacing,
          ),
          child: GestureDetector(
            onTap: () {
              onTabSelected?.call(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? ColorStyle.primary100 : ColorStyle.white,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                title,
                style: AppTextStyles.smallBold(
                  color: isSelected ? ColorStyle.white : ColorStyle.primary80,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  double _calculateTabSpacing(int tabCount) {
    // 탭 개수가 1개 이하인 경우 예외 처리
    if (tabCount <= 1) {
      return 0; // 1개 이하일 경우 탭 간격을 0으로 처리
    }

    // 탭 개수가 2개 이상일 때 간격 계산
    double spacing = 15 - (tabCount - 2) * 4; // 선형 보간 계산식

    // 최소 탭 간격을 5px로 제한
    return spacing < 5 ? 5 : spacing;
  }
}
