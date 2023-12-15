// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/my_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/loading.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_calendar.dart';
import 'package:new_fit/app/view/common/newfit_progressbar.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class MyPage extends BaseView<MyPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarTranparent(
      scrollController: scrollController,
      appBarTitleText: AppString.str_mypage_title,
    );
  }

  RxDouble scrollPosition = 0.0.obs;
  Color appBarColor = Colors.black;
  @override
  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  @override
  Widget pageContent(BuildContext context) {
    return SafeArea(child: body(context));
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      scrollController: scrollController,
      widgetList: [
        Stack(
          children: [
            FutureBuilder(
              future: controller.mainFuture.value,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return const Loading();
                  case ConnectionState.done:
                    if (snapshot.hasError) return Container();
                    controller.assignFutures((snapshot.data! as List));

                    return Column(
                      children: [
                        userInfoTab(),
                        SizedBox(height: 10.h),
                        routineButton(),
                        SizedBox(height: 10.h),
                        creditInfo(),
                        SizedBox(height: 10.h),
                        calendar(),
                      ],
                    );
                  case ConnectionState.none:
                    return const Loading();
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget calendar() {
    return Container(
      width: 320.w,
      height: 320.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.grayDisabled),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: const NewfitCalendar(
            streakOnColor: AppColors.main, streakOffColor: AppColors.accent),
      ),
    );
  }

  Widget creditInfo() {
    return Container(
      width: 320.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.grayDisabled),
      ),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                const NewfitTextMediumMd(
                    text: AppString.str_total_credit,
                    textColor: AppColors.black),
                const Spacer(),
                NewfitTextMediumMd(
                    text: '${controller.myPageInfo.value.total_credit}',
                    textColor: AppColors.main),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                const NewfitTextMediumMd(
                    text: AppString.str_today_credit,
                    textColor: AppColors.black),
                const Spacer(),
                NewfitTextMediumMd(
                    text:
                        '${controller.myPageInfo.value.this_month_credit ?? 0} / 100',
                    textColor: AppColors.main),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: NewfitProgressBar(
              progressBarValue:
                  (controller.myPageInfo.value.this_month_credit ?? 0) / 100,
              progressBarHeight: 6.h,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget routineButton() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPages.ROUTINE);
      },
      child: Container(
        width: 320.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.white,
          border: Border.all(color: AppColors.grayDisabled),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              const Icon(Icons.fitness_center),
              SizedBox(width: 10.w),
              const NewfitTextBoldXl(
                  text: AppString.button_my_routine,
                  textColor: AppColors.black),
            ],
          ),
        ),
      ),
    );
  }

  Widget userInfoTab() {
    return Stack(
      children: [
        SizedBox(
          height: 210.h,
          width: 360.w,
        ),
        Positioned(
          top: 75.h,
          child: Container(
            height: 135.h,
            width: 320.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.r),
                ),
                color: AppColors.white,
                border: Border.all(color: AppColors.grayDisabled)),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 76.w,
            backgroundColor: AppColors.grayDisabled,
            child: CircleAvatar(
              radius: 75.w,
              foregroundImage: NetworkImage(
                  controller.myPageInfo.value.profile_file_path ?? ''),
            ),
          ),
        ),
        Positioned(
          width: 320.w,
          top: 130.h,
          child: SizedBox(
            width: 320.w,
            child: GestureDetector(
              child: Row(
                children: [
                  const Spacer(),
                  NewfitTextBold2Xl(
                    text: controller.myPageInfo.value.nickname ?? '',
                    textColor: AppColors.black,
                  ),
                  const Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                  const Spacer(),
                ],
              ),
              onTap: () {},
            ),
          ),
        ),
        Positioned(
          top: 165.h,
          child: SizedBox(
            width: 320.w,
            child: GestureDetector(
              child: Row(
                children: [
                  const Spacer(),
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.unabledGrey,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 8.w),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          NewfitTextMediumMd(
                              text: controller
                                      .myPageInfo.value.current?.gym_name ??
                                  '',
                              textColor: AppColors.black),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
