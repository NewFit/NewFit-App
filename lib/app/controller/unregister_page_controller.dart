import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/db_manager.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/user/user_model.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/services/network_service/user_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class UnregisterPageController extends BaseController with StorageUtil {
  TextEditingController emailEditingController = TextEditingController();
  Dio dio = Dio();
  DBManager dbManager = DBManager();
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 80,
  );
  String email = "";
  RxBool canSubmit = false.obs;

  @override
  onInit() {
    super.onInit();

    emailEditingController.addListener(() {
      updateCanSubmit();
    });
  }

  unregister() async {
    dio.interceptors.add(prettyDioLogger);

    await UserService(dio).deleteUser(
      getInt('user-id')!,
      "Bearer ${getString('access-token')!}",
      UserEmail(
        email: emailEditingController.text,
      ),
    );
    dbManager.delete();
    Get.offAndToNamed(AppPages.LOGIN);
  }

  updateCanSubmit() {
    if (email.isEmpty) {
      canSubmit.value = false;
    } else {
      canSubmit.value = true;
    }
  }
}
