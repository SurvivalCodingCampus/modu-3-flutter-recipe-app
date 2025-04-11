import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/type/f_button_type.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FBigButton extends StatefulWidget {
  final String text;
  final VoidCallback voidCallback;

  const FBigButton({super.key, required this.text, required this.voidCallback});

  @override
  State<FBigButton> createState() => _FBigButtonState();
}

class _FBigButtonState extends State<FBigButton> {
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
        width: double.infinity,
        height: 60,
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
            const SizedBox(width: 11),
            const Icon(Icons.arrow_forward, size: 20, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
