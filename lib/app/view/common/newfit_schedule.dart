// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class NewfitSchedule extends StatelessWidget {
  const NewfitSchedule({
    required this.scheduleList,
    super.key,
    required this.startTime,
    required this.endTime,
    required this.selectedIndex,
  });

  final DateTime startTime;
  final DateTime endTime;
  final List<Reservation> scheduleList;
  final int selectedIndex;

  String timeToStr(DateTime time) {
    if (time.hour == 0) return '자정';
    if (time.hour == 12) return '정오';

    if (time.hour > 0 && time.hour < 12) {
      return '오전 ${time.hour}시';
    } else if (time.hour > 12 && time.hour < 24) {
      return '오후 ${time.hour - 12}시';
    }

    return '에러';
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> activatedScheduleWidget = [
      Container(
        width: 300.w,
        height: 15.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.unabledGrey,
          border: Border.all(
            color: AppColors.grayDisabled,
          ),
        ),
      ),
    ];

    for (final (index, element) in scheduleList.indexed) {
      if (element.end_at.isBefore(DateTime.now())) continue;
      log('$index, $element');

      double startPosition =
          element.start_at.difference(startTime).inMinutes * 2.5.w;

      log("$index : $startPosition");

      double scheduleDuration = element.totalMinute() * 2.5.w;

      log(element.totalMinute().toString());

      activatedScheduleWidget.add(
        _NewfitScheduleActivatedArea(
          areaWidth: scheduleDuration,
          startPosition: startPosition,
          appColor: index % 2 == 0 ? AppColors.blue200 : AppColors.blue400,
          checked: selectedIndex == index,
        ),
      );
    }

    return Center(
      child: SizedBox(
        width: 320.w,
        child: Column(children: [
          Row(children: [
            NewfitTextRegularXs(
              text: timeToStr(startTime),
              textColor: AppColors.textUnabled,
            ),
            const Spacer(),
            NewfitTextRegularXs(
              text: timeToStr(endTime),
              textColor: AppColors.textUnabled,
            ),
          ]),
          SizedBox(
            height: 3.h,
          ),
          Stack(children: activatedScheduleWidget),
        ]),
      ),
    );
  }
}

class _NewfitScheduleActivatedArea extends StatelessWidget {
  _NewfitScheduleActivatedArea({
    required this.areaWidth,
    required this.startPosition,
    required this.appColor,
    required this.checked,
  });

  double startPosition;
  double areaWidth;
  final Color appColor;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    BorderRadius border = BorderRadius.only(
      topLeft: Radius.circular(0.r),
      bottomLeft: Radius.circular(0.r),
      topRight: Radius.circular(0.r),
      bottomRight: Radius.circular(0.r),
    );

    if (startPosition <= 0) {
      areaWidth += startPosition;
      startPosition = 0;
      border = BorderRadius.only(
        topLeft: Radius.circular(4.r),
        bottomLeft: Radius.circular(4.r),
        topRight: Radius.circular(0.r),
        bottomRight: Radius.circular(0.r),
      );
    }

    if (startPosition + areaWidth * 2.5.w >= 300.w) {
      areaWidth -= (startPosition + areaWidth) - 300.w;
      border = BorderRadius.only(
        topLeft: Radius.circular(0.r),
        bottomLeft: Radius.circular(0.r),
        topRight: Radius.circular(4.r),
        bottomRight: Radius.circular(4.r),
      );
    }
    return Positioned(
      left: startPosition,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: areaWidth,
          height: 15.h,
          decoration: BoxDecoration(
            borderRadius: border,
            border: Border.all(
                color: checked ? AppColors.main : Colors.transparent,
                width: 2.w),
            color: appColor,
          ),
        ),
      ),
    );
  }
}
