import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/user/user_model.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/services/service/google_login.dart';
import 'package:new_fit/app/services/service/kakao_login.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoginPageController extends BaseController with StorageUtil {
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
      Get.toNamed(AppPages.REGISTER_GYM);
    }
  }

  void deleteUser() {
    Dio dio = Dio();
    final logger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 80,
    );

    dio.interceptors.add(logger);
    print(getInt('user-id')!);
    print(getString('access-token')!);
    UserService(dio).deleteUser(getInt('user-id')!, getString('access-token')!,
        UserEmail(email: 'nhg1113@gmail.com'));
  }
}
