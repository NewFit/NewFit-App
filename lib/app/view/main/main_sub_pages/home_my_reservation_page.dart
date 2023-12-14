import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_fit/app/controller/home_my_reservation_page_controller.dart';
import 'package:new_fit/app/controller/home_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

import '../../common/newfit_equipment_list.dart';
import '../../theme/app_string.dart';

class HomeMyReservationPage extends BaseView<HomeMyReservationPageController> {
  final ScrollController scrollController;
  final HomePageController homePageController = Get.find();

  HomeMyReservationPage({required this.scrollController});

  List<Widget> buildEquipmentList(List<SpecificReservation>? reservationList) {
    if (reservationList == null) {
      return <Widget>[];
    }

    return List<Widget>.generate(
      reservationList.length,
      (index) {
        final reservation = reservationList[index];
        final String reservationEquipmentName = homePageController
                .equipmentList.value?.equipments
                .firstWhere((element) =>
                    element.equipment_gym_id == reservation.equipment_gym_id)
                .equipment_gym_name ??
            AppString.str_no_data;
        return NewfitEquipmentListWithoutAvailableCell(
          equipmentTitle: reservationEquipmentName,
          equipmentGymId: reservation.equipment_gym_id,
          onTap: () {
            controller.selectedIndex.value = index;
          },
          checked: index == controller.selectedIndex.value,
        );
      },
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const CircularProgressIndicator();
      }
      if (controller.specificReservationList.isEmpty) {
        return const Center(child: Text(AppString.str_no_data));
      }
      final reservations = controller.specificReservationList;
      return BaseBody(
          scrollController: scrollController,
          widgetList: buildEquipmentList(reservations));
    });
  }
}
