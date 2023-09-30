import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

class NewfitEquipmentListCell extends StatelessWidget {
  const NewfitEquipmentListCell({
    required this.equipmentTitle,
    this.imageRoute = 'images/gorani.png',
    required this.currentStatus,
    super.key,
  });

  final String equipmentTitle;
  final String imageRoute;
  final int currentStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8.h, 0, 0),
      child: Container(
        width: 320.w,
        height: 60.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                offset: const Offset(0, 0),
                spreadRadius: 0.1,
                blurRadius: 20,
              ),
            ]),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(width: 3.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image(
                      width: 64.w,
                      height: 50.h,
                      image: AssetImage('images/gorani.png'),
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Text(
                    "gorani",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 0),
                child: Row(
                  children: [
                    Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        color: AppColors.main,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      '예약가능',
                      style: TextStyle(
                        color: AppColors.main,
                        fontWeight: AppFontWeights.extrabold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
