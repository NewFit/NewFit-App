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
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class KakaoLogin implements SocialLogin {
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
      debugPrint('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
      if (token != null) {
        debugPrint("정보 보내고 유저 토큰 받기");
        newfitToken = await userService.login(Attribute(
            attribute_name: tokenInfo.id.toString(), provider_type: "KAKAO"));
        return newfitToken!.id_type;
      } else {
        debugPrint("token is null");
        return "";
      }
    } catch (error) {
      printError();
      debugPrint(error.toString());
      return "";
    }
  }

  Future<OAuthToken?> getKakaoToken() async {
    if (await isKakaoTalkInstalled()) {
      try {
        token = await UserApi.instance.loginWithKakaoTalk();
        debugPrint('카카오계정으로 로그인 성공 ${token?.accessToken}');
        return token;
      } catch (error) {
        debugPrint('카카오톡으로 로그인 실패 $error');
        if (error is PlatformException && error.code == 'CANCELED') {
          return null;
        }
        try {
          token = await UserApi.instance.loginWithKakaoAccount();
          debugPrint('카카오계정으로 로그인 성공');
          return token;
        } catch (error) {
          debugPrint('카카오계정으로 로그인 실패 $error');
          return null;
        }
      }
    } else {
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        debugPrint('카카오계정으로 로그인 성공');
        return token;
      } catch (error) {
        debugPrint('카카오계정으로 로그인 실패 $error');
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
