import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:new_fit/app/data/local/db/db_manager.dart';
import 'package:new_fit/app/data/local/db/db_models/token_model.dart';
import 'package:new_fit/app/data/network/kakao_key.dart';
import 'package:new_fit/app/main.dart';
import 'package:new_fit/app/routes/app_pages.dart';

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
  DBToken? dbToken = await dbManager.getToken();
  if (dbToken == null) {
    runApp(App(initialRoute: AppPages.LOGIN));
  } else {
    runApp(App(initialRoute: AppPages.INITIAL));
  }
}
