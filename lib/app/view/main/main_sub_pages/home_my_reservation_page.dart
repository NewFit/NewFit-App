import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/home_my_reservation_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/model/json_models/reservation/reservation_models.dart';
import 'package:new_fit/app/view/common/base_body.dart';

import '../../common/newfit_equipment_list.dart';

class HomeMyReservationPage extends BaseView<HomeMyReservationPageController> {
  List<Widget> buildEquipmentList(List<SpecificReservation>? reservationList) {
    if (reservationList == null) {
      return <Widget>[];
    }

    return List<Widget>.generate(
      reservationList.length,
          (index) {
        final reservation = reservationList[index];
        return NewfitEquipmentListWithoutAvailableCell(
          equipmentTitle: reservation.gym_name,
          currentStatus: -1,
          equipmentGymId: reservation.equipment_gym_id,
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
    return BaseBody(widgetList: []);
  }
}
