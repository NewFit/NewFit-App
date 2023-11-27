// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class RegisterWelcomePage extends BaseView<RegisterPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return const Color(0xFFF2F4F6);
  }

  @override
  Widget body(BuildContext context) {
    return BaseBodyWithNoScroll(
      widgetList: [
        const Spacer(),
        NewfitButton(
          buttonText: '환영합니다!',
          buttonColor: AppColors.main,
          onPressFuntion: () {
            try {
              controller.register();
              Get.toNamed(AppPages.INITIAL);
            } catch (error) {
              error.printError();
            }
          },
        ),
      ],
    );
  }
}
