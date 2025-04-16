

import 'package:flutter/material.dart';

class HeadTextFiled extends StatelessWidget {
  final String textFiledName;
  final String hintTextFiledName;

  const HeadTextFiled({super.key, required this.textFiledName, required this.hintTextFiledName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textFiledName,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: hintTextFiledName,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
          ),
        ],
      ),
    );
  }
}
