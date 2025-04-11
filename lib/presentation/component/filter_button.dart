import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  // 옵션 개수에 따라 버튼 개수가 자동 생성됨
  final List<String> options = ['text1', 'text2', 'text3', 'text4', 'text5'];
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    // 옵션 개수만큼 isSelected 리스트 자동 생성
    isSelected = List.generate(options.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8, // 버튼 사이 수평 간격
        runSpacing: 8, // 줄바꿈 시 수직 간격
        children: List.generate(options.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                isSelected[index] = !isSelected[index]; // 토글
              });
            },
            child: Container(
              width: 60,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected[index]
                    ? const Color(0xFF129575)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF129575),
                  width: 1,
                ),
              ),
              child: Text(
                options[index],
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: isSelected[index]
                      ? Colors.white
                      : const Color(0xFF129575),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}