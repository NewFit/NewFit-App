import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/core/base/base_controller.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/gym/gym_model.dart';
import 'package:new_fit/app/services/network_service/gym_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/model/json_models/user/token_model.dart';

class RegisterGymPageController extends BaseController with StorageUtil {
  TextEditingController textEditingController = TextEditingController();

  Rx<AddressGymList> addressGymList =
      AddressGymList(gym_count: 0, gyms: []).obs;

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

  int gymId = 0;
  RxList<bool> selected = RxList.empty();

  Future<void> getAddressGymList(String gymName) async {
    dio.interceptors.add(prettyDioLogger);
    try {
      addressGymList.value = await GymService(dio).getGymList(
          'Bearer ${getString('access-token')!}',
          getInt('oauth-history-id')!,
          gymName);
      selected =
          RxList.generate(addressGymList.value.gym_count, (index) => false);
    } catch (error) {
      error.printError();
    }
  }

  Future<void> registerGym() async {
    dio.interceptors.add(prettyDioLogger);
    saveInt('authority-id', gymId);
    try {
      final accessToken = getString('access-token')!;
      await GymService(dio).registerGym(
        getInt('oauth-history-id')!,
        'Bearer $accessToken}',
        GymId(gym_id: gymId),
      );
    } catch (error) {
      error.printError();
    }
  }
}
