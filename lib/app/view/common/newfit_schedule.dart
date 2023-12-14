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
  });

  final DateTime startTime;
  final DateTime endTime;
  final List<Reservation> scheduleList;

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
    DateTime currentTime = DateTime.now();
    int todaysTotalMinute =
        Duration(hours: currentTime.hour, minutes: currentTime.minute)
            .inMinutes;
    List<Widget> activatedScheduleWidget = [
      Container(
        width: 300.w,
        height: 15.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.unabledGrey,
        ),
      ),
    ];

    for (final (index, element) in scheduleList.indexed) {
    if(element.end_at.isBefore(DateTime.now())) continue;
      log('$index, $element');

      int startPosition = Duration(
                  hours: element.start_at.hour,
                  minutes: element.start_at.minute)
              .inMinutes -
          todaysTotalMinute;

      log("$index : $startPosition");

      element.end_at;
      int scheduleDuration = element.totalMinute();

      activatedScheduleWidget.add(
        _NewfitScheduleActivatedArea(
          areaWidth: scheduleDuration.toDouble(),
          startPosition: startPosition.toDouble(),
          appColor: index % 2 == 0 ? AppColors.blue200 : AppColors.blue400,
        ),
      );
    }

    return SizedBox(
      width: 320.w,
      child: Column(children: [
        Row(children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: NewfitTextRegularXs(
              text: timeToStr(startTime),
              textColor: AppColors.main,
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: NewfitTextRegularXs(
              text: timeToStr(endTime),
              textColor: AppColors.main,
            ),
          ),
        ]),
        Stack(children: activatedScheduleWidget),
      ]),
    );
  }
}

class _NewfitScheduleActivatedArea extends StatelessWidget {
  _NewfitScheduleActivatedArea({
    required this.areaWidth,
    required this.startPosition,
    required this.appColor,
    super.key,
  });

  double startPosition;
  double areaWidth;
  final Color appColor;

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
      left: startPosition.w,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: areaWidth.w * 2.5.w,
          height: 15.h,
          decoration: BoxDecoration(
            borderRadius: border,
            color: appColor,
          ),
        ),
      ),
    );
  }
}
