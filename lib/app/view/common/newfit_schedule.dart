import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/data/model/reservation_model.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class NewfitSchedule extends StatelessWidget {
  NewfitSchedule({
    required this.scheduleList,
    super.key,
  });
  final List<Reservation> scheduleList;

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    int todaysTotalMinute =
        Duration(hours: currentTime.hour, minutes: currentTime.minute)
            .inMinutes;
    List<Widget> activatedScheduleWidget = [
      Container(
        width: 320.w,
        height: 15.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.unabledGrey,
        ),
      ),
    ];

    for (final (index, element) in scheduleList.indexed) {
      int startPosition =
          Duration(hours: element.startAt.hour, minutes: element.startAt.minute)
                  .inMinutes -
              todaysTotalMinute;

      element.endAt;
      int scheduleDuration = element.totalMinute();

      activatedScheduleWidget.add(
        _NewfitScheduleActivatedArea(
          areaWidth: scheduleDuration.toDouble(),
          startPosition: startPosition.toDouble(),
          appColor: index % 2 == 0 ? AppColors.blue200 : AppColors.blue400,
        ),
      );
    }

    return Stack(children: activatedScheduleWidget);
  }
}

class _NewfitScheduleActivatedArea extends StatelessWidget {
  const _NewfitScheduleActivatedArea({
    required this.areaWidth,
    required this.startPosition,
    required this.appColor,
    super.key,
  });

  final double startPosition;
  final double areaWidth;
  final Color appColor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: startPosition,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: areaWidth,
          height: 15.h,
          decoration: BoxDecoration(
            color: appColor,
          ),
        ),
      ),
    );
  }
}
