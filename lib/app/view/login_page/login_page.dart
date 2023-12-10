// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_fit/app/controller/login_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_text_field.dart';
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
            buttonText: AppString.button_google_login,
            buttonColor: const Color(0xFFECECEC),
            buttonTextColor: AppColors.black,
            buttonLeadingIcon: SizedBox(
              height: 19.h,
              child: Image.asset(AppString.google),
            ),
            onPressFuntion: () async {
              controller.googleLogin();
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          NewfitLoginButton(
            buttonText: AppString.button_kakao_login,
            buttonColor: const Color(0xFFFEE500),
            buttonTextColor: AppColors.black,
            buttonLeadingIcon: SizedBox(
              height: 19.h,
              child: Image.asset(AppString.kakao),
            ),
            onPressFuntion: () async {
              controller.kakaoLogin();
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
