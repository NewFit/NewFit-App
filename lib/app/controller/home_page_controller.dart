import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';

import '../data/model/json_models/equipment/equipment_list_model.dart';
import 'network_service/equipment_service.dart';

class HomePageController extends BaseController {
  final Dio dio = Dio();
  late final EquipmentService service;

  @override
  void onInit() async {
    service = EquipmentService(dio);
    super.onInit();
  }

  Future<EquipmentList> getAllEquipmentsInGym() async {
    return await service.getAllEquipmentsInGym();
  }

  @override
  void onClose() {
    dio.close();
    super.onClose();
  }
}