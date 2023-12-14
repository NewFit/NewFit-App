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
import 'package:new_fit/app/view/theme/app_string.dart';

class RoutineMoreInfoPage extends BaseView<RoutineMoreInfoPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  RxBool isEditMode = false.obs;

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarTranparent(
        scrollController: scrollController,
        appBarTitleText: AppString.str_routine_spec_title);
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
          buttonText: AppString.button_edit_routine,
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
              child: NewfitRoutineEquipmentListCell(
                listTitle: 'listTitle',
                minute: 10,
                onDeleteFunc: () {},
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.0.h),
              child: NewfitRoutineEquipmentListCell(
                listTitle: 'listTitle',
                minute: 10,
                onDeleteFunc: () {},
              ),
            );
          }
        },
      );
    });
  }
}
