class User {
  final int id;
  final String username;
  final String email;
  final int totalPoints;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.totalPoints,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      totalPoints: json['total_points'] ?? 0,
    );
  }
}
