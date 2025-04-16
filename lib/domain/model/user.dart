
// =============================== 임시 ===================================
class User {
  final int id;
  final String name;
  final String image;
  final String address;
  final Set<int> bookmarks;

  const User({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.bookmarks
  });

  // final String email;
  // final String password;
  // final String job;
  // final String profileImage;
  // final String introduce;
  // final List<int> recipes;
  // final List<String> follower;
  // final List<String> following;
  // final List<int> notifications;
}