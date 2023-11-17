import 'package:new_fit/app/services/service/google_login.dart';
import 'package:new_fit/app/services/service/kakao_login.dart';
import 'package:new_fit/app/core/base/base_controller.dart';

class LoginPageController extends BaseController {
  bool loginSuccess = false;

  Future<String> kakaoLogin() async {
    return await KakaoLogin().login();
  }

  Future<String> googleLogin() async {
    return await GoogleLogin().login();
  }
}
