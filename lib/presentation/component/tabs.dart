import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int index) onChanged;

  const Tabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            onChanged(0);
          },
          child: AnimatedContainer(
            color: selectedIndex == 0 ? Colors.red : Colors.black,
            duration: Duration(milliseconds: 500),
            child: Text(
              labels[0],
              style: TextStyle(
                color: selectedIndex == 0 ? Colors.black : Colors.red,
                fontSize: 40,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onChanged(1);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: selectedIndex == 1 ? Colors.red : Colors.black,
            child: Text(
              labels[1],
              style: TextStyle(
                color: selectedIndex == 1 ? Colors.black : Colors.red,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
