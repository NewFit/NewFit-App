import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:new_fit/app/data/local/db/db_manager.dart';
import 'package:new_fit/app/data/local/db/db_models/user_info_model.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
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

  DBManager dbManager = DBManager();
  UserInfo? userInfo = await dbManager.getToken();

  if (userInfo == null) {
    runApp(App(initialRoute: AppPages.LOGIN));
    print('hhh');
  } else {
    try {
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
      dio.interceptors.add(prettyDioLogger);
      var httpResponse = await UserService(dio).renewAccessToken(
          '${AppString.jwt_prefix} ${userInfo.refresh_token}');
      dbManager.saveToken(
        UserInfo(
          access_token:
              httpResponse.response.headers['access-token']?.first ?? '',
          refresh_token: userInfo.refresh_token,
        ),
      );
      StorageUtil.saveString(AppString.key_access_token,
          httpResponse.response.headers['access-token']?.first ?? '');
      StorageUtil.saveString(
          AppString.key_refresh_token, userInfo.refresh_token!);
    } catch (e) {
      runApp(App(initialRoute: AppPages.LOGIN));
    }
    runApp(App(initialRoute: AppPages.INITIAL));
  }
}
