import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_model.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

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
        width: 300.w,
        height: 15.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppColors.unabledGrey,
        ),
      ),
    ];

    for (final (index, element) in scheduleList.indexed) {
      int startPosition = Duration(
                  hours: element.start_at.hour,
                  minutes: element.start_at.minute)
              .inMinutes -
          todaysTotalMinute;

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
          NewfitTextRegularXs(
            text: "${DateFormat('h:mm').format(DateTime.now())}",
            textColor: AppColors.unabledGrey,
          ),
          Spacer(),
          NewfitTextRegularXs(
            text: "오후 4시",
            textColor: AppColors.unabledGrey,
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

  final double startPosition;
  double areaWidth;
  final Color appColor;

  @override
  Widget build(BuildContext context) {
    BorderRadius border = BorderRadius.only(
      topLeft: Radius.circular(4.r),
      bottomLeft: Radius.circular(4.r),
      topRight: Radius.circular(4.r),
      bottomRight: Radius.circular(4.r),
    );

    if (startPosition <= 5) {
      border = BorderRadius.only(
        topLeft: Radius.circular(4.r),
        bottomLeft: Radius.circular(4.r),
      );
    }

    if (startPosition + areaWidth * 2.5 >= 320) {
      areaWidth -= (startPosition + areaWidth) - 320;
      border = BorderRadius.only(
        topRight: Radius.circular(4.r),
        bottomRight: Radius.circular(4.r),
      );
    }
    return Positioned(
      left: startPosition.w,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: areaWidth.w * 2.5,
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
