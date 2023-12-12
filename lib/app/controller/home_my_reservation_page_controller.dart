import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/services/network_service/authority_service.dart';
import 'package:new_fit/app/services/network_service/reservation_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../view/theme/app_string.dart';

class HomeMyReservationPageController extends BaseController with StorageUtil {
  final Dio dio = Dio();
  late final ReservationService service;

  var reservationList = Rx<ReservationList?>(null);
  var isLoading = true.obs;
  var specificReservationList = RxList<SpecificReservation>();
  var isLoadingSpecs = true.obs;

  final Rx<DateTime> startTime = DateTime(DateTime.now().year,
          DateTime.now().month, DateTime.now().day, DateTime.now().hour, 0, 0)
      .obs;
  final Rx<DateTime> endTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          DateTime.now().hour + 2,
          1,
          0)
      .obs;

  @override
  void onInit() async {
    super.onInit();

    initService();
    loadMyReservationList();
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
    service = ReservationService(dio);
  }

  void loadMyReservationList() async {
    isLoading(true);
    try {
      var now = DateTime.now();
      startTime.value = DateTime(now.year, now.month, now.day, now.hour, 0, 0);
      endTime.value =
          DateTime(now.year, now.month, now.day, now.hour + 2, 1, 0);

      final token =
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
      final authorityId = getInt(AppString.key_authority_id);
      final gymId = getInt(AppString.key_gym_id)!;

      if (authorityId != null) {
        log('authority id is $authorityId');
        var reservation = await service.getReservationList(authorityId, token, gymId);
        reservationList(reservation);
      } else {
        log('ERROR : authority id is null!');
      }
    } finally {
      isLoading(false);
    }
  }

  void loadMyReservationSpecList() async {
    isLoading(true);
    try {
      var now = DateTime.now();
      startTime.value = DateTime(now.year, now.month, now.day, now.hour, 0, 0);
      endTime.value =
          DateTime(now.year, now.month, now.day, now.hour + 2, 1, 0);

      final token =
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
      final authorityId = getInt(AppString.key_authority_id);
      final gymId = getInt(AppString.key_gym_id)!;

      if (authorityId != null) {
        log('authority id is $authorityId');
        var reservation = await service.getReservationList(authorityId, token, gymId);
        reservationList(reservation);
      } else {
        log('ERROR : authority id is null!');
      }
    } finally {
      isLoading(false);
    }
  }
}
