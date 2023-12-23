import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/services/service/social_login.dart';
import 'package:new_fit/app/data/model/json_models/user/attribute_model.dart';
import 'package:new_fit/app/data/model/json_models/user/token_model.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class KakaoLogin extends SocialLogin {
  OAuthToken? token;
  Token? newfitToken;
  GetStorage storage = GetStorage();
  Dio dio = Dio();
  final logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 500,
  );

  @override
  Future<String> login() async {
    dio.interceptors.add(logger);
    UserService userService = UserService(dio);
    AccessTokenInfo? tokenInfo;

    try {
      token = await getKakaoToken();
      tokenInfo = await UserApi.instance.accessTokenInfo();
      if (token != null) {
        newfitToken = await userService.login(
          Attribute(
              attribute_name: tokenInfo.id.toString(),
              provider_type: AppString.provier_type_kakao),
        );
        saveString(AppString.key_access_token, newfitToken!.access_token);
        for (final idInformation in newfitToken!.id_informations) {
          checkIdTypeAndSave(idInformation);
        }
        if (newfitToken!.id_informations.length > 1) {
          return AppString.key_authority_id;
        }
        return newfitToken!.id_informations[0].id_type;
      } else {
        return '';
      }
    } catch (error) {
      printError();
      debugPrint(error.toString());
      return '';
    }
  }

  Future<OAuthToken?> getKakaoToken() async {
    if (await isKakaoTalkInstalled()) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
        debugPrint(
            '${AppString.debug_kakao_login_success} ${token?.accessToken}');
        return token;
      } catch (error) {
        debugPrint('${AppString.debug_kakao_login_fail} $error');
        if (error is PlatformException &&
            error.code == AppString.platform_error_code) {
          return null;
        }
        try {
          token = await UserApi.instance.loginWithKakaoAccount();
          debugPrint(AppString.debug_kakao_login_success);
          return token;
        } catch (error) {
          debugPrint('${AppString.debug_kakao_login_fail} $error');
          return null;
        }
      }
    } else {
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        debugPrint(AppString.debug_kakao_login_success);
        return token;
      } catch (error) {
        debugPrint('${AppString.debug_kakao_login_fail} $error');
        return null;
      }
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }
}
