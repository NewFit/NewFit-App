import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:new_fit/app/data/local/db/db_manager.dart';
import 'package:new_fit/app/data/local/db/db_models/user_info_model.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/mypage/mypage_model.dart';
import 'package:new_fit/app/data/network/kakao_key.dart';
import 'package:new_fit/app/main.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "NewFit",
    baseUrl: "",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  KakaoSdk.init(nativeAppKey: KAKAO_NATIVE_KEY);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  Initializer().init();
}

class Initializer with StorageUtil {
  DBManager dbManager = DBManager();
  Dio dio = Dio();
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 80,
  );
  UserInfo? userInfo;
  late MyPageInfo myPageInfo;
  late var httpResponse;

  void init() async {
    dio.interceptors.add(prettyDioLogger);
    userInfo = await dbManager.getUserInfo();

    if (userInfo == null) {
      runApp(App(initialRoute: AppPages.INITIAL));
    } else {
      try {
        httpResponse = await UserService(dio).renewAccessToken(
            '${AppString.jwt_prefix} ${userInfo!.refresh_token}');
        await getMyPageInfo();
        saveUserInfo();
      } catch (e) {
        runApp(App(initialRoute: AppPages.INITIAL));
      }
      runApp(App(initialRoute: AppPages.INITIAL));
    }
  }

  void saveUserInfo() {
    dbManager.saveToken(
      UserInfo(
        access_token:
            httpResponse.response.headers['access-token']?.first ?? '',
        refresh_token: userInfo!.refresh_token,
        user_id: userInfo!.user_id,
        authority_id: userInfo!.authority_id,
        oauth_history_id: userInfo!.oauth_history_id,
      ),
    );
    //userinfo
    saveString(AppString.key_access_token,
        httpResponse.response.headers['access-token']!.first);
    saveString(AppString.key_refresh_token, userInfo!.refresh_token!);
    saveInt(AppString.key_authority_id, userInfo!.authority_id ?? 0);
    saveInt(AppString.key_user_id, userInfo!.user_id ?? 0);
    saveInt(AppString.key_oauth_history_id, userInfo!.oauth_history_id ?? 0);

    //mypage
    saveString(AppString.key_nickname, myPageInfo.nickname ?? '');
    saveInt(AppString.key_total_credit, myPageInfo.total_credit ?? 0);
    saveInt(AppString.key_this_month_credit, myPageInfo.this_month_credit ?? 0);
    saveInt(AppString.key_gym_id, myPageInfo.current?.authority_id ?? 0);
  }

  Future<void> getMyPageInfo() async {
    try {
      if (getInt(AppString.key_authority_id) != null &&
          getInt(AppString.key_authority_id) != 0) {
        myPageInfo = await UserService(dio).getMyPageInfo(
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)!}',
          getInt(AppString.key_authority_id)!,
        );
      } else if (getInt(AppString.key_user_id) != null) {
        myPageInfo = await UserService(dio).getMyPageInfoUserId(
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)!}',
          getInt(AppString.key_user_id)!,
        );
      }
    } catch (e) {
      e.printError();
    }
  }
}
