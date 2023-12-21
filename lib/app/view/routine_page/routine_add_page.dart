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
import 'package:new_fit/app/view/common/newfit_image.dart';
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
      hintText: controller.routineDetail?.routine_name ?? '새로운 루틴',
      controller: controller,
      goBackFunction: () {
        Get.back();
      },
    );
  }

  RxDouble scrollPosition = 0.0.obs;

  @override
  Widget body(BuildContext context) {
    return Obx(
      () {
        if (controller.reload.value) {}

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
            await controller.doneModify();
            await Future.delayed(const Duration(milliseconds: 200));
            await routinePageController.updateMainFuture();
            Get.back();
          },
        ),
      ),
    );
  }

  @override
  Widget? floatingActionButton() {
    TextEditingController textEditingController = TextEditingController();

    textEditingController.text = '15';

    return NewfitFAB(
      backgroundColor: AppColors.main,
      contentColor: AppColors.white,
      fabTitleText: AppString.button_add_equipment,
      onPressedFunction: () {
        Get.dialog(
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 280.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        color: AppColors.white,
                      ),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: const NewfitTextBold2Xl(
                              text: '기구 추가', textColor: AppColors.black),
                        ),
                        GestureDetector(
                          child: const NewfitImage(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            children: [
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 5.w),
                                child: GestureDetector(
                                  child: const Icon(Icons.remove),
                                  onTap: () {
                                    int value =
                                        int.parse(textEditingController.text) -
                                            5;
                                    if (value <= 5) {
                                      value = 5;
                                    }
                                    textEditingController.text =
                                        value.toString();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 100.w,
                                child: Material(
                                  child: _DurationInputTextField(
                                      hintText: '',
                                      controller: textEditingController),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: GestureDetector(
                                  child: const Icon(Icons.add),
                                  onTap: () {
                                    int value =
                                        int.parse(textEditingController.text) +
                                            5;
                                    if (value >= 30) {
                                      value = 30;
                                    }
                                    textEditingController.text =
                                        value.toString();
                                  },
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 10.h),
                          child: SizedBox(
                            height: 30.h,
                            child: NewfitButton(
                              buttonText: '추가',
                              buttonColor: AppColors.main,
                              onPressFuntion: () {
                                controller.addEquipment(
                                    int.parse(textEditingController.text));
                                textEditingController.text = '15';
                                Get.back();
                              },
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            );
          }),
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

class _DurationInputTextField extends StatelessWidget {
  const _DurationInputTextField({
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h, right: 0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: AppColors.main, width: 1.5.w),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: AppColors.main, width: 1.5.w),
          ),
          fillColor: AppColors.white,
          filled: true,
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
        autofocus: false,
      ),
    );
  }
}
