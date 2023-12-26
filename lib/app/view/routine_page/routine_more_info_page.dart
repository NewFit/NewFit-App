// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/routine_more_info_page_controller.dart';
import 'package:new_fit/app/controller/routine_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/loading.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_routine_equipmentlist.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

class RoutineMoreInfoPage extends BaseView<RoutineMoreInfoPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  RoutinePageController routinePageController =
      Get.find<RoutinePageController>();
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarTranparent(
      scrollController: scrollController,
      appBarTitleText: AppString.str_routine_spec_title,
    );
  }

  RxDouble scrollPosition = 0.0.obs;

  @override
  Widget body(BuildContext context) {
    return Obx(
      () {
        if (controller.reload.value) {}

        return FutureBuilder(
          future: controller.mainFuture.value,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Loading();
              case ConnectionState.done:
                if (snapshot.hasError) return Container();
                controller.assignFutures((snapshot.data! as List));

                return ReorderableListView(
                  buildDefaultDragHandles: controller.editMode.value,
                  proxyDecorator: proxyDecorator,
                  scrollController: scrollController,
                  onReorder: (int oldIndex, int newIndex) {
                    controller.reorder(oldIndex, newIndex);
                  },
                  children: newfitRoutineCardList(),
                );
              case ConnectionState.none:
                return const Loading();
            }
          },
        );
      },
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: NewfitButton(
          buttonText: AppString.button_edit_routine,
          buttonColor: AppColors.main,
          onPressFuntion: () async {
            Get.toNamed(AppPages.ROUTINE_ADD,
                arguments: controller.routineDetail.value);
          },
        ),
      ),
    );
  }

  List<Widget> newfitRoutineCardList() {
    return List.generate(controller.routineDetail.value.equipments_count ?? 0,
        (index) {
      return Padding(
        key: ValueKey(index),
        padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
        child: NewfitRoutineEquipmentDetailListCell(
          imagePath:
              'images/image_equipment_${controller.routineDetail.value.equipments?[index].equipment_id}.png',
          listTitle:
              controller.routineDetail.value.equipments?[index].name ?? '',
          minute:
              controller.routineDetail.value.equipments?[index].duration ?? 0,
          onDeleteFunc: () {},
          controller: controller,
        ),
      );
    });
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double scale = lerpDouble(1, 1.02, animValue)!;
        return Transform.scale(
          scale: scale,
          child: Padding(
            key: ValueKey(index),
            padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
            child: NewfitRoutineEquipmentDetailListCell(
              key: ValueKey(index),
              imagePath:
                  'images/image_equipment_${controller.routineDetail.value.equipments?[index].equipment_id}.png',
              listTitle:
                  controller.routineDetail.value.equipments?[index].name ?? '',
              minute:
                  controller.routineDetail.value.equipments?[index].duration ??
                      0,
              onDeleteFunc: () {},
              controller: controller,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
