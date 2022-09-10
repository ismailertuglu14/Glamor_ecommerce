class UserModel {
  final String userName;
  final String userSurname;
  final String email;

  UserModel({
    required this.userName,
    required this.userSurname,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'],
      userSurname: json['userSurname'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "userSurname": userSurname,
        "email": email,
      };
}
