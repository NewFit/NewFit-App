import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/dev/feature_model.dart';
import 'package:new_fit/app/services/network_service/dev_service.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class FeatureSuggestPageController extends BaseController with StorageUtil {
  TextEditingController featureNameEditingController = TextEditingController();
  TextEditingController featureContentEditingController =
      TextEditingController();
  Dio dio = Dio();
  String submitTitle = "";
  String submitContent = "";
  Rx<bool> canSubmit = false.obs;

  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 500,
  );

  updateCanSubmit() {
    if (submitTitle.isEmpty || submitContent.isEmpty) {
      canSubmit.value = false;
    } else {
      canSubmit.value = true;
    }
  }

  submitFeatureSuggestion() {
    Feature feature = Feature(
        name: featureNameEditingController.text,
        content: featureContentEditingController.text);

    dio.interceptors.add(prettyDioLogger);
    DevService(dio).submitFeatureSuggestion(
      getInt(AppString.key_user_id) ?? 0,
      '${AppString.jwt_prefix} ${getString(AppString.key_access_token)}',
      feature,
    );
  }
}
