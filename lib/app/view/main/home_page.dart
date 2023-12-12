// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:new_fit/app/controller/home_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_equipment_list.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

class HomePage extends BaseView<HomePageController> {
  final ScrollController scrollController;

  HomePage({required this.scrollController});

  List<Widget> buildEquipmentList(EquipmentList? equipmentList) {
    if (equipmentList == null) {
      return <Widget>[];
    }

    return List<Widget>.generate(
      equipmentList.equipments.length,
      (index) {
        final equipment = equipmentList.equipments[index];
        return NewfitEquipmentListCell(
          equipmentTitle: equipment.equipment_gym_name,
          currentStatus:
              equipment.condition == AppString.equipment_condition_available
                  ? 1
                  : 0,
          equipmentId: equipment.equipment_id,
          equipmentGymId: equipment.equipment_gym_id,
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
      if (controller.equipmentList.value == null) {
        return const Center(child: Text(AppString.str_no_data));
      }
      final equipments = controller.equipmentList.value;
      return BaseBody(
          scrollController: scrollController,
          widgetList: buildEquipmentList(equipments));
    });
  }
}
