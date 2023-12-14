// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/routine_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/data/model/menu/dropdown_constants.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/loading.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_fab.dart';
import 'package:new_fit/app/view/common/newfit_routine_card.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';

class RoutinePage extends BaseView<RoutinePageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  //RoutinePageController controller = Get.put(RoutinePageController());
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarTranparent(
      appBarTitleText: AppString.str_routine_title,
      scrollController: scrollController,
    );
  }

  RxDouble scrollPosition = 0.0.obs;

  @override
  Widget body(BuildContext context) {
    return BaseBody(
      widgetList: [
        Obx(() {
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

                  return Column(
                    children: newfitRoutineCardList(),
                  );
                case ConnectionState.none:
                  return const Loading();
              }
            },
          );
        })
      ],
      scrollController: scrollController,
    );
  }

  List<Widget> newfitRoutineCardList() {
    return List.generate(
      (controller.myRoutineInfo.value.routines?.length ?? 0) + 1,
      (index) {
        if (index == controller.myRoutineInfo.value.routines?.length) {
          return SizedBox(height: 60.h);
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: NewfitRoutineCard(
              routineName:
                  controller.myRoutineInfo.value.routines?[index].name ?? '',
              equipmentCount:
                  controller.myRoutineInfo.value.routines_count ?? 0,
              routineDropdownChoiceAction: (menu) {
                if (menu == RoutineDropdownConstants.favorite.menuText) {
                  print(menu);
                } else if (menu == RoutineDropdownConstants.edit.menuText) {
                  print(menu);
                } else if (menu == RoutineDropdownConstants.delete.menuText) {
                  controller.deleteRoutine(
                    controller
                            .myRoutineInfo.value.routines?[index].routine_id ??
                        0,
                  );
                  controller.myRoutineInfo.value.routines?.removeAt(index);
                }
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget? floatingActionButton() {
    return NewfitFAB(
      backgroundColor: AppColors.white,
      contentColor: AppColors.black,
      fabTitleText: AppString.button_add_routine,
      onPressedFunction: () {
        Get.toNamed(AppPages.ROUTINE_ADD);
      },
    );
  }
}
