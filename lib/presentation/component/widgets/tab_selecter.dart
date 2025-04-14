import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final void Function(int) onValueChange;

  const TabSelector({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          const SizedBox(
            width: 70,
            child: Text(
              'Tabs',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // 전체 틀을 둥글게 감쌈
              child: Row(
                children: List.generate(labels.length, (index) {
                  final isSelected = index == selectedIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onValueChange(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        color: isSelected
                            ? const Color(0xFF129575)
                            : Colors.transparent,
                        alignment: Alignment.center,
                        child: Text(
                          labels[index],
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF129575),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}