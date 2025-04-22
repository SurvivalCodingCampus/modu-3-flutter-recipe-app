import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/components/f_filter_button.dart';

class FFilterButtons extends StatefulWidget {
  final List<String> allFilters;
  final List<bool> hasStars;
  final void Function(int) onTap;
  final int beforeSelectedIndex;

  const FFilterButtons({
    super.key,
    required this.allFilters,
    required this.onTap,
    required this.hasStars,
    required this.beforeSelectedIndex,
  });

  @override
  State<FFilterButtons> createState() => _FFilterButtonsState();
}

class _FFilterButtonsState extends State<FFilterButtons> {
  int _selectedFilterIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedFilterIndex = widget.beforeSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(widget.allFilters.length, (index) {
              return FFilterButton(
                text: widget.allFilters[index],
                isSelected: _selectedFilterIndex == index,
                onTap: () {
                  setState(() {
                    widget.onTap(index);
                    _selectedFilterIndex = index;
                  });
                },
                hasStar: widget.hasStars[index],
              );
            }),
          ),
        ],
      ),
    );
  }
}
