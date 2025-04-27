abstract class CopyLinkRepository {
  Future<void> copyLink(int id);

  Future<String?> getLink(int id);
}
