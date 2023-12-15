import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class NewfitCalendar extends StatelessWidget {
  const NewfitCalendar({
    required this.streakOnColor,
    required this.streakOffColor,
    super.key,
  });

  final Color streakOnColor;
  final Color streakOffColor;
  final EdgeInsets zeroPadding = const EdgeInsets.all(0);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2021),
      lastDay: DateTime.utc(2030),
      daysOfWeekVisible: false,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        headerPadding: EdgeInsets.fromLTRB(0, 8.w, 0, 0),
        leftChevronMargin: zeroPadding,
        leftChevronPadding: zeroPadding,
        leftChevronIcon: const Icon(
          Icons.chevron_left,
          color: AppColors.black,
        ),
        rightChevronMargin: zeroPadding,
        rightChevronPadding: zeroPadding,
        rightChevronIcon: const Icon(
          Icons.chevron_right,
          color: AppColors.black,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return Center(
            child: Text(
              "${day.month}월",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          return const SizedBox();
        },
        todayBuilder: (context, day, focusedDay) {
          Color? dotColor;

          //날짜 데이터를 받아오고, 해당 날짜에 스트릭을 수행했다면 색상을 바꿉니다.
          dotColor = streakOffColor;
          return Center(
            child: Container(
              width: 15.h,
              height: 15.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: dotColor,
              ),
            ),
          );
        },
        defaultBuilder: (context, day, focusedDay) {
          Color? dotColor;

          //날짜 데이터를 받아오고, 해당 날짜에 스트릭을 수행했다면 색상을 바꿉니다.
          dotColor = streakOnColor;
          return Center(
            child: Container(
              width: 15.h,
              height: 15.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: dotColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
