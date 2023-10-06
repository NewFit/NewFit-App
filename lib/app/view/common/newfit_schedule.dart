import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

class NewfitSchedule extends StatelessWidget {
  NewfitSchedule({
    required this.scheduleList,
    super.key,
  });
  final List scheduleList;
  DateTime currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          '${Duration(hours: currentTime.hour, minutes: currentTime.minute).inMinutes}'),
    );
  }
}

class NewfitScheduleActivatedArea extends StatelessWidget {
  const NewfitScheduleActivatedArea({
    required this.areaWidth,
    super.key,
  });

  final double areaWidth;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
