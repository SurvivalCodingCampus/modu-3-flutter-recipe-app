import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-10/ui/color_styles2.dart';
import 'package:recipe_app/2025-04-10/ui/text_styles2.dart';

class RatingDialog extends StatefulWidget {
  void Function(int) onChange;

  RatingDialog({super.key, required this.onChange});

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _stars = 0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          //알람창 실행할때마다 별 0으로 초기화
          _stars = 0;
        });
        showDialog(
          context: context,
          builder:
              (BuildContext context) => AlertDialog(
                title: Center(
                  child: Text('Rate recipe', style: TextStyles2.rateRecipeText),
                ),
                //AlertDialog에서도 상태변화가 생기려면 StatefulBuilder 사용해주기
                content: StatefulBuilder(
                  builder:
                      (context, setStateDialog) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              5,
                              (index) => IconButton(
                                onPressed: () {
                                  setState(() {
                                    _stars = index + 1;
                                  });
                                  setStateDialog(() {}); // ⭐️ 다이얼로그 내 UI 갱신
                                },
                                iconSize: 35,
                                icon: Icon(
                                  index + 1 <= _stars
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: ColorStyles2.starColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed:
                                  _stars == 0
                                      ? null
                                      : () {
                                        widget.onChange(_stars);
                                        Navigator.of(context).pop();
                                      },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    _stars == 0
                                        ? ColorStyles2.containerColor
                                        : ColorStyles2.starColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50.0,
                                  vertical: 20.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Text(
                                'Send',
                                style: TextStyles2.rateText.copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
              ),
        );
      },
      child: const Text('give rate'),
    );
  }
}
