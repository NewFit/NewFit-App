// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_fit/app/controller/home_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/local/db/storage_util.dart';
import 'package:new_fit/app/data/model/json_models/equipment/equipment_models.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/loading.dart';
import 'package:new_fit/app/view/common/newfit_equipment_list.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class HomePage extends BaseView<HomePageController> with StorageUtil {
  final ScrollController scrollController;

  HomePage({required this.scrollController});

  List<Widget> buildEquipmentList(EquipmentList? equipmentList) {
    if (equipmentList == null) {
      return <Widget>[];
    }

    return List<Widget>.generate(
      equipmentList.equipments!.length,
      (index) {
        final equipment = equipmentList.equipments![index];
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

  /*
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
  } */

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      scrollController: scrollController,
      widgetList: [
        Stack(
          children: [
            FutureBuilder(
              future: controller.mainFuture.value,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return const Loading();
                  case ConnectionState.done:
                    if (snapshot.hasError) return Container();
                    controller.assignFutures((snapshot.data! as List));

                    return Column(
                      children: (getInt(AppString.key_authority_id) != 0 &&
                              getInt(AppString.key_authority_id) != null)
                          ? buildEquipmentList(controller.equipmentList.value)
                          : [
                              SizedBox(
                                height: 100.h,
                              ),
                              const NewfitTextRegularXl(
                                text: '헬스장 등록이 수락되지 않았어요.',
                                textColor: Colors.grey,
                              )
                            ],
                    );
                  case ConnectionState.none:
                    return const Loading();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
