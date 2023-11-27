import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../data/model/json_models/equipment/equipment_models.dart';
import '../services/network_service/equipment_service.dart';

class HomePageController extends BaseController with StorageUtil {
  final Dio dio = Dio();
  late final EquipmentService service;

  var equipmentList = Rx<EquipmentList?>(null);
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();

    initService();
    loadEquipments();
  }

  void initService() {
    final logger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 500,
    );

    dio.interceptors.add(logger);
    service = EquipmentService(dio);
  }

  void loadEquipments() async {
    isLoading(true);
    try {
      var equipments = await service
          .getAllEquipmentsInGym("Bearer ${getString('access-token')}", 1);
      equipmentList(equipments);
    } catch (e) {
      if (e is DioException) {
        log('DioError: ${e.message}');
        log('Response data: ${e.response?.data}');
        log('Request data: ${e.requestOptions.data}');
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    dio.close();
    super.onClose();
  }
}
