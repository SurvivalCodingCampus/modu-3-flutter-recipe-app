import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class MultiChipSelector extends StatefulWidget {
  final List<String> options;
  final Function(List<int> selectedIndexes) onSelected;
  final List<IconData?> icons;
  final List<int> selectedIndices;
  final double spacing;
  final double runSpacing;

  const MultiChipSelector({
    super.key,
    required this.options,
    required this.onSelected,
    this.spacing = 0,
    this.runSpacing = 0,
    this.icons = const [],
    this.selectedIndices = const [],
  });

  @override
  State<StatefulWidget> createState() => _ChipSelectorState();
}

class _ChipSelectorState extends State<MultiChipSelector> {
  List<int> selectedIndices = [];

  @override
  void initState() {
    super.initState();
    selectedIndices = [...widget.selectedIndices];
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.spacing,
      runSpacing: widget.runSpacing,
      children: List.generate(widget.options.length, (index) {
        final isSelected = selectedIndices.contains(index);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedIndices.remove(index);
              } else {
                selectedIndices.add(index);
              }
            });

            widget.onSelected(selectedIndices);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: isSelected ? ColorStyles.primary100 : ColorStyles.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorStyles.primary100, width: 1.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.options[index],
                  style: TextStyles.smallTextRegular.copyWith(
                    color:
                        isSelected ? ColorStyles.white : ColorStyles.primary100,
                  ),
                ),
                if (widget.icons.length > index && widget.icons[index] != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 5),
                      Icon(
                        widget.icons[index],
                        size: 18,
                        color:
                            isSelected
                                ? ColorStyles.white
                                : ColorStyles.primary100,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
