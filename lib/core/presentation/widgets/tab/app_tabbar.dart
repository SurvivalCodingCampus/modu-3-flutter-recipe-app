import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';

class AppTabBar extends StatelessWidget {
  final List<String> tabs;
  final Function(int) onValueChange;
  const AppTabBar({required this.tabs, required this.onValueChange, super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onValueChange,
      unselectedLabelStyle: AppTextStyle.smallBold.copyWith(
        color: AppColor.primary80,
      ),
      labelStyle: AppTextStyle.smallBold.copyWith(color: AppColor.white),
      // 하단 선 제거
      dividerColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: AppColor.primary100,
        borderRadius: BorderRadius.circular(10),
      ),
      tabs: tabs.map((val) => Tab(text: val)).toList(),
    );
  }
}
