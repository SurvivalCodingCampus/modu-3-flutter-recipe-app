import 'package:flutter/material.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final int starCount;
  final String title;
  final String actionName;
  final void Function(int)? onChange;

  const RatingDialog({
    super.key,
    required this.title,
    required this.actionName,
    this.onChange,
    this.starCount = 5,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      width: 170,
      height: 91,
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorStyles.gray4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyles.smallerRegular.copyWith(
              color: ColorStyles.black,
              fontSize: 11,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.starCount, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedStar = index + 1;
                  });
                  widget.onChange?.call(_selectedStar);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 20,
                  height: 20,
                  color: Colors.transparent,
                  child: Icon(
                    _selectedStar >= index + 1
                        ? Icons.star
                        : Icons.star_border_outlined,
                    size: 20,
                    color: ColorStyles.rating,
                  ),
                ),
              );
            }),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 61,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color:
                  _selectedStar != 0 ? ColorStyles.rating : ColorStyles.gray4,
            ),
            child: Text(
              widget.actionName,
              textAlign: TextAlign.center,
              style: TextStyles.smallerRegular.copyWith(
                color: ColorStyles.white,
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
