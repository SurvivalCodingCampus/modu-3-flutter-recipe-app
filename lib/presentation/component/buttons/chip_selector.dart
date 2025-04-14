import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class ChipSelector extends StatefulWidget {
  final List<String> options;
  final Function(int index) onSelected;
  final int selectedIndex;
  final List<IconData?> icons;

  const ChipSelector({
    super.key,
    required this.options,
    required this.onSelected,
    this.selectedIndex = 0,
    this.icons = const [],
  });

  @override
  State<StatefulWidget> createState() => _ChipSelectorState();
}

class _ChipSelectorState extends State<ChipSelector> {
  late int selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List.generate(widget.options.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selected = index;
            });

            widget.onSelected(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color:
                  selected == index
                      ? ColorStyles.primary100
                      : ColorStyles.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:
                    selected == index
                        ? ColorStyles.primary100
                        : ColorStyles.primary100,
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.options[index],
                  style: TextStyles.smallTextRegular.copyWith(
                    color:
                        selected == index
                            ? ColorStyles.white
                            : ColorStyles.primary100,
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
                            selected == index
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
