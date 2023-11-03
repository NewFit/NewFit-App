//TODO : 테스트 페이지입니다. 삭제 예정.

import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_timepicker.dart';

import '../../data/model/json_models/reservation_model.dart';

List<Reservation> generateRandomReservations(
    DateTime nearestHour, DateTime twoHoursLater) {
  List<Reservation> reservations = [];
  Random random = Random();
  int totalPeriodInMinutes = twoHoursLater.difference(nearestHour).inMinutes;

  // 예를 들어, 5개의 예약 생성. 필요한 개수에 맞춰 조정할 수 있습니다.
  for (int i = 0; i < 4; i++) {
    int randomMinuteStart = random.nextInt(totalPeriodInMinutes);
    int randomDuration =
        random.nextInt(totalPeriodInMinutes - randomMinuteStart) +
            1; // 지속 시간은 최소 1분 이상이어야 합니다.

    DateTime start = nearestHour.add(Duration(minutes: randomMinuteStart));
    DateTime end = start.add(Duration(minutes: randomDuration));

    reservations.add(Reservation(start_at: start, end_at: end));
  }

  return reservations;
}

final DateTime now = DateTime.now();
final DateTime startTime =
    DateTime(now.year, now.month, now.day, now.hour, 0, 0);
final DateTime endTime = startTime.add(const Duration(hours: 2));

class TestPage extends StatelessWidget {
  final reservationList = generateRandomReservations(startTime, endTime);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BaseBody(
            widgetList: [
              NewfitTimepicker(
                reservationList: reservationList,
                onTimeChanged: (DateTime start, DateTime end) {
                  dev.log("$start");
                  dev.log("$end");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
