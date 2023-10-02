import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

class NewfitRoutineEquipmentListCell extends StatelessWidget {
  const NewfitRoutineEquipmentListCell({
    required this.listTitle,
    required this.minute,
    super.key,
  });

  final String listTitle;
  final int minute;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 50.w,
                    height: 50.w,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          child: const Image(
                            image: AssetImage('images/gorani.png'),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.main,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Text(
                    listTitle,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: AppFontWeights.medium,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30.w, 0),
                child: Text(
                  '$minute분',
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: AppFontWeights.regular,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
