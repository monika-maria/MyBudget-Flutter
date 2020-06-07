class User {
  int userId;
  String username;
  String password;
  String role;
  bool isEnabled;
  String firebaseToken;

  User({
    this.userId,
    this.username,
    this.password,
    this.role,
    this.isEnabled,
    this.firebaseToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json["userId"],
      username: json["username"],
      password: json["password"],
      role: json["role"],
      isEnabled: json["isEnabled"],
      firebaseToken: json["firebaseToken"],
    );
  }
}
