// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/routine_add_page_controller.dart';
import 'package:new_fit/app/controller/routine_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_fab.dart';
import 'package:new_fit/app/view/common/newfit_routine_equipmentlist.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_text_theme.dart';

class RoutineAddPage extends BaseView<RoutineAddPageController> {
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);
  RoutinePageController routinePageController =
      Get.find<RoutinePageController>();
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitRoutineAppBar(
      controller: controller,
      goBackFunction: () {
        routinePageController.updateMainFuture();
        Get.back();
      },
    );
  }

  RxDouble scrollPosition = 0.0.obs;

  @override
  Widget body(BuildContext context) {
    return Obx(
      () {
        if (controller.reload.value) ;

        return ReorderableListView(
          proxyDecorator: proxyDecorator,
          scrollController: scrollController,
          onReorder: (int oldIndex, int newIndex) {
            controller.reorder(oldIndex, newIndex);
          },
          children: newfitRoutineCardList(),
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
          buttonText: AppString.button_add_routine,
          buttonColor: AppColors.main,
          onPressFuntion: () async {
            await controller.addRoutine();

            routinePageController.updateMainFuture();
            Get.back();
          },
        ),
      ),
    );
  }

  @override
  Widget? floatingActionButton() {
    return NewfitFAB(
      backgroundColor: AppColors.main,
      contentColor: AppColors.white,
      fabTitleText: AppString.button_add_equipment,
      onPressedFunction: () {
        Get.dialog(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 150.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: AppColors.white,
              ),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: const NewfitTextBold2Xl(
                      text: 'text', textColor: AppColors.black),
                ),
                GestureDetector(
                  child: newfitImage(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Row(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: GestureDetector(
                          child: Icon(Icons.remove),
                        ),
                      ),
                      Container(
                        width: 80.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.r))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          child: Icon(Icons.add),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  child: SizedBox(
                    height: 30.h,
                    child: NewfitButton(
                      buttonText: '추가',
                      buttonColor: AppColors.main,
                      onPressFuntion: () {
                        controller.addEquipment();
                        Get.back();
                      },
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }

  List<Widget> newfitRoutineCardList() {
    return List.generate(
        controller.postRoutine.value.routine_equipments?.length ?? 0, (index) {
      return Padding(
        key: ValueKey(index),
        padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
        child: NewfitRoutineEquipmentListCell(
          listTitle:
              '${controller.postRoutine.value.routine_equipments?[index].sequence ?? ''}',
          minute: controller
                  .postRoutine.value.routine_equipments?[index].duration ??
              0,
          onDeleteFunc: () {
            controller.deleteEquipment(index);
          },
        ),
      );
    });
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(1, 6, animValue)!;
        final double scale = lerpDouble(1, 1.02, animValue)!;
        return Transform.scale(
          scale: scale,
          child: Padding(
            key: ValueKey(index),
            padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
            child: NewfitRoutineEquipmentListCell(
              key: ValueKey(index),
              listTitle:
                  '${controller.postRoutine.value.routine_equipments?[index].sequence ?? ''}',
              minute: controller
                      .postRoutine.value.routine_equipments?[index].duration ??
                  0,
              onDeleteFunc: () {
                controller.deleteEquipment(index);
              },
            ),
          ),
        );
      },
      child: child,
    );
  }
}

Widget newfitImage() {
  return SizedBox(
    width: 125.w,
    height: 125.w,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          child: const Image(
            image: AssetImage('images/gorani.png'),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.main,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.r),
            ),
          ),
        ),
      ],
    ),
  );
}
