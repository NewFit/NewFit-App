import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/home_page_controller.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/routine/routine_models.dart';
import 'package:new_fit/app/services/network_service/routine_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RoutineAddPageController extends BaseController with StorageUtil {
  HomePageController homePageController = Get.find<HomePageController>();
  TextEditingController routineNameEditingController = TextEditingController();
  Rx<PostRoutine> postRoutine = PostRoutine().obs;
  RoutineDetail? routineDetail = Get.arguments;
  Rx<bool> reload = false.obs;
  Rx<int> equipmentId = 0.obs;
  int sequence = 0;
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

  @override
  onInit() {
    super.onInit();
    dio.interceptors.add(prettyDioLogger);
    if (routineDetail != null) {
      routineDetailToPostRoutine();
    }
  }

  doneModify() {
    if (routineDetail == null) {
      addRoutine();
    } else {
      editRoutine();
    }
  }

  routineDetailToPostRoutine() {
    List<RoutineEquipment> routineEquipments = List.empty(growable: true);

    for (final (index, routine) in (routineDetail?.equipments ?? []).indexed) {
      routineEquipments.add(
        RoutineEquipment(
          sequence: index,
          equipment_id: routine.equipment_id,
          duration: routine.duration,
        ),
      );
    }
    postRoutine.value.routine_equipments = routineEquipments;
  }

  PatchRoutineEquipments postRoutineToPatchRoutineEquipments() {
    List<SummarizedRoutineEquipment> equipments = List.empty(growable: true);

    for (final routine in postRoutine.value.routine_equipments!) {
      equipments.add(
        SummarizedRoutineEquipment(
          equipment_id: routine.equipment_id,
          duration: routine.duration,
        ),
      );
    }

    return PatchRoutineEquipments(
        equipments_count: equipments.length, equipments: equipments);
  }

  editRoutine() {
    RoutineService(dio).editRoutineName(
      getInt(AppString.key_authority_id)!,
      '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}',
      routineDetail?.routine_id ?? 0,
      RoutineName(routine_name: routineNameEditingController.text),
    );

    RoutineService(dio).editRoutineEquipments(
      getInt(AppString.key_authority_id)!,
      '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}',
      routineDetail?.routine_id ?? 0,
      postRoutineToPatchRoutineEquipments(),
    );
  }

  addEquipment(int duration, int equipmentId) {
    postRoutine.value.routine_equipments ??= List.empty(growable: true);
    postRoutine.value.routine_equipments?.add(RoutineEquipment(
        sequence: sequence, equipment_id: equipmentId, duration: duration));
    sequence += 1;
    reload.value = !reload.value;
  }

  deleteEquipment(int index) {
    postRoutine.value.routine_equipments?.removeAt(index);
    resetSequence();
    reload.value = !reload.value;
  }

  addRoutine() async {
    dio.interceptors.add(prettyDioLogger);

    postRoutine.value.routine_name = routineNameEditingController.text;
    RoutineService(dio).addRoutine(
      getInt(AppString.key_authority_id)!,
      '${AppString.jwt_prefix} ${getString(AppString.key_access_token)!}',
      postRoutine.value,
    );
    await Future.delayed(const Duration(milliseconds: 200));
  }

  reorder(oldIndex, newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final items = postRoutine.value.routine_equipments?.removeAt(oldIndex);
    postRoutine.value.routine_equipments?.insert(newIndex, items!);
    resetSequence();
    reload.value = !reload.value;
  }

  resetSequence() {
    for (final (index, item) in postRoutine.value.routine_equipments!.indexed) {
      item.sequence = index;
    }
    sequence = postRoutine.value.routine_equipments!.length;
  }
}
