import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_fit/app/controller/home_my_reservation_page_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/services/network_service/equipment_service.dart';
import 'package:new_fit/app/services/network_service/reservation_service.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ReservationModalController with StorageUtil {
  ReservationModalController({
    required this.equipmentId,
    required this.equipmentGymId,
  }) {
    dio.interceptors.add(prettyDioLogger);
    loadIdenticalEquipments();
    loadEquipmentSpecification();

    if (startTime.value.minute % 5 != 0) {
      startTime.value = startTime.value
          .add(Duration(minutes: 5 - startTime.value.minute % 5));
    }
    endTime.value = startTime.value.add(const Duration(hours: 2, minutes: 30));
    chosenStartTime.value = startTime.value;
    chosenEndTime.value = startTime.value;
  }

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
  final Dio dio = Dio();
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 80,
  );

  TextEditingController textEditingController = TextEditingController();
  final HomeMyReservationPageController _myReservationPageController =
      Get.find();

  var equipmentList = Rx<EquipmentList?>(null);
  var equipmentSpec = Rx<EquipmentSpec?>(null);

  final Rx<int> selectedIndex = 0.obs;
  final Rx<int> duration = 0.obs;
  final RxList<bool> buttonPressed = List.generate(6, (index) => false).obs;
  final RxList<DurationSet> occupiedTimes =
      List<DurationSet>.empty(growable: true).obs;
  final RxList<bool> occupiedTimes2 =
      List<bool>.generate(30, (index) => false).obs;
  final Rx<DateTime> initialStartTime = DateTime.now().obs;
  final Rx<DateTime> initialEndTime =
      DateTime.now().add(const Duration(hours: 2, minutes: 30)).obs;
  final Rx<DateTime> startTime = DateTime.now().obs;
  final Rx<DateTime> endTime = DateTime.now().obs;
  final Rx<DateTime> chosenStartTime = DateTime.now().obs;
  final Rx<DateTime> chosenEndTime = DateTime.now().obs;
  Rx<double> positionX = 0.0.obs;

  final List<int> indexMap = [];
  int indicatorIndex = 0;
  final int equipmentId;
  int equipmentGymId;

  void updateButtonPressed(int index) {
    buttonPressed.value = List.generate(6, (index) => false);
    buttonPressed[index] = true;
    duration.value = (index + 1) * 5;
    chosenEndTime.value =
        chosenStartTime.value.add(Duration(minutes: duration.value));
  }

  void loadIdenticalEquipments() async {
    try {
      final token =
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
      final authorityId = getInt(AppString.key_authority_id);

      if (authorityId != null) {
        var equipments = await EquipmentService(dio)
            .getIdenticalEquipments(authorityId, token, equipmentId);

        for (int i = 0; i < equipments.equipments_count!; i++) {
          indexMap.add(equipments.equipments![i].equipment_gym_id);
          if (equipments.equipments![i].equipment_gym_id == equipmentGymId) {
            selectedIndex.value = i;
          }
        }
        equipmentList.value = equipments;
      }
    } catch (error) {
      print('loadIdentical error');
    }
  }

  Future<void> loadEquipmentSpecification() async {
    final token =
        '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
    final authorityId = getInt(AppString.key_authority_id);

    try {
      if (authorityId != null) {
        var equipment = await EquipmentService(dio)
            .getEquipmentSpecification(authorityId, token, equipmentGymId);
        equipmentSpec.value = equipment;
        reservationInfo();
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 500) {
          UserService(dio)
              .renewAccessToken(getString(AppString.key_refresh_token) ?? '');
          var equipment = await EquipmentService(dio)
              .getEquipmentSpecification(authorityId!, token, equipmentGymId);
          equipmentSpec.value = equipment;
          reservationInfo();
        }
      }
    }
  }

  void reservationInfo() {
    DateTime endTime = initialStartTime.value;

    for (final Reservation reservation
        in equipmentSpec.value?.occupied_times ?? []) {
      Duration reservationDuration =
          reservation.end_at.difference(reservation.start_at);
      Duration durationAboutInitialStart =
          initialStartTime.value.difference(reservation.start_at);
      Duration durationAboutInitialEnd =
          initialEndTime.value.difference(reservation.start_at);

      if (initialStartTime.value.isAfter(reservation.start_at) &&
          durationAboutInitialStart < reservationDuration) {
        occupiedTimes.add(DurationSet(
            duration: reservationDuration -
                initialStartTime.value.difference(reservation.start_at),
            gap: false));
        endTime = reservation.end_at;
      }
      if (initialStartTime.value.isBefore(reservation.start_at) &&
          initialEndTime.value.isAfter(reservation.start_at)) {
        int indexOffset = durationAboutInitialStart.inMinutes ~/ 5;
        int durations = reservationDuration.inMinutes ~/ 5;

        occupiedTimes.add(DurationSet(
          duration: reservation.start_at.difference(endTime),
          gap: true,
        ));

        if (durationAboutInitialEnd < reservationDuration) {
          occupiedTimes.add(DurationSet(
            duration: durationAboutInitialEnd,
            gap: false,
          ));
          for (int i = indexOffset; i < indexOffset + durations; i++) {
            occupiedTimes2[i] = true;
          }
        } else {
          occupiedTimes.add(DurationSet(
            duration: reservationDuration,
            gap: false,
          ));
          for (int i = indexOffset; i < indexOffset + durations; i++) {
            if (i >= 30) break;
            occupiedTimes2[i] = true;
          }
        }
      }
    }
  }

  void selectNewSpec(int index) async {
    selectedIndex(index);
    equipmentGymId = indexMap[index];
    loadEquipmentSpecification();
  }

  void equipmentReservation() async {
    final start =
        DateFormat(AppString.date_format_hh_mm).format(chosenStartTime.value);
    final end =
        DateFormat(AppString.date_format_hh_mm).format(chosenEndTime.value);

    try {
      final token =
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
      final authorityId = getInt(AppString.key_authority_id);

      if (authorityId != null) {
        ReservationService(dio).reserveEquipment(
          authorityId,
          token,
          equipmentGymId,
          Reservation(
            start_at: DateTime.parse(start),
            end_at: DateTime.parse(end),
          ),
        );

        await Future.delayed(const Duration(milliseconds: 300));
        _myReservationPageController.specificReservationList.clear();
        _myReservationPageController.loadMyReservationList();
      } else {}
    } catch (e) {}

    Get.back();
    Get.snackbar(AppString.snackbar_check_reservation, '$start ~ $end');
  }
}

class DurationSet {
  DurationSet({
    required this.duration,
    required this.gap,
  });

  Duration duration;
  bool gap;
}
