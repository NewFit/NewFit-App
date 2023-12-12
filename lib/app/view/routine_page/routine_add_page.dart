// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/routine_add_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_fab.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

class RoutineAddPage extends BaseView<RoutineAddPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitRoutineAppBar(
      controller: controller,
    );
  }

  RxDouble scrollPosition = 0.0.obs;

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      widgetList: [],
      scrollController: scrollController,
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: NewfitButton(
            buttonText: AppString.button_add_routine,
            buttonColor: AppColors.main,
            onPressFuntion: () {}),
      ),
    );
  }

  @override
  Widget? floatingActionButton() {
    return NewfitFAB(
      backgroundColor: AppColors.main,
      contentColor: AppColors.white,
      fabTitleText: AppString.button_add_equipment,
      onPressedFunction: () {},
    );
  }
}
