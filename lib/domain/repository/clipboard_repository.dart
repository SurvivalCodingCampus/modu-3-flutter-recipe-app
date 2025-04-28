abstract interface class ClipboardRepository {
  Future<void> copy(String text);

  Future<String> paste();
}
