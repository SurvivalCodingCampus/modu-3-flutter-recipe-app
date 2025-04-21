import 'package:flutter/material.dart';

class RatingButton extends StatefulWidget {
  const RatingButton({super.key});

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  final List<int> ratings = [5, 4, 3, 2, 1];
  int? selectedIndex; // 선택된 버튼의 인덱스를 저장 (null이면 아무것도 선택 안됨)

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(ratings.length, (index) {
        final rating = ratings[index];
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              // 토글 방식으로 하나만 선택되게 처리
              selectedIndex = isSelected ? null : index;
            });
          },
          child: Container(
            width: 60,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF129575) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF129575), width: 1),
            ),
            child: Text(
              '$rating ★',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : const Color(0xFF129575),
              ),
            ),
          ),
        );
      }),
    );
  }
}
