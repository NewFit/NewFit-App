import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class NewfitCircleAvatar extends StatelessWidget {
  const NewfitCircleAvatar({
    required this.radius,
    required this.nickname,
    super.key,
  });

  final double radius;
  final String nickname;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: radius,
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle),
              SizedBox(width: 5.w),
              NewfitTextBoldXl(text: nickname, textColor: AppColors.black),
            ],
          ),
        ],
      ),
    );
  }
}
