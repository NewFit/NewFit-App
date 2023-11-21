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
    UserService(dio).signUp(
        'jwt-token 자리 보안상의 이유로 올리진 않음',
        User(
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
