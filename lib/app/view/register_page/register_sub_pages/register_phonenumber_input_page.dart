// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_textfield_with_category.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

class RegisterPhonenumberInputPage extends BaseView<RegisterPageController> {
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
    controller.phonenumberEditingController.addListener(() {
      controller.updatePhoneNumActive();
    });

    return Obx(
      () => BaseBodyWithNoScroll(
        screenPadding: AppValues.screenPadding,
        widgetList: [
          SizedBox(
            height: 50.h,
          ),
          NewfitTextfieldWithTitle(
            titleText: AppString.textfield_tel,
            hintText: AppString.textfield_tel_hint,
            controller: controller.phonenumberEditingController,
          ),
          const Spacer(),
          if (controller.phoneNumActive)
            NewfitButton(
              buttonText: AppString.button_next,
              buttonColor: AppColors.main,
              onPressFuntion: () {
                controller.tabController
                    .animateTo((controller.tabController.index + 1) % 6);
                controller.currentTabIndex.value = 5;
              },
            )
          else
            NewfitButton(
              buttonText: AppString.button_next,
              buttonColor: AppColors.secondary,
              onPressFuntion: () {},
            ),
        ],
      ),
    );
  }
}
