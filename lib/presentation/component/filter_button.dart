import 'package:flutter/material.dart';

import '../../../ui/color.dart';


void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          body: FilterButton(
            text: '아무거나',
          ),
        ),
      )
  );
}

class FilterButton extends StatefulWidget {
  final String text;

  const FilterButton({super.key, required this.text});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: isSelected ? ColorStyles.primary100 : ColorStyles.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text( widget.text,
                        style: TextStyle(
                          color: isSelected ? ColorStyles.white : ColorStyles.primary100,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ],
        )
      ],
    );
  }
}
