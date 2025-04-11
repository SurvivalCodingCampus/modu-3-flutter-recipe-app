import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/type/f_button_type.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FSmallButton extends StatefulWidget {
  final String text;
  final VoidCallback voidCallback;

  const FSmallButton({super.key, required this.text, required this.voidCallback});

  @override
  State<FSmallButton> createState() => _FSmallButtonState();
}

class _FSmallButtonState extends State<FSmallButton> {
  FButtonType _buttonType = FButtonType.defaultState;

  void _changeButtonType(FButtonType buttonType) {
    setState(() {
      _buttonType = buttonType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.voidCallback();
      },
      onTapDown: (_) {
        _changeButtonType(FButtonType.disabledState);
      },
      onTapUp: (_) {
        _changeButtonType(FButtonType.defaultState);
      },
      onTapCancel: () {
        _changeButtonType(FButtonType.defaultState);
      },
      child: Container(
        width: 174,
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _buttonType == FButtonType.disabledState ? AppColors.gray4 : AppColors.primary100,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 114),
                child: Text(
                  widget.text,
                  style: TextStyles.normalTextBold(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
