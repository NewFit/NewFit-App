// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_fit/app/controller/reigster_gym_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/routes/app_pages.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_lists.dart';
import 'package:new_fit/app/view/common/newfit_text_field.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';

class RegisterGymPage extends BaseView<RegisterGymPageController> {
  RxBool redraw = false.obs;
  @override
  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      bottomSheet: bottomSheet(),
      drawer: drawer(),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return BaseBodyWithNoScroll(
      screenPadding: 0,
      widgetList: [
        NewfitSearchTextField(
          textEditingController: controller.textEditingController,
          onSubmittedFunction: controller.getAddressGymList,
        ),
        SizedBox(
          height: 420.h,
          child: Obx(
            () {
              if (redraw.value) ;
              return ListView.builder(
                itemCount: controller.addressGymList.value.gym_count,
                itemBuilder: (context, index) {
                  return NewfitSearchListCell(
                    gymTitleText:
                        controller.addressGymList.value.gyms[index].gym_name,
                    gymLocationText:
                        controller.addressGymList.value.gyms[index].address,
                    toggled: controller.selected[index].obs,
                    toggledColor: controller.selected[index]
                        ? AppColors.main
                        : AppColors.white,
                    onTapFunction: () {
                      if (controller.selected[index]) {
                        controller.selected = RxList.generate(
                            controller.addressGymList.value.gym_count,
                            (index) => false);
                        redraw.value = !redraw.value;
                        controller.gymId = 0;
                      } else {
                        controller.selected = RxList.generate(
                            controller.addressGymList.value.gym_count,
                            (index) => false);
                        controller.selected[index] = true;
                        redraw.value = !redraw.value;
                        controller.gymId =
                            controller.addressGymList.value.gyms[index].gym_id;
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
        Obx(
          () {
            Color buttonColor = Colors.grey;

            if (redraw.value) ;
            if (controller.selected.contains(true)) {
              buttonColor = AppColors.main;
            } else {
              buttonColor = Colors.grey;
            }
            return NewfitButton(
              buttonText: '등록 요청하기',
              buttonColor: buttonColor,
              onPressFuntion: () async {
                if (controller.selected.contains(true)) {
                  await controller.registerGym();
                } else {}
              },
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: NewfitTextButton(
            buttonText: '다음에 할게요',
            textColor: Colors.grey,
            onPressFunction: () {
              Get.toNamed(AppPages.INITIAL);
            },
          ),
        ),
      ],
    );
  }
}
