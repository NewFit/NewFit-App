import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  });

  ScrollController scrollController;
  Rx<double> scrollPosition = 0.0.obs;
  late Widget creditInfo =
      _UserCreditInfo(totalCredit: 10000, todayCredit: 100);
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
        creditInfo = _UserCreditInfo(totalCredit: 10000, todayCredit: 100);
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
                  _UserInfoAppBar(
                    userName: "고라니",
                    onPressedFucntion: () {},
                  ),
                  _UserCreditInfo(
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
    return Row(children: [
      CircleAvatar(
        radius: 15.h,
        backgroundImage: AssetImage('images/gorani.png'),
      ),
      SizedBox(width: 10.w),
      Text(
        "$userName님",
        style: AppTextTheme.bold_lg,
      ),
      const Spacer(),
      IconButton(
        onPressed: onPressedFucntion,
        icon: const Icon(Icons.settings),
        iconSize: 24.w,
      )
    ]);
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
        SizedBox(height: 13.h),
        Row(children: [
          Text(
            "전체 크레딧",
            style: AppTextTheme.medium_md,
          ),
          SizedBox(width: 5.w),
          Text(
            "$totalCredit",
            style: AppTextTheme.regular_md,
          ),
        ]),
        SizedBox(height: 7.h),
        Row(
          children: [
            Text(
              "일일 크레딧",
              style: AppTextTheme.medium_md,
            ),
            SizedBox(width: 5.w),
            Text(
              "$todayCredit",
              style: AppTextTheme.regular_md,
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
