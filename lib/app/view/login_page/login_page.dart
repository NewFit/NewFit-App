// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/login_page_controller.dart';
import 'package:new_fit/app/services/service/google_login.dart';
import 'package:new_fit/app/services/service/kakao_login.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

class LoginPage extends BaseView<LoginPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 640.h,
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(AppString.newfit),
          const Spacer(),
          NewfitLoginButton(
            buttonText: '구글 로그인',
            buttonColor: const Color(0xFFECECEC),
            buttonTextColor: AppColors.black,
            buttonLeadingIcon: SizedBox(
              height: 19.h,
              child: Image.asset(AppString.google),
            ),
            onPressFuntion: () async {
              await GoogleLogin().login();
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          NewfitLoginButton(
            buttonText: '카카오 로그인',
            buttonColor: const Color(0xFFFEE500),
            buttonTextColor: AppColors.black,
            buttonLeadingIcon: SizedBox(
              height: 19.h,
              child: Image.asset(AppString.kakao),
            ),
            onPressFuntion: () async {
              String register = await KakaoLogin().login();
              debugPrint(register);
              if (register == AppString.notRegistered) {
                debugPrint("tt");
                Get.toNamed(AppPages.REGISTER);
              } else if (register == AppString.registered) {
                debugPrint("tt");
                Get.toNamed(AppPages.INITIAL);
              }
            },
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
