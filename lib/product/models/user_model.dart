class UserModel {
  final String username;
  final String email;
  final int type;

  UserModel({required this.username, required this.email, required this.type});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      type: json['type'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "type": type,
      };
}
