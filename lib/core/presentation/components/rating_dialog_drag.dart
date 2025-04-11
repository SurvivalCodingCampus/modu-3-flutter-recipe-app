import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RatingDialogDrag extends StatefulWidget {
  final String title;
  final String actionName;
  final void Function(int) onChange;

  const RatingDialogDrag({
    super.key,
    required this.title,
    required this.actionName,
    required this.onChange,
  });

  @override
  State<RatingDialogDrag> createState() => _RatingDialogDragState();
}

class _RatingDialogDragState extends State<RatingDialogDrag> {
  int value = 0;
  final GlobalKey _rowKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStyle.white,
      title: Center(
        child: Text(widget.title, style: AppTextStyles.smallRegular),
      ),
      content: SizedBox(
        width: 170,
        height: 91,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double widgetWidth = constraints.minWidth;
            return GestureDetector(
              onTapDown: (details) {
                _rateRecipe(details, widgetWidth);
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                _rateRecipe(details, widgetWidth);
              },
              child: Row(
                key: _rowKey,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  return Icon(
                    value - 1 >= index
                        ? Icons.star
                        : Icons.star_border_outlined,
                    size: 40,
                    color: ColorStyle.rating,
                  );
                }),
              ),
            );
          },
        ),
      ),
      actions: [
        SmallButton(
          text: widget.actionName,
          onClick: () {
            if (value != 0) {
              widget.onChange(value);
            }
          },
          color: value != 0 ? ColorStyle.rating : ColorStyle.gray4,
        ),
      ],
    );
  }

  void _rateRecipe(details, double widgetWidth) {
    double dx = details.localPosition.dx;

    if (dx < 0) {
      setState(() {
        value = 0;
      });
    } else if (dx > widgetWidth) {
      setState(() {
        value = 5;
      });
    } else {
      // 위젯 내부라면 비율 계산
      double ratio = dx / widgetWidth;
      int newRating = (ratio * 5).ceil();
      setState(() {
        value = newRating;
      });
    }
  }
}
