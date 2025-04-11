import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class RatingButton extends StatefulWidget {
  final int rate;
  final VoidCallback? select;

  const RatingButton({super.key, required this.rate, this.select});

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  late List<bool> isSelectedList;

  @override
  void initState() {
    super.initState();
    isSelectedList = List.filled(widget.rate, false);
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
          List.generate(widget.rate, (index) {
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
                          '${index + 1}',
                          style: TextStyles.smallerRegular.copyWith(
                            color:
                                isSelectedList[index]
                                    ? ColorStyles.white
                                    : ColorStyles.primary80,
                            fontSize: 11,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color:
                              isSelectedList[index]
                                  ? ColorStyles.white
                                  : ColorStyles.primary80,
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
