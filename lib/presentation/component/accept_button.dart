import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class AcceptButton extends StatefulWidget {
  final String text;

  const AcceptButton({super.key, required this.text});

  @override
  State<AcceptButton> createState() => _AcceptButtonState();
}

class _AcceptButtonState extends State<AcceptButton> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40, right: 5),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
              });
            },
            child: Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: ColorStyles.secondary100, width: 1),
              ),
              child: Center(
                child:
                    _isChecked
                        ? Icon(
                          Icons.check,
                          color: ColorStyles.secondary100,
                          size: 13,
                        )
                        : null,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.text,
            style: TextStyle(color: ColorStyles.secondary100, fontSize: 11),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
