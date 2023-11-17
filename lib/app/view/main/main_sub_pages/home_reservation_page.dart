// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_fit/app/controller/home_reservation_page_controller.dart';
import 'package:new_fit/app/core/base/base_view.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_timepicker.dart';

import '../../common/newfit_button.dart';
import '../../theme/app_colors.dart';

class HomeReservationPage extends BaseView<HomeReservationPageController> {
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
    return const NewfitAppBarFlat(appBarTitleText: '천국의 계단 1');
  }

  @override
  Color pageBackgroundColor() {
    return const Color(0xFFF2F4F6);
  }

  @override
  Widget body(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime startTime =
        DateTime(now.year, now.month, now.day, now.hour, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    final reservationList =
        controller.generateRandomReservations(startTime, endTime);

    return BaseBodyWithNoScroll(
      widgetList: [
        DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.r),
                )),
            child: Column(children: [
              Container(
                height: 60.h,
                color: Colors.transparent,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 8.h, 0, 0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(50.h), // Image radius
                            child: const Image(
                              image: AssetImage('images/gorani.png'),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ])),
        const Spacer(),
        NewfitTimepicker(
            reservationList: reservationList,
            onTimeChanged: (DateTime start, DateTime end) {
              controller.startTime.value = start;
              controller.endTime.value = end;
              log("$start ~ $end");
            }),
        const Spacer(),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 30.h),
          child: NewfitButton(
              buttonText: '예약',
              buttonColor: AppColors.main,
              onPressFuntion: () {
                Get.back();
                Get.snackbar('예약 확인',
                    '${DateFormat("HH:mm").format(controller.startTime.value)} ~ ${DateFormat("HH:mm").format(controller.endTime.value)}');
              }),
        ),
      ],
    );
  }
}
