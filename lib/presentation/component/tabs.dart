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
          children:
              labels
                  .map(
                    (e) =>
                        e == labels[selectedIndex]
                            ? GestureDetector(
                              onTap: () => onTap(labels.indexOf(e)),
                              child: _SelectedTab(label: e, width: tabWidth),
                            )
                            : GestureDetector(
                              onTap: () => onTap(labels.indexOf(e)),
                              child: _UnSelectedTab(label: e, width: tabWidth),
                            ),
                  )
                  .toList(),
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
