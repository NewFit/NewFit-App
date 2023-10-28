import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/model/reservation_model.dart';
import '../view/theme/app_colors.dart';

class NewfitTimepickerController extends GetxController {
  final DateTime now;
  final DateTime startTime;
  final DateTime endTime;
  final RxDouble _selectedStartTimeController;
  final RxDouble _selectedEndTimeController;
  final RxBool flag = false.obs;

  NewfitTimepickerController()
      : now = DateTime.now(),
        startTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour, 0, 0),
        endTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour + 2, 1, 0),
        _selectedStartTimeController = 0.0.obs,
        _selectedEndTimeController = 20.0.obs
  {
    _selectedStartTimeController.value = timeToPosition(time: now);
    _selectedEndTimeController.value = timeToPosition(time: now.add(const Duration(minutes: 20)));
  }

  @override
  void onInit() {
    super.onInit();

    ever(_selectedStartTimeController, (_) {
      print("Selected start time has changed to $selectedStartTime");
    });
  }

  DateTime get selectedStartTime => positionToTime(value : _selectedStartTimeController.value);
  DateTime get selectedEndTime => positionToTime(value : _selectedEndTimeController.value);
  double get selectedStartTimePosition => _selectedStartTimeController.value;
  double get selectedEndTimePosition => _selectedEndTimeController.value;

  void updateSelectedStartTime(double delta) {
    final double newTime = _selectedStartTimeController.value + delta;
    if(newTime >= 0.h && newTime < _selectedEndTimeController.value) {
      _selectedStartTimeController.value = newTime;
    }
  }

  void updateSelectedEndTime(double delta) {
    final double newTime = _selectedEndTimeController.value + delta;
    if(newTime > _selectedStartTimeController.value && newTime <= 361.h) {
      _selectedEndTimeController.value = newTime;
    }
  }

  void updateTouchedTime(double newTime) {
    if(newTime > 0 && newTime <= 360.h) {
      if(newTime < _selectedStartTimeController.value) {
        _selectedStartTimeController.value = newTime;
        flag.value = false;
      } else if(newTime > _selectedEndTimeController.value) {
        _selectedEndTimeController.value = newTime;
        flag.value = true;
      } else {
        flag.value ? _selectedStartTimeController.value = newTime : _selectedEndTimeController.value = newTime;
        flag.value = !flag.value;
      }
    }
  }

  double timeToPosition({required DateTime time}) {
    final double minuteHeight = 3.h;
    return (time.difference(startTime).inMinutes) * minuteHeight;
  }

  DateTime positionToTime({required double value}) {
    final minutes = (value / 3.h).round();
    return startTime.add(Duration(minutes: minutes));
  }
}