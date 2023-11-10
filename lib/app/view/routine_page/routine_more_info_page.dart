// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/routine_more_info_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_routine_equipmentlist.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class RoutineMoreInfoPage extends BaseView<RoutineMoreInfoPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  RxBool isEditMode = false.obs;

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarTranparent(
        scrollController: scrollController, appBarTitleText: "루틴 상세 정보");
  }

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      scrollController: scrollController,
      widgetList: routineEquipmentList(200),
    );
  }

  @override
  Widget bottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(top: 0.h, bottom: 10.h, left: 20.w, right: 20.w),
        child: NewfitButton(
          buttonText: '루틴 수정하기',
          buttonColor: AppColors.main,
          onPressFuntion: () {
            isEditMode.value = !isEditMode.value;
          },
        ),
      ),
    );
  }

  List<Widget> routineEquipmentList(int length) {
    return List.generate(length, (index) {
      return Obx(
        () {
          if (!isEditMode.value) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.0.h),
              child: const NewfitRoutineEquipmentListCell(
                  listTitle: 'listTitle', minute: 10),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.0.h),
              child: const NewfitRoutineEquipmentListCell(
                  listTitle: 'listTitle', minute: 10),
            );
          }
        },
      );
    });
  }
}
