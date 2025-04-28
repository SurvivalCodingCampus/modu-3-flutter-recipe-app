import 'package:flutter/services.dart';
import 'package:recipe_app/domain/repository/clipboard_repository.dart';

class ClipboardRepositoryImpl implements ClipboardRepository {
  @override
  Future<void> copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Future<String> paste() {
    // TODO: implement paste
    throw UnimplementedError();
  }
}
