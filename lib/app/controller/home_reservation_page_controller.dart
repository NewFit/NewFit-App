import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/services/network_service/equipment_service.dart';
import 'package:new_fit/app/services/network_service/reservation_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../view/theme/app_string.dart';

class HomeReservationPageController extends BaseController with StorageUtil {
  final Dio dio = Dio();
  late final EquipmentService service;
  late final ReservationService reservationService;

  var equipmentList = Rx<EquipmentList?>(null);
  var isLoading = true.obs;
  var equipmentSpec = Rx<EquipmentSpec?>(null);
  var isLoadingInSpec = true.obs;

  final List<int> indexMap = []; // inx : inx, val : gymId
  final RxInt selectedIndex = 0.obs;

  final Rx<DateTime> startTime = DateTime.now().obs;
  final Rx<DateTime> endTime = DateTime.now().obs;

  final int equipmentId = Get.arguments[0];
  final RxInt equipmentGymId = (-1).obs;

  @override
  void onInit() async {
    super.onInit();

    log('생성됨');

    initService();
    loadIdenticalEquipments();
    loadEquipmentSpecification();
  }

  void initService() {
    final logger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 80,
    );

    dio.interceptors.add(logger);
    service = EquipmentService(dio);
    reservationService = ReservationService(dio);

    equipmentGymId.value = Get.arguments[1];

    log('$equipmentId, ${equipmentGymId.value}');
  }

  void loadIdenticalEquipments() async {
    isLoading(true);
    try {
      final token =
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
      final authorityId = getInt(AppString.key_authority_id);

      if (authorityId != null) {
        log('authority id is $authorityId');
        var equipments = await service.getIdenticalEquipments(
            authorityId, token, equipmentId);

        for (int i = 0; i < equipments.equipments_count; i++) {
          indexMap.add(equipments.equipments[i].equipment_gym_id);
          if (equipments.equipments[i].equipment_gym_id ==
              equipmentGymId.value) {
            selectedIndex.value = i;
          }
        }

        equipmentList(equipments);
      } else {
        log('ERROR : authority id is null!');
      }
    } finally {
      isLoading(false);
    }
  }

  void loadEquipmentSpecification() async {
    isLoadingInSpec(true);
    try {
      final token =
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
      final authorityId = getInt(AppString.key_authority_id);

      if (authorityId != null) {
        log('authority id is $authorityId');
        var equipments = await service.getEquipmentSpecification(
            authorityId, token, equipmentGymId.value);
        equipmentSpec(equipments);
      } else {
        log('ERROR : authority id is null!');
      }
    } finally {
      isLoadingInSpec(false);
    }
  }

  void selectNewSpec(int index) async {
    selectedIndex(index);
    equipmentGymId.value = indexMap[index];
    loadEquipmentSpecification();
  }

  void equipmentReservation() async {
    final start =
        DateFormat(AppString.date_format_hh_mm).format(startTime.value);
    final end = DateFormat(AppString.date_format_hh_mm).format(endTime.value);

    try {
      final token =
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
      final authorityId = getInt(AppString.key_authority_id);

      if (authorityId != null) {
        log('authority id is $authorityId');
        reservationService.reserveEquipment(
            authorityId,
            token,
            equipmentGymId.value,
            Reservation(start_at: startTime.value, end_at: endTime.value));
      } else {
        log('ERROR : authority id is null!');
      }
    } catch (e) {
      log(e.toString());
    }

    Get.back();
    Get.snackbar(AppString.snackbar_check_reservation, '$start ~ $end');
  }

  @override
  void onClose() {
    dio.close();
    super.onClose();
    log('종료됨');
  }
}
