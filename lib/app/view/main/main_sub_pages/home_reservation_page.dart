// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:new_fit/app/controller/home_reservation_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_timepicker.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_values.dart';

import '../../common/newfit_button.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';

class HomeReservationPage extends BaseView<HomeReservationPageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return NewfitAppBarFlat(
      appBarTitleText: Obx(() {
        if (controller.isLoadingInSpec.value) {
          return const CircularProgressIndicator();
        }
        if (controller.equipmentSpec.value == null) {
          return const Center(child: Text(AppString.str_no_data));
        }
        return NewfitTextBoldXl(
          text: controller.equipmentSpec.value?.equipment_gym_name ?? "",
          textColor: AppColors.black,
        );
      }),
    );
  }

  @override
  Color pageBackgroundColor() {
    return const Color(0xFFF2F4F6);
  }

  @override
  Widget body(BuildContext context) {
    return BaseBodyWithNoScroll(
      screenPadding: AppValues.screenPadding,
      widgetList: [
        DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.r),
                )),
            child: Column(children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator();
                }
                if (controller.equipmentList.value == null) {
                  return const Center(child: Text(AppString.str_no_data));
                }
                return Container(
                  height: 60.h,
                  color: Colors.transparent,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        controller.equipmentList.value?.equipments_count ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectNewSpec(index);
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 8.h, 0, 0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Obx(
                                () => Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: controller
                                                      .selectedIndex.value ==
                                                  index
                                              ? AppColors.main.withOpacity(0.5)
                                              : Colors.transparent,
                                          width: 2.w)),
                                  child: const Image(
                                    image:
                                        AssetImage(AppString.defaultEquipment),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ])),
        const Spacer(),
        Obx(() {
          if (controller.isLoadingInSpec.value) {
            return const CircularProgressIndicator();
          }
          if (controller.equipmentSpec.value == null) {
            return const Center(child: Text(AppString.str_no_data));
          }
          return NewfitTimepicker(
              reservationList:
                  controller.equipmentSpec.value?.occupied_times ?? [],
              onTimeChanged: (DateTime start, DateTime end) {
                controller.startTime.value = start;
                controller.endTime.value = end;
                log("$start ~ $end");
              });
        }),
        const Spacer(),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 30.h),
          child: NewfitButton(
              buttonText: AppString.button_reservation,
              buttonColor: AppColors.main,
              onPressFuntion: () {
                controller.equipmentReservation();
              }),
        ),
      ],
    );
  }
}
