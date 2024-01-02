import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:new_fit/app/services/network_service/equipment_service.dart';
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
  }

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

  Rx<double> positionX = 0.0.obs;
  var equipmentList = Rx<EquipmentList?>(null);
  var equipmentSpec = Rx<EquipmentSpec?>(null);
  int equipmentGymId;
  final Rx<int> selectedIndex = 0.obs;
  final int equipmentId;
  final RxInt duration = 0.obs;
  final List<int> indexMap = [];
  final RxList<bool> buttonPressed = List.generate(6, (index) => false).obs;

  void updateButtonPressed(int index) {
    buttonPressed.value = List.generate(6, (index) => false);
    buttonPressed[index] = true;
    duration.value = (index + 1) * 5;
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
        print(equipments.equipments_count);
      }
    } catch (error) {
      print('loadIdentical error');
    }
  }

  void loadEquipmentSpecification() async {
    try {
      final token =
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
      final authorityId = getInt(AppString.key_authority_id);

      if (authorityId != null) {
        var equipment = await EquipmentService(dio)
            .getEquipmentSpecification(authorityId, token, equipmentGymId);
        equipmentSpec.value = equipment;
      }
    } catch (e) {
      print('error');
    }
  }

  void selectNewSpec(int index) async {
    selectedIndex(index);
    equipmentGymId = indexMap[index];
    loadEquipmentSpecification();
  }
}
