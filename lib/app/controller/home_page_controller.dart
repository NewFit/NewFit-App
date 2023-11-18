import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import '../data/model/json_models/equipment/equipment_models.dart';
import '../services/network_service/equipment_service.dart';

const String TEST_TOKEN = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJuZXdmaXQub2ZmaWNpYWxAZ21haWwuY29tIiwiaWF0IjoxNjk5NTI5OTA5LCJleHAiOjE5OTk1MzE3MDksInN1YiI6IkhhcHB5TWFuYWdlciIsImF1dGhvcml0eUlkTGlzdCI6WzFdLCJpZCI6MX0.XelWyqLEwHQnx2sBa4BWwv4jQLLjW8y5NIy26d0to3s";

class HomePageController extends BaseController {
  final Dio dio = Dio();
  late final EquipmentService service;

  var equipmentList = Rx<EquipmentList?>(null);
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["Authorization"] = TEST_TOKEN;
        return handler.next(options);
      },
    ));

    service = EquipmentService(dio);
    loadEquipments();
  }

  void loadEquipments() async {
    isLoading(true);
    try {
      var equipments = await service.getAllEquipmentsInGym();
      equipmentList(equipments);
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