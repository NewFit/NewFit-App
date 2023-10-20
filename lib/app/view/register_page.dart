import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/register_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/newfit_page_indicator_dot.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

class RegisterPage extends BaseView<RegisterPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize:
          Size.fromHeight(120.h + MediaQuery.of(context).padding.top),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: AppColors.textUnabled,
                size: 28.h,
              ),
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
            SizedBox(height: 50.h),
            Obx(
              () {
                if (controller.currentTabIndex == 0) {}

                return SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      NewfitPageIndicatorDot(
                          currentTabIndex: controller.currentTabIndex,
                          targetTabIndex: 0,
                          position: 20),
                      NewfitPageIndicatorDot(
                          currentTabIndex: controller.currentTabIndex,
                          targetTabIndex: 1,
                          position: 60),
                      NewfitPageIndicatorDot(
                          currentTabIndex: controller.currentTabIndex,
                          targetTabIndex: 2,
                          position: 100),
                    ],
                  ),
                );
              },
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
              child: Text(
                '',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: AppFontWeights.extrabold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.tabController,
      children: [
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }
}
