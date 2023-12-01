// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class NewfitSearchListCell extends StatelessWidget {
  NewfitSearchListCell({
    required this.gymTitleText,
    required this.gymLocationText,
    required this.onTapFunction,
    required this.toggled,
    required this.toggledColor,
    super.key,
  });

  final String gymTitleText;
  final String gymLocationText;
  final Function() onTapFunction;
  final Color toggledColor;
  Rx<bool> toggled = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: GestureDetector(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 56.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: toggledColor,
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 2.w,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    NewfitTextMediumMd(
                      text: gymTitleText,
                      textColor: AppColors.black,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 12.w,
                          color: AppColors.textUnabled,
                        ),
                        NewfitTextRegularMd(
                          text: gymLocationText,
                          textColor: AppColors.textUnabled,
                        )
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          toggled.value = !toggled.value;
          onTapFunction();
        },
      ),
    );
  }
}

class NewfitScoreboardListCell extends StatelessWidget {
  const NewfitScoreboardListCell({
    required this.rank,
    required this.userNickName,
    required this.credit,
    required this.image,
    super.key,
  });

  final int rank;
  final String userNickName;
  final int credit;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 320.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 25.w, 0),
                child: NewfitTextMediumMd(
                    text: "$rank", textColor: AppColors.black)),
            const CircleAvatar(), // NewfitCircleAvatar 로 변경될 예정
            const Spacer(),
            NewfitTextMediumMd(
              text: userNickName,
              textColor: AppColors.black,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20.w, 0),
              child: NewfitTextRegularMd(
                  text: "$credit credit", textColor: AppColors.textUnabled),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

class NewfitSettingListCell extends StatelessWidget {
  const NewfitSettingListCell({
    required this.settingTitle,
    super.key,
  });

  final String settingTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 40.h,
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
              child: NewfitTextRegularLg(
                text: settingTitle,
                textColor: AppColors.black,
              ),
            ),
            const Spacer(),
            const Divider(
              height: 0,
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

class NewfitToggleList extends StatelessWidget {
  const NewfitToggleList({
    required this.toggleText,
    required this.checked,
    super.key,
  });

  final String toggleText;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: checked ? AppColors.main : AppColors.unabledGrey,
              size: 24.h,
            ),
            SizedBox(
              width: 5.h,
            ),
            NewfitTextMediumMd(
              text: toggleText,
              textColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
