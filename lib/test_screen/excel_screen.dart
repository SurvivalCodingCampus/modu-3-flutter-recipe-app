import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

class ExcelScreen extends StatelessWidget {
  const ExcelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final file =
        "/Users/eastar/Documents/github/modu-3-flutter-recipe-app/assets/excel/test_data.xlsx";
    final bytes = File(file).readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);
    for (final table in excel.tables.keys) {
      print(table);
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Excel 테스트")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 36),
            child: Column(
              children: [
                Text("Excel 테스트"),
                Text("Excel 테스트"),
                Text("Excel 테스트"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
