import 'package:animate_icons/animate_icons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/model/json_models/user/user_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';

class RegisterPageController extends BaseController
    with GetTickerProviderStateMixin {
  final nameEditingController = TextEditingController();
  final nicknameEditingController = TextEditingController();
  final phonenumberEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final animateIconController = AnimateIconController();

  late TabController tabController;

  var emailValue = ''.obs;
  var passwordValue = ''.obs;
  var validpasswordValue = ''.obs;
  var currentTabIndex = 0.obs;
  var profileImageNumber = 0.obs;

  var emailEnabled = false.obs;
  var passwordEnabled = false.obs;

  var dio = Dio();

  void updateTabIndex(int index) {
    currentTabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 6);
  }

  void emailValidation(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(value)) {
      emailEnabled.value = true;
    } else {
      emailEnabled.value = false;
    }
  }

  void passwordValidation(String value) {
    if (value.isNotEmpty && value == passwordValue.value) {
      passwordEnabled.value = true;
    } else {
      passwordEnabled.value = false;
    }
  }

  void register() {
    UserService(dio).signUp(User(
        username: nameEditingController.text,
        email: emailEditingController.text,
        nickname: nicknameEditingController.text,
        tel: phonenumberEditingController.text));
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
