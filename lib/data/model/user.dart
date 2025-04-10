
class User {
  final String name;

  const User({
    required this.name,
  });

  @override
  String toString() {
    return 'User{name: $name}';
  }

  // final int userId;
  // final String email;
  // final String password;
  // final String job;
  // final String profileImage;
  // final String introduce;
  // final List<int> recipes;
  // final List<int> bookmarks;
  // final List<String> follower;
  // final List<String> following;
  // final List<int> notifications;
  // final String city;
}