import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/gym/gym_model.dart';
import 'package:new_fit/app/services/network_service/gym_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RegisterGymPageController extends BaseController with StorageUtil {
  TextEditingController textEditingController = TextEditingController();
  AddressGymList addressGymList = AddressGymList(gym_count: 0, gyms: []);
  Dio dio = Dio();
  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    error: true,
    compact: true,
    maxWidth: 80,
  );

  Future<void> getAddressGymList(String gymName) async {
    dio.interceptors.add(prettyDioLogger);
    try {
      addressGymList = await GymService(dio).getGymList(
          'Bearer ${getString('access-token')!}',
          getInt('oauth-history-id')!,
          gymName);
    } catch (error) {
      error.printError();
    }
  }
}
