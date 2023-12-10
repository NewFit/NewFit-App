// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_fit/app/controller/setting_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/user/user_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_lists.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class SettingPage extends BaseView<SettingPageController> with StorageUtil {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const NewfitAppBarElevated(
      appBarTitleText: AppString.str_settting_title,
    );
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(widgetList: [
      NewfitSettingListCell(
        onPressedFunction: () async {
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

          await UserService(dio).deleteUser(
              getInt('user-id')!,
              "Bearer ${getString('access-token')!}",
              UserEmail(email: getString('user-email')!));
        },
        settingTitle: '회원탈퇴',
      ),
    ]);
  }
}
