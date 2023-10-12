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
  const NewfitScoreboardListCell({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NewfitSettingListCell extends StatelessWidget {
  const NewfitSettingListCell({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
