import 'package:flutter/material.dart';
import 'package:new_fit/app/controller/home_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_equipment_list.dart';

// Todo : Mock data임. 나중에 지워버리기
final List<Map<String, dynamic>> mockData = List.generate(
  10,
  (index) => {"equipmentTitle": "천국의계단", "currentStatus": 1},
);

class HomePage extends BaseView<HomePageController> {
  final ScrollController scrollController;

  HomePage({required this.scrollController});

  List<Widget> buildEquipmentList() {
    return List<Widget>.generate(
      mockData.length,
          (index) {
        final equipment = mockData[index];
        return NewfitEquipmentListCell(
          equipmentTitle: equipment['equipmentTitle'],
          currentStatus: equipment['currentStatus'],
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
    return BaseBody(
        scrollController: scrollController,
        widgetList: buildEquipmentList());
  }
}
