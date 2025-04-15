import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class MadeNVBar extends StatelessWidget {
  final int index;
  final Function(int) onTap;

  const MadeNVBar({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorStyles.white,
        boxShadow: [
          BoxShadow(
            color: ColorStyles.gray4.withAlpha(20),
            // spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
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
          _navigationItem(
            Image.asset(
              index == 2 ? 'assets/images/slnot.png' : 'assets/images/not.png',
              color: index == 2 ? ColorStyles.primary60 : null,
            ),

            2,
          ),
          _navigationItem(
            Image.asset(
              index == 3
                  ? 'assets/images/slprofile.png'
                  : 'assets/images/profile.png',
              color: index == 3 ? ColorStyles.primary60 : null,
            ),
            3,
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
