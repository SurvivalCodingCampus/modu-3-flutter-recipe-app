

import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';



void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: TabsWidget(
          labels: ['1','2','3'],
          selectedindex: 0,
          onValueChange: (index) {
            print('index : $index');
          },
        ),
      ),
    ),
  );
}



class TabsWidget extends StatelessWidget {
  final List<String> labels;
  final int selectedindex;
  final Function(int) onValueChange;

  const TabsWidget({super.key, required this.labels, required this.selectedindex, required this.onValueChange});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                for (int i = 0; i < (labels ?? []).length; i++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ElevatedButton(
                        onPressed: () {
                          onValueChange(i);
                        },
                        child: Text(labels[i]),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: i == selectedindex ? ColorStyles.primary100 : ColorStyles.white,
                          foregroundColor: i == selectedindex ? ColorStyles.white : ColorStyles.primary100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
