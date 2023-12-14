import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/common/newfit_dropdown_menu.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

class NewfitRoutineCard extends StatelessWidget {
  const NewfitRoutineCard({
    required this.routineName,
    required this.equipmentCount,
    required this.routineDropdownChoiceAction,
    super.key,
  });

  final String routineName;
  final int equipmentCount;
  final void Function(String) routineDropdownChoiceAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 10.h, 15.w, 8.h),
            child: Row(
              children: [
                Text(
                  routineName,
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
                NewfitDropDownMenu(
                  routineDropdownChoiceAction: routineDropdownChoiceAction,
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
                newfitMore(equipmentCount),
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
    );
  }

  Widget newfitMore(int equipmentCount) {
    return SizedBox(
      width: 50.w,
      height: 50.w,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              equipmentCount >= 4 ? '${equipmentCount - 3}+' : '',
              style: const TextStyle(
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
