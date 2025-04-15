import 'package:flutter/material.dart';

import '../ui/color_styles.dart';
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
  String value = '';

  void onValueChange(String inputValue){
    setState(() {
      value = inputValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.white,
          body: InputFieldWidget(label: 'Label', placeHolder: 'Placeholder',
              value: value,
              onValueChange: onValueChange)),
    );
  }
}

class InputFieldWidget extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;
  final Function(String) onValueChange;

  const InputFieldWidget({
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.smallTextRegular.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 315,
            height: 81,
            child: TextFormField(
              initialValue: value,
              onChanged: onValueChange,
              style: TextStyles.smallerTextRegular,
              decoration: InputDecoration(
                hintText: placeHolder,
                hintStyle: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray4),
                contentPadding: EdgeInsets.only(left: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorStyles.primary80, width: 1.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
