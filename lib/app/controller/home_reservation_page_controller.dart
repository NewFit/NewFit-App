import 'dart:math';

import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_model.dart';

class HomeReservationPageController extends BaseController {
  //final RxList<Reservation> reservations = ;
  final Rx<DateTime> startTime = DateTime.now().obs;
  final Rx<DateTime> endTime = DateTime.now().obs;

  List<Reservation> generateRandomReservations(
      DateTime nearestHour, DateTime twoHoursLater) {
    List<Reservation> reservations = [];
    Random random = Random();
    int totalPeriodInMinutes = twoHoursLater.difference(nearestHour).inMinutes;

    for (int i = 0; i < 4; i++) {
      int randomMinuteStart = random.nextInt(totalPeriodInMinutes);
      int randomDuration =
          random.nextInt(totalPeriodInMinutes - randomMinuteStart) + 1;

      DateTime start = nearestHour.add(Duration(minutes: randomMinuteStart));
      DateTime end = start.add(Duration(minutes: randomDuration));

      reservations.add(Reservation(start_at: start, end_at: end));
    }

    return reservations;
  }
}
