import 'package:vexana/vexana.dart';

class LoginResponseModel extends INetworkModel<LoginResponseModel> {
  final String? token;
  final bool? success;
  LoginResponseModel({this.token, this.success});
  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(token: json['token'], success: json['success']);
  }

  @override
  Map<String, dynamic> toJson() =>
      {"token": token ?? '', "success": success ?? false};
}
