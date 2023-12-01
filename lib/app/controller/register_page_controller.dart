import 'dart:developer';

import 'package:animate_icons/animate_icons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/user/user_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../routes/app_pages.dart';

class RegisterPageController extends BaseController
    with GetTickerProviderStateMixin, StorageUtil {
  final nameEditingController = TextEditingController();
  final nicknameEditingController = TextEditingController();
  final phonenumberEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final animateIconController = AnimateIconController();

  final RxBool _nameActive = false.obs;
  final RxBool _nicknameActive = false.obs;
  final RxBool _phoneNumActive = false.obs;
  final RxBool _emailActive = false.obs;

  late TabController tabController;

  var currentTabIndex = 0.obs;

  var dio = Dio();

  bool get nameActive => _nameActive.value;
  bool get nicknameActive => _nicknameActive.value;
  bool get phoneNumActive => _phoneNumActive.value;
  bool get emailActive => _emailActive.value;

  void updateTabIndex(int index) {
    currentTabIndex.value = index;
  }

  void updateNameActive() {
    _nameActive.value = (nameEditingController.text.length >= 2);
  }

  void updateNicknameActive() {
    _nicknameActive.value = (nicknameEditingController.text.length >= 2);
  }

  void updatePhoneNumActive() {
    final RegExp phoneNumValidator = RegExp(r'^(\d{2,3})-(\d{3,4})-(\d{4})$');

    _phoneNumActive.value = phoneNumValidator.hasMatch(phonenumberEditingController.text);
  }

  void updateEmailActive() {
    final RegExp emailValidator = RegExp(
      r'^[a-zA-Z\d._%+-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$',
    );

    _emailActive.value = emailValidator.hasMatch(emailEditingController.text);
  }

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(vsync: this, length: 6);
  }

  void register() async {
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
    final accessToken = getString('access-token')!;
    var newfitToken = await UserService(dio).signUp(
      'Bearer $accessToken}',
      getInt('oauth-history-id')!,
      User(
        username: nameEditingController.text,
        email: emailEditingController.text,
        nickname: nicknameEditingController.text,
        tel: phonenumberEditingController.text,
      ),
    );

    log(newfitToken.access_token);
    log(accessToken);

    if(newfitToken.access_token == accessToken) {
      log('TOKEN 일치');
    } else {
      log('TOKEN 불일치, access_token 새로 저장');
      saveString('newfit-access-token', newfitToken.access_token);
    }

    Get.toNamed(AppPages.REGISTER_GYM);
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
