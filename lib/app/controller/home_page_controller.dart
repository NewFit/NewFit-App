import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/tag/entrance_tag_model.dart';
import 'package:new_fit/app/services/network_service/authority_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../data/model/json_models/equipment/equipment_models.dart';
import '../services/network_service/equipment_service.dart';

class HomePageController extends BaseController with StorageUtil {
  final Dio dio = Dio();
  late final EquipmentService equipmentService;
  late final AuthorityService authorityService;

  var equipmentList = Rx<EquipmentList?>(null);
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();

    initService();
    loadEquipments();

    authorityEntry();
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
    equipmentService = EquipmentService(dio);
    authorityService = AuthorityService(dio);
  }

  void loadEquipments() async {
    isLoading(true);
    try {
      final token =
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
      final authorityId = getInt(AppString.key_authority_id);

      if (authorityId != null) {
        log('authority id is $authorityId');
        var equipments =
            await equipmentService.getAllEquipmentsInGym(authorityId, token);
        equipmentList(equipments);
      } else {
        log('ERROR : authority id is null!');
      }
    } finally {
      isLoading(false);
    }
  }

  //TODO : 실제 GPS와 연동해야함? 일회성 or 필요할 때마다?
  void authorityEntry() async {
    final token =
        '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}';
    final authorityId = getInt(AppString.key_authority_id);
    final gymId = getInt(AppString.key_gym_id)!;

    if (authorityId != null) {
      log('authority id is $authorityId');
      await authorityService.enterGym(authorityId, token,
          EntranceTag(gym_id: gymId, tag_at: DateTime.now()));
    } else {
      log('ERROR : authority id is null!');
    }
  }

  @override
  void onClose() {
    dio.close();
    super.onClose();
  }
}
