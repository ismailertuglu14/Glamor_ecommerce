import 'package:client/core/base/base_model.dart';

class UserModel extends IBaseModel<UserModel> {
  late String username;
  late String email;
  late String? imageUrl;
  late int type;

  UserModel(
      {required this.username,
      required this.email,
      this.imageUrl,
      required this.type});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    imageUrl = json['imageUrl'] ?? '';
    type = json['type'] as int;
  }

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "imageUrl": imageUrl,
        "type": type,
      };
}
