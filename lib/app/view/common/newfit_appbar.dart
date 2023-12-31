// ignore_for_file: must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/home_my_reservation_page_controller.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/controller/routine_add_page_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_progressbar.dart';
import 'package:new_fit/app/view/common/newfit_text_field.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

import 'newfit_schedule.dart';

class NewfitAppBar extends StatelessWidget
    with StorageUtil
    implements PreferredSizeWidget {
  NewfitAppBar({
    required this.mainController,
    required this.scrollController,
    super.key,
  });

  MainController mainController;
  ScrollController scrollController;
  Rx<double> scrollPosition = 0.0.obs;
  double appBarHeight = 183.h;

  @override
  Widget build(BuildContext context) {
    Widget replaceWidget = homeAppBar();
    scrollController.addListener(_scrollListener);

    return Obx(
      () {
        if (mainController.selectedMenuCode == MenuCode.HOME) {
          replaceWidget = HomeAppBar(scrollPosition: scrollPosition.value);
          if (scrollPosition.value > 0.0) {
            appBarHeight = 105.h + MediaQuery.of(context).padding.top;
          } else {
            appBarHeight = 172.h + MediaQuery.of(context).padding.top;
          }
        } else if (mainController.selectedMenuCode == MenuCode.SCOREBOARD) {
          replaceWidget = const SafeArea(
            child: Center(
              child: NewfitTextBoldXl(
                text: AppString.str_scoreboard_title,
                textColor: AppColors.black,
              ),
            ),
          );
          appBarHeight = 50.h + MediaQuery.of(context).padding.top;
        } else if (mainController.selectedMenuCode == MenuCode.RESERVE) {
          replaceWidget = myReservationAppBar();
          appBarHeight = 160.h + MediaQuery.of(context).padding.top;
        } else if (mainController.selectedMenuCode == MenuCode.QR) {
          return const SizedBox();
        }
        return Container(
          height: appBarHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
            border: Border.all(color: AppColors.grayDisabled),
            color: AppColors.white,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
              child: replaceWidget,
            ),
          ),
        );
      },
    );
  }

  Widget homeAppBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 13.h),
        _UserInfoAppBar(
          userName: getString(AppString.key_nickname) ?? 'NULL',
          onPressedFunction: () {
            Get.toNamed(AppPages.SETTING);
          },
        ),
        if (scrollPosition.value <= 0.0) SizedBox(height: 10.h),
        if (scrollPosition.value <= 0.0)
          _UserCreditInfo(
            totalCredit: getInt(AppString.key_total_credit) ?? 0,
            todayCredit: getInt(AppString.key_this_month_credit) ?? 0,
          ),
        SizedBox(height: 10.h),
        Align(
          alignment: Alignment.center,
          child: NewfitButton(
              buttonText: AppString.button_reservation_with_routine,
              buttonColor: AppColors.main,
              onPressFuntion: () {}),
        ),
      ],
    );
  }

  Widget myReservationAppBar() {
    final HomeMyReservationPageController myReservationPageController =
        Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 13.h),
        _UserInfoAppBar(
          userName: getString(AppString.key_nickname)!,
          onPressedFunction: () {
            Get.toNamed(AppPages.SETTING);
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Obx(() {
            if (myReservationPageController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return NewfitSchedule(
              scheduleList: List.generate(
                  myReservationPageController
                      .reservationList.value.reservations.length,
                  (index) => Reservation(
                      start_at: myReservationPageController
                          .reservationList.value.reservations[index].start_at,
                      end_at: myReservationPageController
                          .reservationList.value.reservations[index].end_at)),
              startTime: myReservationPageController.startTime.value,
              endTime: myReservationPageController.endTime.value,
              selectedIndex: myReservationPageController.selectedIndex.value,
            );
          }),
        ),
        SizedBox(height: 5.h),
        Align(
          alignment: Alignment.center,
          child: NewfitButton(
              buttonText: AppString.button_reservation_with_routine,
              buttonColor: AppColors.main,
              onPressFuntion: () {}),
        ),
      ],
    );
  }

  _scrollListener() {
    scrollPosition.value = scrollController.offset;
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class HomeAppBar extends StatelessWidget with StorageUtil {
  HomeAppBar({
    required this.scrollPosition,
    super.key,
  });

  final double scrollPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 13.h),
        _UserInfoAppBar(
          userName: getString(AppString.key_nickname) ?? 'NULL',
          onPressedFunction: () {
            Get.toNamed(AppPages.SETTING);
          },
        ),
        if (scrollPosition <= 0.0) SizedBox(height: 10.h),
        if (scrollPosition <= 0.0)
          _UserCreditInfo(
            totalCredit: getInt(AppString.key_total_credit) ?? 0,
            todayCredit: getInt(AppString.key_this_month_credit) ?? 0,
          ),
        SizedBox(height: 10.h),
        Align(
          alignment: Alignment.center,
          child: NewfitButton(
              buttonText: AppString.button_reservation_with_routine,
              buttonColor: AppColors.main,
              onPressFuntion: () {}),
        ),
      ],
    );
  }
}

class NewfitAppBarElevated extends StatelessWidget
    implements PreferredSizeWidget {
  const NewfitAppBarElevated({
    super.key,
    required this.appBarTitleText,
  });

  final String appBarTitleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 25.r,
            offset: const Offset(0, 0),
          ),
        ],
        color: Colors.white,
      ),
      child: SafeArea(
        child: Center(
          child: NewfitTextBoldXl(
            text: appBarTitleText,
            textColor: AppColors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class NewfitAppBarFlat extends StatelessWidget implements PreferredSizeWidget {
  const NewfitAppBarFlat({
    super.key,
    required this.appBarTitleText,
  });

  final Widget appBarTitleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
        color: Colors.transparent,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: AppValues.margin),
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                )),
            Center(
              child: appBarTitleText,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class NewfitAppBarTranparent extends StatelessWidget
    implements PreferredSizeWidget {
  NewfitAppBarTranparent({
    super.key,
    required this.scrollController,
    required this.appBarTitleText,
  });

  final String appBarTitleText;
  ScrollController scrollController;
  Rx<double> scrollPosition = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(_scrollListener);
    int transparency = 0;
    double blurRadius = 0.0;
    double opacity = 0;

    return Obx(() {
      transparency = (scrollPosition.value).round() * 2;
      blurRadius = scrollPosition.value * 40 / 255;
      opacity = scrollPosition.value * 0.2 / 255;

      if (transparency >= 255) {
        transparency = 255;
      } else if (transparency < 0) {
        transparency = 0;
      }

      if (blurRadius >= 20) {
        blurRadius = 20;
      } else if (blurRadius < 0) {
        blurRadius = 0;
      }

      if (opacity >= 0.1) {
        opacity = 0.1;
      } else if (opacity < 0) {
        opacity = 0;
      }
      Color appBarColor = Color.fromARGB(transparency, 255, 255, 255);

      return Container(
        height: 50.h + MediaQuery.of(context).padding.top,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(opacity),
              offset: const Offset(0, 0),
              spreadRadius: 0.1,
              blurRadius: blurRadius,
            ),
          ],
          color: appBarColor,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: NewfitTextBoldXl(
                  text: appBarTitleText,
                  textColor: AppColors.black,
                ),
              ),
              Positioned(
                left: 15.w,
                child: SizedBox(
                  height: 50.h,
                  child: Column(
                    children: [
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  _scrollListener() {
    scrollPosition.value = scrollController.offset;
  }
}

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _UserInfoAppBar extends StatelessWidget with StorageUtil {
  _UserInfoAppBar({
    required this.userName,
    required this.onPressedFunction,
    super.key,
  });

  final String userName;
  final Function()? onPressedFunction;

  ImageProvider<Object>? getProfileImage() {
    String? imageUrl = getString(AppString.key_profile_file_path);

    if (imageUrl != null && isValidUrl(imageUrl)) {
      try {
        return NetworkImage(imageUrl);
      } catch (e) {
        return const AssetImage(AppString.gorani);
      }
    } else {
      return const AssetImage(AppString.gorani);
    }
  }

  bool isValidUrl(String url) {
    var pattern = r'^(?:http|ftp)s?://' // http:// or https://
        r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+' // domain
        r'(?:[A-Z]{2,6}\.?|[A-Z0-9-]{2,}\.?)|' // domain name
        r'localhost|' // localhost
        r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}|' // ...or ipv4
        r'\[?[A-F0-9]*:[A-F0-9:]+\]?)' // ...or ipv6
        r'(?::\d+)?' // optional port
        r'(?:/?|[/?]\S+)$';
    RegExp regExp = RegExp(pattern, caseSensitive: false);

    return regExp.hasMatch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.grayDisabled,
                  )),
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 7.w),
                  child: CircleAvatar(
                    backgroundColor: AppColors.main,
                    radius: 15.5.h,
                    child: CircleAvatar(
                      radius: 14.h,
                      foregroundImage: getProfileImage(),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Padding(
                  padding: EdgeInsets.only(right: 7.w),
                  child: Row(children: [
                    NewfitTextBoldXl(
                        text: "$userName님", textColor: AppColors.black),
                    SizedBox(
                      width: 3.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.grayDisabled,
                      size: 16.w,
                    ),
                  ]),
                )
              ]),
            ),
            onTap: () {
              Get.toNamed(AppPages.MY);
            }),
        const Spacer(),
        GestureDetector(
          onTap: onPressedFunction,
          child: const Icon(
            Icons.settings,
          ),
        )
      ],
    );
  }
}

class _UserCreditInfo extends StatelessWidget {
  const _UserCreditInfo({
    required this.totalCredit,
    required this.todayCredit,
  });

  final int totalCredit;
  final int todayCredit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const NewfitTextMediumMd(
              text: AppString.str_total_credit,
              textColor: AppColors.black,
            ),
            SizedBox(width: 5.w),
            NewfitTextRegularMd(
              text: '$totalCredit',
              textColor: AppColors.main,
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            const NewfitTextMediumMd(
              text: AppString.str_today_credit,
              textColor: AppColors.black,
            ),
            SizedBox(width: 5.w),
            NewfitTextRegularMd(
              text: '$todayCredit',
              textColor: AppColors.main,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Align(
          alignment: Alignment.center,
          child: NewfitProgressBar(
            progressBarHeight: 4.h,
            progressBarValue: todayCredit / 100,
          ),
        ),
      ],
    );
  }
}

class NewfitRoutineAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  NewfitRoutineAppBar(
      {super.key,
      required this.controller,
      required this.goBackFunction,
      required this.hintText});

  RoutineAddPageController controller;
  final void Function() goBackFunction;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
        color: Colors.transparent,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Center(
                child: SizedBox(
              width: 200.w,
              child: NewfitRoutineAppbarTextField(
                controller: controller.routineNameEditingController,
                hintText: hintText,
              ),
            )),
            Positioned(
              left: 15.w,
              child: SizedBox(
                height: 50.h,
                child: Column(
                  children: [
                    const Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: goBackFunction,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
