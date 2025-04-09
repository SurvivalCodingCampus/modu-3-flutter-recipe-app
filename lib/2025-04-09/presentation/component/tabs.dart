import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-09/ui/color_styles.dart';
import 'package:recipe_app/2025-04-09/ui/text_styles.dart';

class Tabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onValueChange;

  const Tabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: labels.length,
      initialIndex: selectedIndex,
      child: Container(
        width: 402,
        height: 98,
        color: ColorStyles.bigContainerColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Container(
            width: 375,
            height: 58,
            color: ColorStyles.textColor,
            child: TabBar(
              onTap: onValueChange,
              labelStyle: TextStyles.selectedLabelText,
              unselectedLabelColor: ColorStyles.unSelectedTextColor,
              unselectedLabelStyle: TextStyles.unSelectedLabelText,
              indicator: BoxDecoration(
                color: ColorStyles.buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ),
              tabs: labels.map((label) => Tab(text: label)).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
