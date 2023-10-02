import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

class NewfitFAB extends StatelessWidget {
  const NewfitFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: Offset(0, 0),
            spreadRadius: 0.1,
            blurRadius: 20,
          )
        ],
      ),
      child: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 0,
        highlightElevation: 0.2,
        label: Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.black,
              fill: 1,
              weight: 900,
            ),
            Text(
              '루틴 추가',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: AppFontWeights.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
