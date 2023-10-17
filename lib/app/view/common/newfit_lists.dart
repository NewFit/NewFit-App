import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class NewfitSearchListCell extends StatelessWidget {
  NewfitSearchListCell({
    required this.gymTitleText,
    required this.gymLocationText,
    super.key,
  });

  final String gymTitleText;
  final String gymLocationText;
  Rx<bool> toggled = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: Obx(() {
        return GestureDetector(
          child: Container(
            width: double.infinity,
            height: toggled.value ? 100.h : 56.h,
            decoration: const BoxDecoration(color: AppColors.white),
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
                  toggled.value
                      ? Container(
                          height: 30,
                          decoration: BoxDecoration(color: Colors.red),
                        )
                      : SizedBox(),
                  const Spacer(),
                ],
              ),
            ),
          ),
          onTap: () {
            toggled.value = !toggled.value;
          },
        );
      }),
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
        width: double.infinity,
        height: 56.h,
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(30.w, 0, 25.w, 0),
                child: NewfitTextMediumMd(
                    text: "$rank", textColor: AppColors.black)),
            CircleAvatar(), // NewfitCircleAvatar 로 변경될 예정
            const Spacer(),
            NewfitTextMediumMd(
              text: userNickName,
              textColor: AppColors.black,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 40.w, 0),
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
        decoration: BoxDecoration(
          color: AppColors.white,
        ),
        child: Column(children: [
          NewfitTextRegularLg(
            text: settingTitle,
            textColor: AppColors.black,
          ),
        ]),
      ),
      onTap: () {},
    );
  }
}
