// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/bindings/initial_binding.dart';
import 'package:new_fit/flavors/build_config.dart';
import 'package:new_fit/flavors/env_config.dart';
import 'routes/app_pages.dart';
import 'view/theme/app_theme.dart';

class App extends StatelessWidget {
  String initialRoute;

  App({
    required this.initialRoute,
    super.key,
  });
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (buildContext, widget) => GetMaterialApp(
        title: _envConfig.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        getPages: AppPages.pages,
        initialBinding: InitialBinding(),
        theme: appThemeData,
        defaultTransition: Transition.fade,
      ),
    );
  }
}
