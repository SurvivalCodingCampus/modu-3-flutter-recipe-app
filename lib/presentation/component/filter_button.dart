import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class FilterButton extends StatefulWidget {
  final List<String> text;
  final VoidCallback? select;

  const FilterButton({super.key, required this.text, this.select});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  late List<bool> isSelectedList;

  @override
  void initState() {
    super.initState();
    isSelectedList = List.filled(widget.text.length, false);
  }

  void toggleSelect(int index) {
    setState(() {
      isSelectedList[index] = !isSelectedList[index];
    });
    if (widget.select != null) widget.select!();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          List.generate(widget.text.length, (index) {
            return Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () => toggleSelect(index),
                  child: Container(
                    width: 50,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorStyles.primary100,
                        width: 1,
                      ),
                      color:
                          isSelectedList[index]
                              ? ColorStyles.primary100
                              : ColorStyles.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.text[index],
                          style: TextStyles.smallerRegular.copyWith(
                            color:
                                isSelectedList[index]
                                    ? ColorStyles.white
                                    : ColorStyles.primary80,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
