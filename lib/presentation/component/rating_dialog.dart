import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';
import 'package:recipe_app/ui/text.dart';



class RatingDialog extends StatefulWidget {

  final void Function(int) onchange;

  const RatingDialog({super.key, required this.onchange});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int rate = 0;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStyles.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Center(
        child: Text('Rate recipe', style: TextStyles.smallTextRegular,
        ),
      ),
      content: SizedBox(
        width: 280,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            rate = index + 1;

                          });
                        },
                        child: Image.asset(
                          rate > index ? 'assets/images/star.png' : 'assets/images/star2.png',
                          width: 20,
                          height: 20,
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (rate != 0) {
                      widget.onchange(rate);
                      setState(() {
                        rate = 0;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: rate != 0 ? ColorStyles.rating : ColorStyles.gray4,
                    ),
                    child: Text('Send',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
