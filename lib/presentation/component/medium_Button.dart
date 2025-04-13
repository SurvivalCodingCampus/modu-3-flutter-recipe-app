import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  final VoidCallback onClick;
  final String lable;

  const MediumButton({
    super.key,
    required this.lable,
    required this.onClick});

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
  Color backgroundColor = ColorStyle.primary100;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            backgroundColor = ColorStyle.primary100;
          });
          widget.onClick();
        },
        onTapDown: (details) {
          setState(() {
            backgroundColor = ColorStyle.gray4;
          });
        },
        onTapCancel: () {
          setState(() {
            backgroundColor = ColorStyle.primary100;
          });
        },
        onTapUp: (TapUpDetails) {
          setState(() {
            backgroundColor = ColorStyle.primary100;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6, // 화면의 80%
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
          decoration: BoxDecoration(
            color: backgroundColor, // 버튼 색상
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  this.widget.lable,
                  style: AppTextStyles.normalBold.copyWith(
                      color: ColorStyle.white
                  )
              ),
              const SizedBox(width: 15),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}



