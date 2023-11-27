import 'package:animate_icons/animate_icons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/user/user_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RegisterPageController extends BaseController
    with GetTickerProviderStateMixin, StorageUtil {
  final nameEditingController = TextEditingController();
  final nicknameEditingController = TextEditingController();
  final phonenumberEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final animateIconController = AnimateIconController();

  late TabController tabController;

  var currentTabIndex = 0.obs;

  var dio = Dio();

  void updateTabIndex(int index) {
    currentTabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(vsync: this, length: 6);
  }

  void register() {
    final logger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 500,
    );

    dio.interceptors.add(logger);
    UserService(dio).signUp(
      'Bearer ${getString('access-token')}',
      getInt('oauth-history-id')!,
      User(
        username: nameEditingController.text,
        email: emailEditingController.text,
        nickname: nicknameEditingController.text,
        tel: phonenumberEditingController.text,
      ),
    );
  }

  @override
  void dispose() {
    nameEditingController.dispose();
    nicknameEditingController.dispose();
    phonenumberEditingController.dispose();
    emailEditingController.dispose();

    super.dispose();
  }
}
