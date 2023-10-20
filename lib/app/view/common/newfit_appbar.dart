import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_progressbar.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

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

    return Obx(() {
      if (scrollPosition.value > 0.0) {
        appBarHeight = 105.h + MediaQuery.of(context).padding.top;
        creditInfo = const SizedBox();
      } else {
        appBarHeight = 175.h + MediaQuery.of(context).padding.top;
        creditInfo =
            _UserCreditInfo(totalCredit: totalCredit, todayCredit: todayCredit);
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
                  )
                ],
              ),
            ),
          ));
    });
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
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 15.h,
            backgroundImage: AssetImage('images/gorani.png'),
          ),
          SizedBox(width: 10.w),
          NewfitTextBoldLg(text: "$userName님", textColor: AppColors.black),
          const Spacer(),
          GestureDetector(
            onTap: onPressedFucntion,
            child: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
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
          NewfitTextMediumMd(
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
            NewfitTextMediumMd(
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
