// ignore_for_file: unused_local_variable

import 'package:client/core/constants/enums/locale_keys_enum.dart';
import 'package:client/core/init/cache/locale_manager.dart';
import 'package:client/view/authenticate/auth/service/IAuthService.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:vexana/vexana.dart';

class AuthService extends IAuthService {
  AuthService(INetworkManager manager) : super(manager);

  /* [] Locale de tokan var ise token parse edilecek yok ise LoginView yönlendirilecek
     [] Parse edilen token içerisindeki email ve password ile servise istek atılacak.
     [] User Authenticate edilir ise sornaki logicler yapılacak. (Henüz Planlanmadı)
  */
  @override
  Future<void> authUser() async {
    String? userToken =
        LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN);
    if (userToken == '') {
      return;
    } else {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(userToken);
    }
  }
}
