import 'package:client/view/authenticate/login/model/login_response_model.dart';
import 'package:client/view/authenticate/login/model/login_model.dart';
import 'package:client/view/authenticate/login/service/ILoginService.dart';
import 'package:vexana/vexana.dart';

class LoginService extends ILoginService {
  LoginService(INetworkManager manager) : super(manager);

  @override
  Future<LoginResponseModel?> fetchUser(LoginModel model) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
        'auth/login',
        parseModel: LoginResponseModel(),
        method: RequestType.POST,
        data: model);

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
