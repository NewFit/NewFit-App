import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/mypage/mypage_model.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:new_fit/app/data/model/json_models/tag/entrance_tag_model.dart';
import 'package:new_fit/app/services/network_service/authority_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:nfc_manager/nfc_manager.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../data/model/json_models/equipment/equipment_models.dart';
import '../services/network_service/equipment_service.dart';

class HomePageController extends BaseController with StorageUtil {
  final Dio dio = Dio();
  late final EquipmentService equipmentService;
  late final AuthorityService authorityService;
  late final UserService userService;
  var isLoading = true.obs;
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 80,
  );

  final mainFuture = Future.wait([]).obs;
  final myPageInfo = MyPageInfo().obs;
  final myPageInfoFuture = Future.value(MyPageInfo()).obs;
  final equipmentList = EquipmentList().obs;
  final equipmentListFuture = Future.value(EquipmentList()).obs;

  @override
  void onInit() async {
    super.onInit();
    bool isAvailable = await NfcManager.instance.isAvailable();

    Get.snackbar('title', '$isAvailable');
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        //NfcManager.instance.stopSession();
      },
    );

    initService();
    updateMainFuture();
    authorityEntry();
  }

  void initService() {
    dio.interceptors.add(prettyDioLogger);
    equipmentService = EquipmentService(dio);
    authorityService = AuthorityService(dio);
    userService = UserService(dio);
  }

  updateMainFuture() {
    getMyPageInfo();
    if (getInt(AppString.key_authority_id) != 0 &&
        getInt(AppString.key_authority_id) != null) {
      getEquipmentList();
    }

    mainFuture.value = Future.wait([
      myPageInfoFuture.value,
      equipmentListFuture.value,
    ]);
  }

  assignFutures(List data) {
    final datas = [myPageInfo, equipmentList];
    for (var element in data) {
      datas[data.indexOf(element)].value = element;
    }
    saveUserInfo();
  }

  saveUserInfo() {
    saveString(AppString.key_nickname, myPageInfo.value.nickname ?? "hello");
    saveInt(AppString.key_total_credit, myPageInfo.value.total_credit ?? 0);
    saveInt(AppString.key_this_month_credit,
        myPageInfo.value.this_month_credit ?? 0);
    saveInt(AppString.key_gym_id, myPageInfo.value.current?.authority_id ?? 0);
  }

  void getMyPageInfo() {
    isLoading(true);
    try {
      if (getInt(AppString.key_authority_id) != 0 &&
          getInt(AppString.key_authority_id) != null) {
        myPageInfoFuture.value = UserService(dio).getMyPageInfo(
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token) ?? 'hello'}',
          getInt(AppString.key_authority_id)!,
        );
      } else {
        myPageInfoFuture.value = UserService(dio).getMyPageInfoUserId(
          '${AppString.jwt_prefix} ${getString(AppString.key_access_token) ?? 'hello'}',
          getInt(AppString.key_user_id)!,
        );
      }
    } finally {
      isLoading(false);
    }
  }

  void getEquipmentList() {
    isLoading(true);
    try {
      equipmentListFuture.value = EquipmentService(dio).getAllEquipmentsInGym(
        getInt(AppString.key_authority_id)!,
        '${AppString.jwt_prefix} ${getString(AppString.key_access_token)!}',
      );
    } catch (e) {
      print('getEquipmentlist error occurred');
    } finally {
      isLoading(false);
    }
  }

  //TODO : 실제 GPS와 연동해야함? 일회성 or 필요할 때마다?
  void authorityEntry() async {
    try {
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
    } catch (e) {
      print('authorityentry error occured');
    }
  }

  @override
  void onClose() {
    dio.close();
    super.onClose();
  }
}
