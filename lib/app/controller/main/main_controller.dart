import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/mypage/mypage_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../data/model/enum/menu_code.dart';
import '/app/core/base/base_controller.dart';

class MainController extends BaseController
    with StorageUtil, GetSingleTickerProviderStateMixin {
  final _selectedMenuCodeController = MenuCode.HOME.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  late TabController tabController;

  final lifeCardUpdateController = false.obs;

  var isLoading = true.obs;
  final Dio dio = Dio();
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 80,
  );

  MyPageInfo myPageInfo = MyPageInfo();

  @override
  onInit() {
    tabController = TabController(length: 4, vsync: this);
    getMyPageInfo();
    super.onInit();
  }

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }

  Future<void> getMyPageInfo() async {
    isLoading(true);
    try {
      if (getInt(AppString.key_authority_id) != 0 &&
          getInt(AppString.key_authority_id) != null) {
        myPageInfo = await UserService(dio).getMyPageInfo(
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token) ?? 'hello'}',
          getInt(AppString.key_authority_id)!,
        );
      } else {
        myPageInfo = await UserService(dio).getMyPageInfoUserId(
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token) ?? 'hello'}',
          getInt(AppString.key_user_id)!,
        );
      }
      saveUserInfo();
    } finally {
      isLoading(false);
    }
  }

  saveUserInfo() {
    saveString(AppString.key_nickname, myPageInfo.nickname ?? "hello");
    saveInt(AppString.key_total_credit, myPageInfo.total_credit ?? 0);
    saveInt(AppString.key_this_month_credit, myPageInfo.this_month_credit ?? 0);
    saveInt(AppString.key_gym_id, myPageInfo.current?.authority_id ?? 0);
  }
}
