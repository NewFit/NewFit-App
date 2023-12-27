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
    if (registerStatus == AppString.key_oauth_history_id) {
      debugPrint(AppString.debug_not_registered);
      Get.toNamed(AppPages.REGISTER);
    } else if (registerStatus == AppString.key_authority_id) {
      debugPrint(AppString.debug_registered);
      Get.offAndToNamed(AppPages.INITIAL);
    } else if (registerStatus == AppString.key_user_id) {
      debugPrint(AppString.debug_gym_not_registered);
      Get.offAndToNamed(AppPages.REGISTER_GYM);
    }
  }

  Future<void> deleteUser() async {
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
    UserService(dio).deleteUser(
      getInt(AppString.key_user_id)!,
      getString(AppString.key_access_token)!,
      UserEmail(email: AppString.key_email),
    );
  }
}
