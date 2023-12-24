import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_models.dart';
import 'package:new_fit/app/services/network_service/routine_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RoutinePageController extends BaseController with StorageUtil {
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
  final myRoutineInfo = MyRoutineList().obs;
  final myRoutineInfoFuture = Future.value(MyRoutineList()).obs;

  @override
  onInit() {
    super.onInit();
    dio.interceptors.add(prettyDioLogger);
    updateMainFuture();
  }

  updateMainFuture() {
    getMyRoutineInfo();
    mainFuture.value = Future.wait([myRoutineInfoFuture.value]);
  }

  assignFutures(List data) {
    final datas = [myRoutineInfo];
    for (var element in data) {
      datas[data.indexOf(element)].value = element;
    }
  }

  getMyRoutineInfo() {
    isLoading(true);
    try {
      myRoutineInfoFuture.value = RoutineService(dio).getMyRoutineList(
        getInt(AppString.key_authority_id)!,
        '${AppString.jwt_prefix} ${getString(AppString.key_access_token)!}',
      );
    } finally {
      isLoading(false);
    }
  }

  Future<RoutineDetail> getRoutineDetail(int routineId) async {
    return RoutineService(dio).getMyRoutineDetails(
      getInt(AppString.key_authority_id)!,
      '${AppString.jwt_prefix} ${getString(AppString.key_access_token)!}',
      routineId,
    );
  }

  deleteRoutine(int routineId) {
    isLoading(true);
    try {
      dio.interceptors.add(prettyDioLogger);
      RoutineService(dio).deleteRoutine(
        getInt(AppString.key_authority_id)!,
        '${AppString.jwt_prefix} ${getString(AppString.key_access_token)!}',
        RoutineId(routine_id: routineId),
      );
    } finally {
      isLoading(false);
    }
  }
}
