import 'package:flutter/material.dart';
import 'package:recipe_app/presentaiton/ui/color_styles.dart';
import '../ui/text_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  void tabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ColorStyles.primary40,
        body: Center(
          child: TabsWidget(
            labels: ['Label', 'Label'],
            selectedIndex: selectedIndex,
            onValueChange: tabSelected,
          ),
        ),
      ),
    );
  }
}

class TabsWidget extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final Function(int) onValueChange;

  const TabsWidget({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 58,
      padding: EdgeInsets.fromLTRB(30, 12, 30, 13),
      color: Colors.white,
      child: Row(
        children: List.generate(labels.length, (index) {
          final isSelected = index == selectedIndex;

          return Row(
            children: [
              GestureDetector(
                onTap: () => onValueChange(index),
                child: Container(
                  width: 150,
                  height: 33,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? ColorStyles.primary100 : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    labels[index],
                    style: isSelected
                        ? TextStyles.smallerTextBold.copyWith(color: Colors.white)
                        : TextStyles.smallerTextBold.copyWith(color: ColorStyles.primary100),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
