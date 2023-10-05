import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class NewfitProgressBar extends StatelessWidget {
  const NewfitProgressBar({
    required this.progressBarValue,
    required this.progressBarHeight,
    super.key,
  });

  final double progressBarValue;
  final double progressBarHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(8.r),
        minHeight: progressBarHeight,
        backgroundColor: Colors.grey[400],
        color: AppColors.main,
        value: progressBarValue,
      ),
    );
    ;
  }
}
