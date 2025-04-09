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
    return SizedBox(
      height: 33,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(0),
              child:
                  selectedIndex == 0
                      ? _SelectedTab(labels[0])
                      : _UnSelectedTab(labels[0]),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(0),
              child:
                  selectedIndex == 0
                      ? _SelectedTab(labels[0])
                      : _UnSelectedTab(labels[0]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectedTab extends StatelessWidget {
  final String label;
  const _SelectedTab(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
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
  const _UnSelectedTab(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
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
