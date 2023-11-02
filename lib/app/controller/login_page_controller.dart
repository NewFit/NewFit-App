import 'package:new_fit/app/controller/service/google_login.dart';
import 'package:new_fit/app/controller/service/kakao_login.dart';
import 'package:new_fit/app/core/base/base_controller.dart';

class LoginPageController extends BaseController {
  bool loginSuccess = false;

  Future<bool> kakaoLogin() async {
    return await KakaoLogin().login();
  }

  Future<bool> googleLogin() async {
    return await GoogleLogin().login();
  }
}
