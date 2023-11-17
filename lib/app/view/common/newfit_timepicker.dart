import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_fit/app/controller/newfit_timepicker_controller.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import '../theme/app_colors.dart';
import '../theme/app_fontweight.dart';
import '../theme/app_text_theme.dart';

class NewfitTimepicker extends StatelessWidget {
  final List<Reservation> reservationList;
  final Function(DateTime, DateTime) onTimeChanged;
  final DateTime now = DateTime.now();

  NewfitTimepicker(
      {super.key, required this.reservationList, required this.onTimeChanged});

  final NewfitTimepickerController controller = NewfitTimepickerController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      onTimeChanged(controller.selectedStartTime, controller.selectedEndTime);
      return SizedBox(
        width: 300.w,
        height: 408.h,
        child: Row(
          children: [
            SizedBox(
              width: 116.w,
              height: 408.h,
              child: Stack(
                children: [
                  Obx(() => Positioned(
                        top: controller.selectedStartTimePosition,
                        right: 0,
                        child: GestureDetector(
                          onVerticalDragUpdate: (value) {
                            controller.updateSelectedStartTime(value.delta.dy);
                          },
                          child: NewfitTimepickerItem(
                            controller: controller,
                            isStart: true,
                            reservationList: reservationList,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: NewfitTimepickerGraph(
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
            ),
            SizedBox(
              width: 116.w,
              height: 408.h,
              child: Stack(
                children: [
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
      );
    });
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
      width: 64.w,
      height: 380.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 64.w,
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
                              start_at: selectedStartTime,
                              end_at: selectedEndTime),
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
              width: 64.w,
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
                  height: 8.h,
                  decoration: BoxDecoration(
                      color: AppColors.pageBackground,
                      borderRadius: BorderRadius.circular(4.r)),
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
                height: 8.h,
                decoration: BoxDecoration(
                    color: AppColors.pageBackground,
                    borderRadius: BorderRadius.circular(4.r)),
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
          timeToPosition(startTime: startTime, time: reservation.start_at);
      final double endY =
          timeToPosition(startTime: startTime, time: reservation.end_at);
      canvas.drawRect(Rect.fromLTRB(0, startY, 64.w, endY), reservedPaint);
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
        timeToPosition(startTime: startTime, time: newReservation.start_at);
    final double endY =
        timeToPosition(startTime: startTime, time: newReservation.end_at);
    canvas.drawRect(Rect.fromLTRB(0, startY, 64.w, endY), newReservationPaint);
  }

  bool isOverlapping(Reservation a, Reservation b) {
    return a.end_at.isAfter(b.start_at) && b.end_at.isAfter(a.start_at);
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
            if (!isStart)
              CustomPaint(
                painter: LeftRoundedTrianglePainter(
                    color: pickerColor(
                        time: isStart
                            ? controller.selectedStartTime
                            : controller.selectedEndTime)),
                size: Size(10.h, 10.h),
              ),
            if (!isStart) SizedBox(width: 6.w),
            Container(
              width: 90.w,
              height: 48.h,
              decoration: BoxDecoration(
                  color: pickerBackgroundColor(
                      time: isStart
                          ? controller.selectedStartTime
                          : controller.selectedEndTime),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Center(
                  child: NewfitTimeTextField(
                color: pickerTextColor(
                    time: isStart
                        ? controller.selectedStartTime
                        : controller.selectedEndTime),
                controller: controller,
                isStart: isStart,
              )),
            ),
            if (isStart) SizedBox(width: 6.w),
            if (isStart)
              CustomPaint(
                painter: RightRoundedTrianglePainter(
                    color: pickerColor(
                        time: isStart
                            ? controller.selectedStartTime
                            : controller.selectedEndTime)),
                size: Size(10.h, 10.h),
              ),
          ],
        ));
  }

  Color pickerColor({required DateTime time}) {
    bool flag = false;
    for (Reservation reservation in reservationList) {
      if ((reservation.start_at.isBefore(time) ||
              reservation.start_at.isAtSameMomentAs(time)) &&
          (reservation.end_at.isAfter(time) ||
              reservation.end_at.isAtSameMomentAs(time))) {
        flag = true;
        break;
      }
    }

    return flag ? AppColors.warning : AppColors.main;
  }

  Color pickerBackgroundColor({required DateTime time}) {
    bool flag = false;
    for (Reservation reservation in reservationList) {
      if ((reservation.start_at.isBefore(time) ||
              reservation.start_at.isAtSameMomentAs(time)) &&
          (reservation.end_at.isAfter(time) ||
              reservation.end_at.isAtSameMomentAs(time))) {
        flag = true;
        break;
      }
    }

    return flag ? AppColors.warning : AppColors.secondary;
  }

  Color pickerTextColor({required DateTime time}) {
    bool flag = false;
    for (Reservation reservation in reservationList) {
      if ((reservation.start_at.isBefore(time) ||
              reservation.start_at.isAtSameMomentAs(time)) &&
          (reservation.end_at.isAfter(time) ||
              reservation.end_at.isAtSameMomentAs(time))) {
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

class RightRoundedTrianglePainter extends CustomPainter {
  final Color color;

  RightRoundedTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double radius = size.width / 5;
    final double width = size.width * tan(pi / 3) / 2;
    final double height = size.height;

    final Path path = Path()
      ..moveTo(size.width - width, radius)
      ..quadraticBezierTo(size.width - width, 0,
          size.width - width + radius * cos(pi / 6), radius / 2)
      ..lineTo(size.width - radius * cos(pi / 6), height / 2 - radius / 2)
      ..quadraticBezierTo(size.width, height / 2,
          size.width - radius * cos(pi / 6), height / 2 + radius / 2)
      ..lineTo(size.width - width + radius * cos(pi / 6), height - radius / 2)
      ..quadraticBezierTo(
          size.width - width, height, size.width - width, height - radius)
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

class NewfitTimeTextField extends StatelessWidget {
  final NewfitTimepickerController controller;
  final bool isStart;
  final Color color;

  const NewfitTimeTextField(
      {super.key,
      required this.color,
      required this.controller,
      required this.isStart});

  @override
  Widget build(BuildContext context) {
    final DateTime originalTime =
        isStart ? controller.selectedStartTime : controller.selectedEndTime;

    final TextEditingController textEditingController = TextEditingController();
    textEditingController.text = DateFormat('HH:mm').format(originalTime);

    final FocusNode focusNode = FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        final String value = textEditingController.text;

        if (value.length < 5) {
          textEditingController.text = DateFormat('HH:mm').format(originalTime);
          return;
        }
        List<String> parts = value.split(":");
        final int newHour = int.parse(parts[0]);
        final int newMin = int.parse(parts[1]);
        if (value.isNotEmpty && newHour < 24) {
          DateTime newDateTime = DateTime(
            originalTime.year,
            originalTime.month,
            originalTime.day,
            newHour,
            newMin,
            originalTime.second,
            originalTime.millisecond,
            originalTime.microsecond,
          );

          if (isStart) {
            controller.updateSelectedStartTime(
                timeToPosition(startTime: originalTime, time: newDateTime));
            textEditingController.text =
                DateFormat('HH:mm').format(controller.selectedStartTime);
          } else {
            controller.updateSelectedEndTime(
                timeToPosition(startTime: originalTime, time: newDateTime));
            textEditingController.text =
                DateFormat('HH:mm').format(controller.selectedEndTime);
          }
        }
      }
    });

    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      inputFormatters: [TimeInputFormatter()],
      onSubmitted: (value) {
        if (value.length < 5) {
          textEditingController.text = DateFormat('HH:mm').format(originalTime);
          return;
        }
        List<String> parts = value.split(":");
        final int newHour = int.parse(parts[0]);
        final int newMin = int.parse(parts[1]);
        if (value.isNotEmpty && newHour < 24) {
          DateTime newDateTime = DateTime(
            originalTime.year,
            originalTime.month,
            originalTime.day,
            newHour,
            newMin,
            originalTime.second,
            originalTime.millisecond,
            originalTime.microsecond,
          );

          if (isStart) {
            controller.updateSelectedStartTime(
                timeToPosition(startTime: originalTime, time: newDateTime));
          } else {
            controller.updateSelectedEndTime(
                timeToPosition(startTime: originalTime, time: newDateTime));
          }
        }
      },
      decoration: InputDecoration(
        hintText: DateFormat('HH:mm').format(originalTime),
        hintStyle: TextStyle(
          color: color.withOpacity(0.5),
          fontSize: 24,
          fontWeight: AppFontWeights.bold,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        counterText: '',
      ),
      textInputAction: TextInputAction.next,
      maxLength: 5,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: AppFontWeights.bold,
      ),
    );
  }
}

class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // 숫자만 남기고 모든 비숫자 문자를 제거합니다.
    String newString = newValue.text.replaceAll(RegExp(r'\D'), '');
    int cursorPosition = newValue.selection.end;

    // 시간 형식에 맞게 문자열을 재구성합니다.
    if (newString.length > 4) {
      // 사용자가 너무 많은 숫자를 입력한 경우 마지막 숫자를 잘라냅니다.
      newString = newString.substring(0, 4);
    }

    // 콜론을 삽입하여 시간 형식을 만듭니다.
    if (newString.length > 2) {
      newString = newString.substring(0, 2) + ':' + newString.substring(2);
      // 커서 위치가 자동으로 조정되었는지 확인합니다. 만약 3번째 숫자를 입력한 경우, 커서는 콜론 뒤에 위치해야 합니다.
      if (cursorPosition == 3) {
        cursorPosition++;
      }
    }

    // 커서 위치가 텍스트의 끝을 초과하지 않도록 합니다.
    if (cursorPosition > newString.length) {
      cursorPosition = newString.length;
    }

    // 새로운 텍스트와 커서 위치로 TextEditingValue를 반환합니다.
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
