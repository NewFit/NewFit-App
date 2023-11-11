import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/services/service/google_login.dart';
import 'package:new_fit/app/services/service/kakao_login.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

class LoginPageController extends BaseController {
  late String registerStatus;

  void kakaoLogin() async {
    registerStatus = await KakaoLogin().login();
    checkRegisterStatus();
  }

  void googleLogin() async {
    registerStatus = await GoogleLogin().login();
    checkRegisterStatus();
  }

  void checkRegisterStatus() {
    if (registerStatus == AppString.notRegistered) {
      debugPrint("not registered user");
      Get.toNamed(AppPages.REGISTER);
    } else if (registerStatus == AppString.registered) {
      debugPrint("registered user");
      Get.toNamed(AppPages.INITIAL);
    } else if (registerStatus == AppString.registeredButNoGym) {
      debugPrint("registered but gym not registered");
      Get.toNamed(AppPages.REGISTER);
    }
  }
}
