
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';

import '../../../ui/text.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ButtonsWidget(
          onClick: () {
            print('그만눌러');
          },
        )
      ),
    ),
  );
}

// class Button {
//   final String text;
//
//   const Button({
//     required this.text,
//   });
// }


class ButtonsWidget extends StatelessWidget {
  final VoidCallback onClick;


  const ButtonsWidget({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Big Button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorStyles.primary100,
                minimumSize: const Size(315, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )
              ),
              onPressed: () {
                onClick();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Button',
                      style: TextStyles.normalTextBold.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: ColorStyles.white,)
                ],
              ),
            ),
          ),
          // Medium Button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyles.primary100,
                  minimumSize: const Size(243, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
              ),
              onPressed: () {
                onClick();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Button',
                      style: TextStyles.normalTextBold.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: ColorStyles.white,)
                ],
              ),
            ),
          ),
          // Small Button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyles.primary100,
                  minimumSize: const Size(174, 37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
              ),
              onPressed: () {
                onClick();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Button',
                      style: TextStyles.normalTextBold.copyWith(
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
