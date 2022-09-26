import 'package:client/view/authenticate/login/model/login_model.dart';
import 'package:client/view/authenticate/login/service/ILoginService.dart';
import 'package:client/view/authenticate/login/service/login_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ILoginService loginService;

  setUp(() {
    loginService = LoginService(NetworkManager(
        options:
            BaseOptions(baseUrl: 'https://multi-grocery.herokuapp.com/api')));
  });

  test('Login Test', () async {
    final response = await loginService.fetchUser(
        LoginModel(email: 'ismailertgl@gmail.com', password: '123456'), null);
    expect(response!.token, isNotNull);
  });
}
