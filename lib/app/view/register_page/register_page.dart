// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';

import 'package:new_fit/app/view/common/newfit_page_indicator_dot.dart';

import 'package:new_fit/app/view/register_page/register_sub_pages/register_accept_term_page.dart';
import 'package:new_fit/app/view/register_page/register_sub_pages/register_email_input_page.dart';
import 'package:new_fit/app/view/register_page/register_sub_pages/register_name_input_page.dart';
import 'package:new_fit/app/view/register_page/register_sub_pages/register_nickname_input_page.dart';
import 'package:new_fit/app/view/register_page/register_sub_pages/register_phonenumber_input_page.dart';
import 'package:new_fit/app/view/register_page/register_sub_pages/register_welcome_page.dart';

import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class RegisterPage extends BaseView<RegisterPageController> {
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
    return PreferredSize(
      preferredSize: Size.fromHeight(130.h),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () {
                IconData icon = Icons.close;
                if (controller.currentTabIndex.value != 0) {
                  icon = Icons.arrow_back_ios;
                } else {
                  icon = Icons.close;
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: IconButton(
                    icon: Icon(
                      icon,
                      color: AppColors.textUnabled,
                      size: 28.h,
                    ),
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (controller.tabController.index != 0) {
                        controller.tabController.animateTo(
                            (controller.tabController.index - 1) % 6);
                        controller.currentTabIndex.value =
                            controller.tabController.index;
                        FocusManager.instance.primaryFocus?.unfocus();
                      } else {
                        Get.back();
                      }
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 30.h),
            Obx(
              () {
                Color? disableColor = null;
                Color? activeColor = null;
                if (controller.currentTabIndex.value == 0) {
                  disableColor = Colors.transparent;
                } else {
                  disableColor = AppColors.secondary;
                  activeColor = AppColors.main;
                }

                return SizedBox(
                  height: 13.h,
                  width: double.infinity,
                  child: Stack(
                      children: List.generate(5, (index) {
                    return NewfitPageIndicatorDot(
                      currentTabIndex: controller.currentTabIndex,
                      targetTabIndex: index + 1,
                      position: 20.w + 40.w * index,
                      activeColor: activeColor,
                      disabledColor: disableColor,
                    );
                  })),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const NewfitTextBold3Xl(
                text: "회원가입",
                textColor: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Color pageBackgroundColor() {
    return const Color(0xFFF2F4F6);
  }

  @override
  Widget body(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.tabController,
      children: [
        RegisterAcceptTermPage(),
        RigsterNameInputPage(),
        RigsterNicknameInputPage(),
        RigsterEmailInputPage(),
        RegisterPhonenumberInputPage(),
        RegisterWelcomePage(),
      ],
    );
  }
}
