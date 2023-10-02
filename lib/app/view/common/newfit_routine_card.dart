import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

class NewfitRoutineCard extends StatelessWidget {
  const NewfitRoutineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: Offset(0, 0),
            spreadRadius: 0.1,
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 15.w, 8.h),
            child: Row(
              children: [
                Text(
                  '월요일 루틴',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: AppFontWeights.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                  child: Icon(
                    Icons.star,
                    color: Colors.amber.shade600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                  child: newfitImage(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                  child: newfitImage(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                  child: newfitImage(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
                  child: newfitImage(),
                ),
                newfitMore(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget newfitImage() {
    return SizedBox(
      width: 50.w,
      height: 50.w,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            child: Image(
              image: const AssetImage('images/gorani.png'),
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
    );
  }

  Widget newfitMore() {
    return SizedBox(
      width: 50.w,
      height: 50.w,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: const Text(
              '2+',
              style: TextStyle(
                fontSize: 20,
                fontWeight: AppFontWeights.bold,
                color: AppColors.main,
              ),
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
    );
  }
}
