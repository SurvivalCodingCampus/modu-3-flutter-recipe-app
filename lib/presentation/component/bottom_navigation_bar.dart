import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import 'nv_bar_painter.dart';

class MadeNVBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  const MadeNVBar({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(child: CustomPaint(painter: NavBarPainter())),
          Positioned(
            top: -30,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorStyles.primary100,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.add_outlined, color: ColorStyles.white),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navigationItem(
                  Image.asset(
                    index == 0
                        ? 'assets/images/slhome.png'
                        : 'assets/images/home.png',
                    color: index == 0 ? ColorStyles.primary60 : null,
                  ),
                  0,
                ),
                _navigationItem(
                  Image.asset(
                    index == 1
                        ? 'assets/images/slactive.png'
                        : 'assets/images/inactive.png',
                    color: index == 1 ? ColorStyles.primary60 : null,
                  ),
                  1,
                ),
                SizedBox(width: 30),
                _navigationItem(
                  Image.asset(
                    index == 3
                        ? 'assets/images/slnot.png'
                        : 'assets/images/not.png',
                    color: index == 3 ? ColorStyles.primary60 : null,
                  ),

                  3,
                ),
                _navigationItem(
                  Image.asset(
                    index == 4
                        ? 'assets/images/slprofile.png'
                        : 'assets/images/profile.png',
                    color: index == 4 ? ColorStyles.primary60 : null,
                  ),
                  4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navigationItem(Widget icon, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(padding: EdgeInsets.all(10), child: icon),
    );
  }
}
