// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_lists.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

class RegisterAcceptTermPage extends BaseView<RegisterPageController> {
  @override
  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      bottomSheet: bottomSheet(),
      drawer: drawer(),
    );
  }

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
      screenPadding: AppValues.screenPadding,
      widgetList: [
        Row(children: [
          SvgPicture.asset(
            AppString.newfit,
            width: 100.w,
          ),
          SizedBox(width: 13.w),
          const NewfitTextBold2Xl(text: "이용약관", textColor: AppColors.black),
        ]),
        SizedBox(height: 30.h),
        const NewfitToggleList(toggleText: "약관 1", checked: true),
        SizedBox(height: 15.h),
        const NewfitToggleList(toggleText: "약관 2", checked: true),
        SizedBox(height: 15.h),
        const NewfitToggleList(toggleText: "약관 3", checked: true),
        SizedBox(height: 15.h),
        const NewfitToggleList(toggleText: "약관 4", checked: true),
        SizedBox(height: 15.h),
        Divider(
          color: AppColors.accent,
          thickness: 1.h,
        ),
        SizedBox(height: 20.h),
        const NewfitToggleList(toggleText: "약관 전체 동의하기", checked: true),
        const Spacer(),
        NewfitButton(
          buttonText: "다음",
          buttonColor: AppColors.main,
          onPressFuntion: () {
            controller.tabController
                .animateTo((controller.tabController.index + 1) % 3);
            controller.currentTabIndex.value = 1;
          },
        )
      ],
    );
  }
}
