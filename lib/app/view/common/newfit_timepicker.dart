import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_fit/app/controller/newfit_timepicker_controller.dart';

import '../../data/model/reservation_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_theme.dart';

class NewfitTimepicker extends StatelessWidget {
  final List<Reservation> reservationList;
  final DateTime now = DateTime.now();

  NewfitTimepicker({super.key, required this.reservationList});

  final NewfitTimepickerController controller = NewfitTimepickerController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          width: 300.w,
          height: 408.h,
          child: Row(
            children: [
              NewfitTimepickerGraph(
                startTime: controller.startTime,
                endTime: controller.endTime,
                reservationList: reservationList,
                selectedStartTime: controller.selectedStartTime,
                selectedEndTime: controller.selectedEndTime,
                onHeightTapped: (double value) {
                  dev.log('$value');
                  controller.updateTouchedTime(value);
                },
              ),
              SizedBox(
                width: 200.w,
                height: 408.h,
                child: Stack(
                  children: [
                    Obx(() => Positioned(
                          top: controller.selectedStartTimePosition,
                          // Update the widget position based on widgetTop value
                          left: 0,
                          child: GestureDetector(
                            onVerticalDragUpdate: (value) {
                              controller
                                  .updateSelectedStartTime(value.delta.dy);
                            },
                            child: NewfitTimepickerItem(
                              controller: controller,
                              isStart: true,
                              reservationList: reservationList,
                            ),
                          ),
                        )),
                    Obx(() => Positioned(
                          top: controller.selectedEndTimePosition,
                          // Update the widget position based on widgetTop value
                          left: 0,
                          child: GestureDetector(
                            onVerticalDragUpdate: (value) {
                              controller.updateSelectedEndTime(value.delta.dy);
                            },
                            child: NewfitTimepickerItem(
                              controller: controller,
                              isStart: false,
                              reservationList: reservationList,
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class NewfitTimepickerGraph extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final List<Reservation> reservationList;
  final DateTime selectedStartTime;
  final DateTime selectedEndTime;
  final Function(double) onHeightTapped;

  const NewfitTimepickerGraph(
      {super.key,
      required this.startTime,
      required this.endTime,
      required this.reservationList,
      required this.selectedStartTime,
      required this.selectedEndTime,
      required this.onHeightTapped});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 380.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 80.w,
              height: 360.h,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: ReservationPainter(
                          reservationList: reservationList,
                          startTime: startTime,
                          endTime: endTime),
                    ),
                    CustomPaint(
                      painter: NewReservationPainter(
                          reservationList: reservationList,
                          newReservation: Reservation(
                              startAt: selectedStartTime,
                              endAt: selectedEndTime),
                          startTime: startTime,
                          endTime: endTime),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 80.w,
              height: 363.h,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.main,
                    width: 1.5.h,
                  ),
                  borderRadius: BorderRadius.circular(8.r)),
            ),
          ),
          Positioned(
            top: 3.h,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Container(
                  height: 7.2.h,
                  color: AppColors.pageBackground,
                  child: NewfitTextRegularXs(
                    text: timeToStr(startTime),
                    textColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 3.h,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: NewfitTextRegularXs(
                  text: timeToStr(startTime),
                  textColor: AppColors.main,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 3.h,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 7.2.h,
                color: AppColors.pageBackground,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: NewfitTextRegularXs(
                    text: timeToStr(endTime),
                    textColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 3.h,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: NewfitTextRegularXs(
                  text: timeToStr(endTime),
                  textColor: AppColors.main,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTapDown: (TapDownDetails details) {
              final positionInContainer = details.localPosition;
              final tappedHeight = positionInContainer.dy;

              if (tappedHeight < 10.h || tappedHeight > 370.h) return;

              onHeightTapped(tappedHeight);
            },
          )
        ],
      ),
    );
  }

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
}

// 이미 예약되어있는 부분 회색 영역으로 표시하는 페인터
class ReservationPainter extends CustomPainter {
  final List<Reservation> reservationList;
  final DateTime startTime;
  final DateTime endTime;

  ReservationPainter({
    required this.reservationList,
    required this.startTime,
    required this.endTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint reservedPaint = Paint()..color = AppColors.unabledGrey;

    for (Reservation reservation in reservationList) {
      final double startY =
          timeToPosition(startTime: startTime, time: reservation.startAt);
      final double endY =
          timeToPosition(startTime: startTime, time: reservation.endAt);
      canvas.drawRect(Rect.fromLTRB(0, startY, 80.w, endY), reservedPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// 선택된 영역을 표시하는 페인터
class NewReservationPainter extends CustomPainter {
  final List<Reservation> reservationList;
  final Reservation newReservation;
  final DateTime startTime;
  final DateTime endTime;

  NewReservationPainter({
    required this.reservationList,
    required this.newReservation,
    required this.startTime,
    required this.endTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    bool overlapped = false;
    for (Reservation reservation in reservationList) {
      if (isOverlapping(reservation, newReservation)) {
        overlapped = true;
        break;
      }
    }
    final Paint newReservationPaint = Paint()
      ..color =
          overlapped ? AppColors.warning.withOpacity(0.5) : AppColors.secondary;

    final double startY =
        timeToPosition(startTime: startTime, time: newReservation.startAt);
    final double endY =
        timeToPosition(startTime: startTime, time: newReservation.endAt);
    canvas.drawRect(Rect.fromLTRB(0, startY, 80.w, endY), newReservationPaint);
  }

  bool isOverlapping(Reservation a, Reservation b) {
    return a.endAt.isAfter(b.startAt) && b.endAt.isAfter(a.startAt);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// picker 위젯
class NewfitTimepickerItem extends StatelessWidget {
  final bool isStart;
  final List<Reservation> reservationList;
  final NewfitTimepickerController controller;

  const NewfitTimepickerItem(
      {super.key,
      required this.controller,
      required this.isStart,
      required this.reservationList});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            CustomPaint(
              painter: LeftRoundedTrianglePainter(
                  color: pickerColor(
                      time: isStart
                          ? controller.selectedStartTime
                          : controller.selectedEndTime)),
              size: Size(18.h, 18.h),
            ),
            SizedBox(width: 20.w),
            Container(
              width: 130.w,
              height: 48.h,
              decoration: BoxDecoration(
                  color: pickerBackgroundColor(
                      time: isStart
                          ? controller.selectedStartTime
                          : controller.selectedEndTime),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Center(
                  child: NewfitTextBold2Xl(
                text: isStart
                    ? DateFormat('HH:mm').format(controller.selectedStartTime)
                    : DateFormat('HH:mm').format(controller.selectedEndTime),
                textColor: pickerTextColor(
                    time: isStart
                        ? controller.selectedStartTime
                        : controller.selectedEndTime),
              )),
            )
          ],
        ));
  }

  Color pickerColor({required DateTime time}) {
    bool flag = false;
    for (Reservation reservation in reservationList) {
      if ((reservation.startAt.isBefore(time) ||
              reservation.startAt.isAtSameMomentAs(time)) &&
          (reservation.endAt.isAfter(time) ||
              reservation.endAt.isAtSameMomentAs(time))) {
        flag = true;
        break;
      }
    }

    return flag ? AppColors.warning : AppColors.main;
  }

  Color pickerBackgroundColor({required DateTime time}) {
    bool flag = false;
    for (Reservation reservation in reservationList) {
      if ((reservation.startAt.isBefore(time) ||
              reservation.startAt.isAtSameMomentAs(time)) &&
          (reservation.endAt.isAfter(time) ||
              reservation.endAt.isAtSameMomentAs(time))) {
        flag = true;
        break;
      }
    }

    return flag ? AppColors.warning : AppColors.secondary;
  }

  Color pickerTextColor({required DateTime time}) {
    bool flag = false;
    for (Reservation reservation in reservationList) {
      if ((reservation.startAt.isBefore(time) ||
              reservation.startAt.isAtSameMomentAs(time)) &&
          (reservation.endAt.isAfter(time) ||
              reservation.endAt.isAtSameMomentAs(time))) {
        flag = true;
        break;
      }
    }

    return flag ? AppColors.white : AppColors.textBlack;
  }
}

class LeftRoundedTrianglePainter extends CustomPainter {
  final Color color;

  LeftRoundedTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double radius = size.width / 5;
    final double width = size.width * tan(pi / 3) / 2;
    final double height = size.height;

    final Path path = Path()
      ..moveTo(width, radius)
      ..quadraticBezierTo(width, 0, width - radius * cos(pi / 6), radius / 2)
      ..lineTo(radius * cos(pi / 6), height / 2 - radius / 2)
      ..quadraticBezierTo(
          0, height / 2, radius * cos(pi / 6), height / 2 + radius / 2)
      ..lineTo(width - radius * cos(pi / 6), height - radius / 2)
      ..quadraticBezierTo(width, height, width, height - radius)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate is LeftRoundedTrianglePainter &&
        oldDelegate.color != color;
  }
}

double timeToPosition({required DateTime startTime, required DateTime time}) {
  final double minuteHeight = 3.h;

  return (time.difference(startTime).inMinutes) * minuteHeight;
}
