// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:new_fit/app/controller/my_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_calendar.dart';
import 'package:new_fit/app/view/common/newfit_progressbar.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class MyPage extends BaseView<MyPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarTranparent(
      scrollController: scrollController,
      appBarTitleText: '마이 페이지',
    );
  }

  RxDouble scrollPosition = 0.0.obs;
  Color appBarColor = Colors.black;
  @override
  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      scrollController: scrollController,
      widgetList: [
        Stack(
          children: [
            Column(
              children: [
                userInfoTab(),
                SizedBox(height: 10.h),
                routineButton(),
                SizedBox(height: 10.h),
                creditInfo(),
                SizedBox(height: 10.h),
                calendar(),
                const SizedBox(
                  height: 3000,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget calendar() {
    return Container(
      width: 320.w,
      height: 265.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
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
      ),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const Row(
              children: [
                NewfitTextMediumMd(text: '전체 크레딧', textColor: AppColors.black),
                Spacer(),
                NewfitTextMediumMd(text: '10000', textColor: AppColors.main),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const Row(
              children: [
                NewfitTextMediumMd(text: '일일 크레딧', textColor: AppColors.black),
                Spacer(),
                NewfitTextMediumMd(text: '75/100', textColor: AppColors.main),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: NewfitProgressBar(
                  progressBarValue: 0.75, progressBarHeight: 8.h)),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget routineButton() {
    return GestureDetector(
      child: Container(
        width: 320.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              const Icon(Icons.fitness_center),
              SizedBox(width: 10.w),
              const NewfitTextBold2Xl(
                  text: '마이 루틴', textColor: AppColors.black),
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
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 75.w,
          ),
        ),
        Positioned(
          width: 320.w,
          top: 130.h,
          child: SizedBox(
            width: 320.w,
            child: GestureDetector(
              child: const Row(
                children: [
                  Spacer(),
                  NewfitTextBold2Xl(
                    text: '고라니',
                    textColor: AppColors.black,
                  ),
                  Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                  Spacer(),
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
                      child: const Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          NewfitTextMediumMd(
                              text: "고라니 헬스장", textColor: AppColors.black),
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
