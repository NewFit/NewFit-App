import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_models.dart';
import 'package:new_fit/app/services/network_service/routine_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RoutineMoreInfoPageController extends BaseController with StorageUtil {
  Dio dio = Dio();
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
  final routineDetail = RoutineDetail().obs;
  final routineDetailFuture = Future.value(RoutineDetail()).obs;
  Rx<bool> reload = false.obs;
  Rx<bool> editMode = false.obs;
  Rx<double> height = 60.h.obs;

  @override
  onInit() {
    super.onInit();
    updateMainFuture();
  }

  updateMainFuture() {
    getMyPageInfo();
    mainFuture.value = Future.wait([routineDetailFuture.value]);
  }

  assignFutures(List data) {
    final datas = [routineDetail];
    for (var element in data) {
      datas[data.indexOf(element)].value = element;
    }
  }

  void getMyPageInfo() {
    isLoading(true);
    try {
      dio.interceptors.add(prettyDioLogger);
      routineDetailFuture.value = RoutineService(dio).getMyRoutineDetails(
        getInt(AppString.key_authority_id)!,
        '${AppString.jwt_prefix} ${getString(AppString.key_access_token)!}',
        Get.arguments,
      );
    } finally {
      isLoading(false);
    }
  }

  reorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final items = routineDetail.value.equipments?.removeAt(oldIndex);
    routineDetail.value.equipments?.insert(newIndex, items!);
    reload.value = !reload.value;
  }
}
