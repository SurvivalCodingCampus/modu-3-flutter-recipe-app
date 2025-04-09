import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  final VoidCallback onClick;
  final String lable;

  const MediumButton({
    super.key,
    required this.lable,
    required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6, // 화면의 80%
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
          decoration: BoxDecoration(
            color: ColorStyle.primary100, // 버튼 색상
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  this.lable,
                  style: AppTextStyles.normalBold.copyWith(
                      color: ColorStyle.white
                  )
              ),
              const SizedBox(width: 20),
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



