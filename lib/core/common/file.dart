import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

Future<File> getLocalFile({required String fileName}) async {
  final dir = await getApplicationDocumentsDirectory();
  return File('${dir.path}/$fileName.json');
}

Future<void> saveFileListData({
  required String fileName,
  required List<dynamic> data,
}) async {
  final file = await getLocalFile(fileName: fileName);
  await file.writeAsString(jsonEncode(data));
}

Future<List<Map<String, dynamic>>> loadListData({
  required String fileName,
}) async {
  final file = await getLocalFile(fileName: '$fileName.json');

  if (!await file.exists()) return [];

  final jsonString = await file.readAsString();
  final decoded = jsonDecode(jsonString);

  if (decoded is List) {
    // 타입 캐스팅: List<Map<String, dynamic>>
    return decoded.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  return [];
}
