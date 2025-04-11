import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/type/f_button_type.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FMediumButton extends StatefulWidget {
  final String text;
  final VoidCallback voidCallback;

  const FMediumButton({
    super.key,
    required this.text,
    required this.voidCallback,
  });

  @override
  State<FMediumButton> createState() => _FMediumButtonState();
}

class _FMediumButtonState extends State<FMediumButton> {
  FButtonType _buttonType = FButtonType.defaultState;

  void _changeButtonType(FButtonType buttonType) {
    setState(() {
      _buttonType = buttonType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
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
        width: 243,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _buttonType == FButtonType.disabledState ? AppColors.gray4 : AppColors.primary100,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const SizedBox(width: 9),
            const Icon(Icons.arrow_forward, size: 20, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
