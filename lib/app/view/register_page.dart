import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/newfit_page_indicator_dot.dart';
import 'package:new_fit/app/view/main_page.dart';
import 'package:new_fit/app/view/register_accept_term_page.dart';
import 'package:new_fit/app/view/register_input_info_page.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

class RegisterPage extends BaseView<RegisterPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(190.h),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: AppColors.textUnabled,
                    size: 28.h,
                  ),
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    if (controller.tabController.index != 0) {
                      controller.tabController
                          .animateTo((controller.tabController.index - 1) % 3);
                      controller.currentTabIndex.value =
                          controller.tabController.index;
                    } else {
                      //페이지 이동 코드
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Obx(
              () {
                if (controller.currentTabIndex == 0) {}

                return SizedBox(
                  height: 30.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      NewfitPageIndicatorDot(
                          currentTabIndex: controller.currentTabIndex,
                          targetTabIndex: 0,
                          position: 20.w),
                      NewfitPageIndicatorDot(
                          currentTabIndex: controller.currentTabIndex,
                          targetTabIndex: 1,
                          position: 60.w),
                      NewfitPageIndicatorDot(
                          currentTabIndex: controller.currentTabIndex,
                          targetTabIndex: 2,
                          position: 100.w),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 10.h,
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
        RegisterInputInfoPage(),
        RegisterAcceptTermPage(),
        MainPage(),
        Container(),
      ],
    );
  }
}
