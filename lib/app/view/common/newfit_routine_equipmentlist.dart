import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/routine_more_info_page_controller.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

class NewfitRoutineEquipmentListCell extends StatelessWidget {
  const NewfitRoutineEquipmentListCell({
    required this.listTitle,
    required this.minute,
    required this.onDeleteFunc,
    super.key,
  });

  final String listTitle;
  final int minute;
  final void Function() onDeleteFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const Icon(Icons.drag_handle),
                ),
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
              padding: EdgeInsets.fromLTRB(0, 0, 20.w, 0),
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
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              onTap: onDeleteFunc,
              child: const Icon(
                Icons.do_disturb_on,
                color: AppColors.warning,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewfitRoutineEquipmentDetailListCell extends StatelessWidget {
  const NewfitRoutineEquipmentDetailListCell({
    required this.listTitle,
    required this.minute,
    required this.onDeleteFunc,
    required this.controller,
    super.key,
  });

  final String listTitle;
  final int minute;
  final void Function() onDeleteFunc;
  final RoutineMoreInfoPageController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 320.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
      ),
      duration: const Duration(milliseconds: 500),
      child: Row(
        children: [
          controller.editMode.value
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const Icon(Icons.drag_handle),
                )
              : const SizedBox(),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: SizedBox(
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
              padding: EdgeInsets.fromLTRB(0, 0, 20.w, 0),
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
    );
  }
}
