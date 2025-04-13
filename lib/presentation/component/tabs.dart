import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

class Tabs extends StatefulWidget {
  final List<String> labels;
  int selectedIndex;
  final Function(int) onValueChange;

  Tabs({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onValueChange,
  });

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: List.generate(
          widget.labels.length,
              (index) => Expanded(

            child: GestureDetector(
              onTap: () {
                setState(() {
                  widget.selectedIndex = index;
                  widget.onValueChange(index);
                });
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: widget.selectedIndex == index ? ColorStyle.primary100 : Colors.transparent,

                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  widget.labels[index],
                  textAlign: TextAlign.center,
                  style: widget.selectedIndex == index ?
                    AppTextStyles.smallRegular.copyWith(color: ColorStyle.white) :
                    AppTextStyles.smallRegular.copyWith(color: ColorStyle.primary100),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}