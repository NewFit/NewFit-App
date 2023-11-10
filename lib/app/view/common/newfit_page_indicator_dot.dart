// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class NewfitPageIndicatorDot extends StatelessWidget {
  NewfitPageIndicatorDot({
    required this.currentTabIndex,
    required this.targetTabIndex,
    required this.position,
    this.activeColor,
    this.disabledColor,
    super.key,
  });

  final RxInt currentTabIndex;
  final int targetTabIndex;
  final double position;
  Color? activeColor = AppColors.main;
  Color? disabledColor = AppColors.secondary;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: currentTabIndex.value == targetTabIndex ? 0 : 1.h,
      left: position,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      child: AnimatedContainer(
        height: currentTabIndex.value == targetTabIndex ? 12.h : 10.h,
        width: currentTabIndex.value == targetTabIndex ? 12.h : 10.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: currentTabIndex.value == targetTabIndex
              ? AppColors.main
              : AppColors.secondary,
        ),
        duration: const Duration(milliseconds: 300),
      ),
    );
  }
}
