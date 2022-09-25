import 'package:vexana/vexana.dart';

abstract class IAuthService extends INetworkManager {
  IAuthService() : super();

  /* [] Locale de tokan var ise token parse edilecek yok ise LoginView yönlendirilecek
     [] Parse edilen token içerisindeki email ve password ile servise istek atılacak.
     [] User Authenticate edilir ise sornaki logicler yapılacak. (Henüz Planlanmadı)
  */

}
