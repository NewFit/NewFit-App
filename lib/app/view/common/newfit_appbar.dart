// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/main/main_controller.dart';
import 'package:new_fit/app/data/model/enum/menu_code.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_progressbar.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class NewfitAppBar extends StatelessWidget implements PreferredSizeWidget {
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
          replaceWidget = homeAppBar();
          if (scrollPosition.value > 0.0) {
            appBarHeight = 105.h + MediaQuery.of(context).padding.top;
          } else {
            appBarHeight = 175.h + MediaQuery.of(context).padding.top;
          }
        } else if (mainController.selectedMenuCode == MenuCode.SCOREBOARD) {
          replaceWidget = const SafeArea(
            child: Center(
              child: NewfitTextBoldXl(
                text: "스코어보드",
                textColor: AppColors.black,
              ),
            ),
          );
          appBarHeight = 50.h + MediaQuery.of(context).padding.top;
        } else if (mainController.selectedMenuCode == MenuCode.RESERVE) {
          replaceWidget = myReservationAppBar();
          if (scrollPosition.value > 0.0) {
            appBarHeight = 105.h + MediaQuery.of(context).padding.top;
          } else {
            appBarHeight = 175.h + MediaQuery.of(context).padding.top;
          }
        }
        return Container(
          height: appBarHeight,
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
          userName: "고라니",
          onPressedFucntion: () {
            Get.toNamed(AppPages.SETTING);
          },
        ),
        if (scrollPosition.value <= 0.0) SizedBox(height: 13.h),
        if (scrollPosition.value <= 0.0)
          const _UserCreditInfo(
            totalCredit: 10000,
            todayCredit: 100,
          ),
        SizedBox(height: 15.h),
        Align(
          alignment: Alignment.center,
          child: NewfitButton(
              buttonText: "루틴으로 예약하기",
              buttonColor: AppColors.main,
              onPressFuntion: () {}),
        ),
      ],
    );
  }

  Widget myReservationAppBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 13.h),
        _UserInfoAppBar(
          userName: "고라니",
          onPressedFucntion: () {},
        ),
        if (scrollPosition.value <= 0.0) SizedBox(height: 13.h),
        if (scrollPosition.value <= 0.0)
          const _UserCreditInfo(
            totalCredit: 10000,
            todayCredit: 100,
          ),
        SizedBox(height: 15.h),
        Align(
          alignment: Alignment.center,
          child: NewfitButton(
              buttonText: "루틴으로 예약하기",
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

class NewfitAppBarWithButton extends StatelessWidget
    implements PreferredSizeWidget {
  NewfitAppBarWithButton({
    super.key,
    required this.scrollController,
    required this.totalCredit,
    required this.todayCredit,
  });

  ScrollController scrollController;
  Rx<double> scrollPosition = 0.0.obs;
  int totalCredit;
  int todayCredit;

  late Widget creditInfo =
      _UserCreditInfo(totalCredit: totalCredit, todayCredit: todayCredit);
  double appBarHeight = 183.h;

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(_scrollListener);

    return Obx(
      () {
        if (scrollPosition.value > 0.0) {
          appBarHeight = 105.h + MediaQuery.of(context).padding.top;
        } else {
          appBarHeight = 175.h + MediaQuery.of(context).padding.top;
        }
        return Container(
          height: appBarHeight,
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 13.h),
                  _UserInfoAppBar(
                    userName: "고라니",
                    onPressedFucntion: () {},
                  ),
                  if (scrollPosition.value <= 0.0) SizedBox(height: 13.h),
                  if (scrollPosition.value <= 0.0)
                    _UserCreditInfo(
                      totalCredit: totalCredit,
                      todayCredit: todayCredit,
                    ),
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.center,
                    child: NewfitButton(
                        buttonText: "루틴으로 예약하기",
                        buttonColor: AppColors.main,
                        onPressFuntion: () {}),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _scrollListener() {
    scrollPosition.value = scrollController.offset;
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
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
        color: Colors.transparent,
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

class NewfitAppBarWithSchedule extends StatelessWidget
    implements PreferredSizeWidget {
  NewfitAppBarWithSchedule({
    super.key,
  });

  double appBarHeight = 183.h;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appBarHeight,
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
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 13.h),
              _UserInfoAppBar(
                userName: "고라니",
                onPressedFucntion: () {},
              ),
              SizedBox(height: 13.h),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.center,
                child: NewfitButton(
                    buttonText: "루틴으로 예약하기",
                    buttonColor: AppColors.main,
                    onPressFuntion: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
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
              offset: Offset(0, 0),
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

class _UserInfoAppBar extends StatelessWidget {
  const _UserInfoAppBar({
    required this.userName,
    required this.onPressedFucntion,
    super.key,
  });

  final String userName;
  final Function()? onPressedFucntion;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15.h,
          backgroundImage: const AssetImage('images/gorani.png'),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
            child: NewfitTextBoldLg(
                text: "$userName님 >", textColor: AppColors.black),
            onTap: () {
              Get.toNamed(AppPages.MY);
            }),
        const Spacer(),
        GestureDetector(
          onTap: onPressedFucntion,
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
    super.key,
  });

  final int totalCredit;
  final int todayCredit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          const NewfitTextMediumMd(
            text: '전체 크레딧',
            textColor: AppColors.black,
          ),
          SizedBox(width: 5.w),
          NewfitTextRegularMd(
            text: '$totalCredit',
            textColor: AppColors.main,
          ),
        ]),
        SizedBox(height: 7.h),
        Row(
          children: [
            const NewfitTextMediumMd(
              text: '일일 크레딧',
              textColor: AppColors.black,
            ),
            SizedBox(width: 5.w),
            NewfitTextRegularMd(
              text: '$todayCredit',
              textColor: AppColors.main,
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Align(
          alignment: Alignment.center,
          child: NewfitProgressBar(
            progressBarHeight: 4.h,
            progressBarValue: 0.3,
          ),
        ),
      ],
    );
  }
}
