
import 'package:recipe_app/ui/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: InputWidget(
          onValueChange: (input) {
            print('Label: $input');
          },
        ),
      ),
    ),
  );
}

class InputWidget extends StatelessWidget {
  final String? label;
  final String? placeholder;
  final String? value;
  final void Function(String?) onValueChange;


  const InputWidget({
    super.key,
    required this.onValueChange, this.label, this.placeholder, this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                label ?? 'Label',
                style: TextStyle(
                  fontWeight: FontWeight.w300
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                key: const Key('input_field'),
                onChanged: (v) {
                  onValueChange?.call(v);
                },
                decoration: InputDecoration(
                  hintText: placeholder ?? 'Placeholder',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorStyles.gray4)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorStyles.primary100)
                  ),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(7),
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
