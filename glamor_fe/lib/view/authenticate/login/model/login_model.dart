import 'package:vexana/vexana.dart';

class LoginModel extends INetworkModel<LoginModel> {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return LoginModel(email: json['email'], password: json['password']);
  }

  @override
  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
  factory LoginModel.fake() {
    return LoginModel(email: 'ismailertgl@gmail.com', password: '123456');
  }
}
