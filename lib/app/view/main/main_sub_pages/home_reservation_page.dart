// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_fit/app/controller/reservation_modal_controller.dart';
import 'package:new_fit/app/view/common/base_body.dart';
import 'package:new_fit/app/view/common/newfit_appbar.dart';
import 'package:new_fit/app/view/common/newfit_timepicker.dart';
import 'package:new_fit/app/view/theme/app_string.dart';
import 'package:new_fit/app/view/theme/app_values.dart';
import '../../../controller/home_reservation_page_controller.dart';
import '../../common/newfit_button.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_theme.dart';

class HomeReservationPage extends StatelessWidget {
  PreferredSizeWidget? appBar(BuildContext context,
      HomeReservationPageController reservationController) {
    return NewfitAppBarFlat(
      appBarTitleText: Obx(() {
        if (reservationController.isLoadingInSpec.value) {
          return const CircularProgressIndicator();
        }
        if (reservationController.equipmentSpec.value == null) {
          return const Center(child: Text(AppString.str_no_data));
        }
        return NewfitTextBoldXl(
          text: reservationController.equipmentSpec.value?.equipment_gym_name ??
              "",
          textColor: AppColors.black,
        );
      }),
    );
  }

  Color pageBackgroundColor() {
    return const Color(0xFFF2F4F6);
  }

  Widget body(BuildContext context,
      HomeReservationPageController reservationController) {
    return BaseBodyWithNoScroll(
      screenPadding: AppValues.screenPadding,
      widgetList: [
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              )),
          child: Column(
            children: [
              Obx(
                () {
                  if (reservationController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }
                  if (reservationController.equipmentList.value == null) {
                    return const Center(child: Text(AppString.str_no_data));
                  }
                  return Container(
                    height: 60.h,
                    color: Colors.transparent,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reservationController
                              .equipmentList.value?.equipments_count ??
                          0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            reservationController.selectNewSpec(index);
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
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color: reservationController
                                                        .selectedIndex.value ==
                                                    index
                                                ? AppColors.main
                                                    .withOpacity(0.5)
                                                : Colors.transparent,
                                            width: 2.w)),
                                    child: const Image(
                                      image: AssetImage(
                                          'images/image_equipment_1.png'),
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
                },
              ),
            ],
          ),
        ),
        const Spacer(),
        Obx(() {
          if (reservationController.isLoadingInSpec.value) {
            return const CircularProgressIndicator();
          }
          if (reservationController.equipmentSpec.value == null) {
            return const Center(child: Text(AppString.str_no_data));
          }
          return NewfitTimepicker(
              reservationList:
                  reservationController.equipmentSpec.value?.occupied_times ??
                      [],
              onTimeChanged: (DateTime start, DateTime end) {
                reservationController.startTime.value = start;
                reservationController.endTime.value = end;
              });
        }),
        const Spacer(),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 30.h),
          child: NewfitButton(
              buttonText: AppString.button_reservation,
              buttonColor: AppColors.main,
              onPressFuntion: () {
                reservationController.equipmentReservation();
              }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final reservationController = Get.put(HomeReservationPageController(),
        tag: Get.arguments[1].toString());

    return Scaffold(
      appBar: appBar(context, reservationController),
      body: body(context, reservationController),
      backgroundColor: pageBackgroundColor(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class ReservationModalBuilder extends StatelessWidget {
  ReservationModalBuilder({
    required this.equipmentId,
    required this.equipmentGymId,
  }) {
    reservationController = ReservationModalController(
        equipmentId: equipmentId, equipmentGymId: equipmentGymId);
  }

  final int equipmentId;
  final int equipmentGymId;
  late final ReservationModalController reservationController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 15.h),
              child: NewfitTextBoldXl(
                text: reservationController
                        .equipmentSpec.value?.equipment_gym_name ??
                    '',
                textColor: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: 60.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  reservationController.equipmentList.value?.equipments_count ??
                      0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    reservationController.selectNewSpec(index);
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
                                    color: reservationController
                                                .selectedIndex.value ==
                                            index
                                        ? AppColors.main.withOpacity(0.5)
                                        : Colors.transparent,
                                    width: 2.w)),
                            child: const Image(
                              image: AssetImage('images/image_equipment_1.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          const TimeInfo(),
          Timepicker(
            reservationModalController: reservationController,
          ),
          SizedBox(height: 10.h),
          TimeButtons(
            reservationModalController: reservationController,
          ),
          SizedBox(height: 10.h),
          NewfitButton(
              buttonText: '예약',
              buttonColor: AppColors.main,
              onPressFuntion: () {})
        ],
      ),
    );
  }
}

class TimeInfo extends StatelessWidget {
  const TimeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      width: 320.w,
      child: Column(
        children: [
          Row(
            children: [
              const NewfitTextMediumMd(
                  text: '시작 시간', textColor: AppColors.black),
              const Spacer(),
              Container(
                width: 90.w,
                height: 27.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.secondary,
                ),
                child: const Center(
                  child: NewfitTextMediumMd(
                    text: "12:00",
                    textColor: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              const NewfitTextMediumMd(
                  text: '종료 시간', textColor: AppColors.black),
              const Spacer(),
              Container(
                width: 90.w,
                height: 27.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.unabledGrey,
                ),
                child: const Center(
                  child: NewfitTextMediumMd(
                    text: "12:30",
                    textColor: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TimeButtons extends StatelessWidget {
  TimeButtons({super.key, required this.reservationModalController});

  final ReservationModalController reservationModalController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 325.w,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: buttonInfo.length,
        itemBuilder: (context, index) {
          return Obx(() {
            return _TimeButton(
              index: index,
              onTapFunc: reservationModalController.updateButtonPressed,
              buttonText: buttonInfo[index].buttonText,
              duration: buttonInfo[index].duration,
              buttonColor: reservationModalController.buttonPressed[index]
                  ? AppColors.main
                  : AppColors.unabled,
            );
          });
        },
      ),
    );
  }

  List<ReservationButtonInfo> buttonInfo = [
    ReservationButtonInfo(duration: 5),
    ReservationButtonInfo(duration: 10),
    ReservationButtonInfo(duration: 15),
    ReservationButtonInfo(duration: 20),
    ReservationButtonInfo(duration: 25),
    ReservationButtonInfo(duration: 30),
  ];
}

class _TimeButton extends StatelessWidget {
  const _TimeButton({
    required this.buttonText,
    required this.duration,
    required this.buttonColor,
    required this.index,
    required this.onTapFunc,
  });

  final String buttonText;
  final int duration;
  final Color buttonColor;
  final int index;
  final void Function(int) onTapFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunc(index);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Container(
          width: 50.w,
          height: 30.h,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(30.h))),
          child: Center(
            child: NewfitTextMediumMd(
              text: buttonText,
              textColor: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ReservationButtonInfo {
  ReservationButtonInfo({
    required this.duration,
  }) {
    buttonText = '$duration분';
  }

  final int duration;
  late String buttonText;
}

class Timepicker extends StatelessWidget {
  const Timepicker({required this.reservationModalController});

  final ReservationModalController reservationModalController;

  @override
  Widget build(BuildContext context) {
    final double indicatorMaximumPadding =
        (MediaQuery.of(context).size.width - 60.w) * 24 / 30;
    final double indicatorUnit = indicatorMaximumPadding / 24.0;
    final double additionalSpaceUnit = indicatorMaximumPadding / 5;
    final double additionalSpace = additionalSpaceUnit *
        (reservationModalController.startTime.value.minute % 5);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        double delta = details.primaryDelta!;

        if (reservationModalController.positionX.value >= 0 &&
            reservationModalController.positionX.value <=
                indicatorMaximumPadding) {
          reservationModalController.positionX.value += delta;
        } else if (reservationModalController.positionX.value < 0) {
          reservationModalController.positionX.value = 0;
        } else if (reservationModalController.positionX.value >=
            indicatorMaximumPadding) {
          reservationModalController.positionX.value = indicatorMaximumPadding;
        }
        int currentIndicatorIndex =
            reservationModalController.positionX.value ~/ indicatorUnit;

        if (currentIndicatorIndex !=
            reservationModalController.indicatorIndex) {
          reservationModalController.indicatorIndex = currentIndicatorIndex;
        }
      },
      onHorizontalDragEnd: (details) {
        reservationModalController.positionX.value =
            reservationModalController.indicatorIndex * indicatorUnit;
      },
      child: Obx(
        () {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: reservationModalController.positionX.value >= 0
                      ? reservationModalController.indicatorIndex *
                              indicatorUnit +
                          20.w
                      : 20.w,
                  right: reservationModalController.positionX.value <= 310
                      ? 0
                      : 20.w,
                ),
                child: IndicatorContainer(),
              ),
              SizedBox(
                width: 360.w,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    padding: EdgeInsets.only(left: 30.w),
                    width: 300.w,
                    height: 15.h,
                    decoration: const BoxDecoration(color: AppColors.unabled),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 15.w),
                  Text(
                    "${DateFormat.Hm().format(reservationModalController.startTime.value)}",
                    style: TextStyle(
                      color: AppColors.textUnabled,
                      fontSize: 12.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${DateFormat.Hm().format(reservationModalController.endTime.value)}",
                    style: TextStyle(
                      color: AppColors.textUnabled,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(width: 15.w),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

class IndicatorContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      height: 20.w,
      child: CustomPaint(
        painter: TrianglePainter(),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.main
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final double length = size.height;
    final double radius = length / 10;

    final path = Path()
      ..moveTo(radius * sqrt(3), 0)
      ..lineTo(length - radius * sqrt(3), 0)
      ..arcToPoint(Offset(length - radius, radius * sqrt(3)),
          radius: Radius.circular(radius))
      ..lineTo(length / 2 + radius * sqrt(3) / 2,
          length * sqrt(3) / 2 - 3 / 2 * radius)
      ..arcToPoint(
          Offset(length / 2 - radius * sqrt(3) / 2,
              length * sqrt(3) / 2 - 3 / 2 * radius),
          radius: Radius.circular(radius))
      ..lineTo(radius, radius * sqrt(3))
      ..arcToPoint(Offset(radius * sqrt(3), 0), radius: Radius.circular(radius))
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
