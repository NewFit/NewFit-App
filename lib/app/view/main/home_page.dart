// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:new_fit/app/controller/home_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_equipment_list.dart';

// Todo : Mock data임. 나중에 지워버리기
final EquipmentList mockData =
    EquipmentList(gym_name: 'GYM', equipments_count: 5, equipments: [
  Equipment(
      equipment_id: 0,
      equipment_gym_id: 0,
      equipment_gym_name: '천국의 계단 1',
      purpose: '',
      condition: 'AVAILABLE'),
  Equipment(
      equipment_id: 1,
      equipment_gym_id: 0,
      equipment_gym_name: '천국의 계단 2',
      purpose: '',
      condition: 'AVAILABLE'),
  Equipment(
      equipment_id: 2,
      equipment_gym_id: 0,
      equipment_gym_name: '천국의 계단 3',
      purpose: '',
      condition: 'AVAILABLE'),
  Equipment(
      equipment_id: 3,
      equipment_gym_id: 0,
      equipment_gym_name: '천국의 계단 4',
      purpose: '',
      condition: 'AVAILABLE'),
]);

class HomePage extends BaseView<HomePageController> {
  final ScrollController scrollController;

  HomePage({required this.scrollController});

  List<Widget> buildEquipmentList(EquipmentList equipmentList) {
    return List<Widget>.generate(
      equipmentList.equipments.length,
      (index) {
        final equipment = equipmentList.equipments[index];
        return NewfitEquipmentListCell(
          equipmentTitle: equipment.equipment_gym_name,
          currentStatus: equipment.condition == 'AVAILABLE' ? 1 : 0,
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
    // return Obx(() {
    //   if (controller.isLoading.value) {
    //     return CircularProgressIndicator(); // 로딩 중
    //   }
    //   if (controller.equipmentList.value == null) {
    //     return Text("No data available");
    //   }
    //   final equipments = controller.equipmentList.value!;
    //   return BaseBody(
    //       scrollController: scrollController, widgetList: buildEquipmentList(equipments));
    // });
    return BaseBody(
        scrollController: scrollController,
        widgetList: buildEquipmentList(mockData));
  }
}
