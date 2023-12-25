import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_fit/app/controller/home_page_controller.dart';
import 'package:new_fit/app/data/model/menu/dropdown_constants.dart';
import 'package:new_fit/app/view/common/newfit_button.dart';
import 'package:new_fit/app/view/common/newfit_dropdown_menu.dart';
import 'package:new_fit/app/view/theme/app_colors.dart';
import 'package:new_fit/app/view/theme/app_fontweight.dart';

import '../../routes/app_pages.dart';
import '../theme/app_string.dart';

class NewfitEquipmentListCell extends StatelessWidget {
  const NewfitEquipmentListCell({
    required this.equipmentTitle,
    this.imageRoute = AppString.defaultEquipment,
    required this.currentStatus,
    super.key,
    required this.equipmentId,
    required this.equipmentGymId,
  });

  final int equipmentId;
  final int equipmentGymId;
  final String equipmentTitle;
  final String imageRoute;
  final int currentStatus;

  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.find();

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8.h, 0, 0),
      child: GestureDetector(
        onTap: () {
          controller.navigateTo(
              route: Routes.HOME_RESERVATION,
              args: [equipmentId, equipmentGymId]);
        },
        child: Container(
          width: 320.w,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
            border: Border.all(color: AppColors.grayDisabled),
          ),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(width: 3.w),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image(
                        width: 64.w,
                        height: 50.h,
                        image: AssetImage(imageRoute),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      equipmentTitle,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 0),
                  child: Row(
                    children: [
                      Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: AppColors.main,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      if (currentStatus == 1)
                        Text(
                          AppString.str_reservation_available,
                          style: TextStyle(
                            color: AppColors.main,
                            fontWeight: AppFontWeights.extrabold,
                            fontSize: 10.sp,
                          ),
                        )
                      else
                        Text(
                          AppString.str_reservation_unavailable,
                          style: TextStyle(
                            color: AppColors.warningText,
                            fontWeight: AppFontWeights.extrabold,
                            fontSize: 10.sp,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewfitEquipmentListWithoutAvailableCell extends StatelessWidget {
  const NewfitEquipmentListWithoutAvailableCell({
    required this.equipmentTitle,
    this.imageRoute = AppString.defaultEquipment,
    super.key,
    required this.equipmentGymId,
    required this.onTap,
    required this.checked,
    required this.startTime,
    required this.endTime,
  });

  final int equipmentGymId;
  final String equipmentTitle;
  final String imageRoute;
  final VoidCallback onTap;
  final bool checked;
  final DateTime startTime;
  final DateTime endTime;

  String reservationTime() {
    final now = DateTime.now();

    bool sameDay = (now.year == startTime.year) &&
        (now.month == startTime.month) &&
        (now.day == startTime.day);

    if (sameDay) {
      return "${DateFormat('HH:mm').format(startTime)} ~ ${DateFormat('HH:mm').format(endTime)}";
    } else {
      return DateFormat('MM월 dd일').format(startTime);
    }
  }

  bool isOverdue() {
    return endTime.isBefore(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2.w, 8.h, 2.w, 0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 320.w,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              strokeAlign: BorderSide.strokeAlignOutside,
              color: checked ? AppColors.main : AppColors.unabledGrey,
              width: checked ? 2.w : 1.w,
            ),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(width: 3.w),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image(
                        width: 64.w,
                        height: 50.h,
                        image: AssetImage(imageRoute),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    Text(
                      equipmentTitle,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: AppFontWeights.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 0),
                  child: Column(
                    children: [
                      Text(
                        reservationTime(),
                        style: TextStyle(
                          color: isOverdue()
                              ? AppColors.warningText
                              : AppColors.main,
                          fontWeight: AppFontWeights.extrabold,
                          fontSize: 10.sp,
                        ),
                      ),
                      const Spacer(),
                      NewfitDropDownMenu(
                        choices: ReservationDropdownConstants.choices,
                        routineDropdownChoiceAction: (menu) async {
                          if (menu ==
                              ReservationDropdownConstants.cancel.menuText) {
                            if (kDebugMode) {
                              print(menu);
                            }
                          }
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onPressFunc(BuildContext context) {
  showModalBottomSheet<dynamic>(
      enableDrag: true,
      context: context,
      backgroundColor: Colors.transparent,

      //backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: 1,
          maxChildSize: 1,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(28.w, 30.h, 0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '천국의 계단 1',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: AppFontWeights.bold,
                        ),
                      ),
                    ),
                  ),
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
                  //TODO : 여기 부분 수정
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0),
                    child: const Row(
                      children: [
                        TmpNewFitButton(),
                        Spacer(),
                        Text(
                          '~',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: AppFontWeights.extrabold,
                          ),
                        ),
                        Spacer(),
                        TmpNewFitButton(),
                      ],
                    ),
                  ),
                  //TODO: 여기까지
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30.h),
                    child: NewfitButton(
                        buttonText: '예약',
                        buttonColor: AppColors.main,
                        onPressFuntion: () {}),
                  )
                ],
              ),
            );
          },
        );
      });
}

class TmpNewFitButton extends StatelessWidget {
  const TmpNewFitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SizedBox(
        width: 130.w,
        height: 48.h,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(AppColors.sky100),
            elevation: MaterialStateProperty.all(0.0),
          ),
          child: Text(
            '5:00',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: AppFontWeights.semibold,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
